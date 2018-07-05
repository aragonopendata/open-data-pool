<?php

namespace ApiRest\WorkerBundle\Controller;

use ApiRest\WorkerBundle\Controller\Triple;
use ApiRest\WorkerBundle\Controller\Isonomia;
use ApiRest\WorkerBundle\Controller\Csv;
use ApiRest\WorkerBundle\Controller\Trazas;

use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\PhpExecutableFinder;

/**
 * Clase realiza las y tareas de worker del proceso de carga, instancia a loas demás clase para:
 * Cargar los datos del CSV, las isonomía, generar las triples , cargarlas en virtuoso y
 * enviar el mail.
 */

class Worker
{

	/**
     * Id de la isonomía
     */
	protected $id;

	/**
     * Nombre de la carpeta donde se almacena el proceso
     */
	protected $carpeta;

	/*
	* El dcType de la isonomía para borrar pude ser "false" si no se requiere borrar 
	*/
	protected $dcType;


	/*
	* El si es true borra los regitros contenidos en el CSV columna 0 URL
	*/
	protected $actualizarItems;

	/**
     * host del virtuoso
     */
	protected $isqlHost;

	/**
     * Base de datos de virtuoso
     */
	protected $isqlDb;

	/**
     * Nº de triples que se cargan por bloque
     */
	protected $isqlBufferLineas;

	/**
     * Protocolo smtp SSL
     */
	protected $smtpEncryption;

	/**
     * Host smtp
     */
	protected $smtpHost;

	/**
     * Puerto smtp
     */
	protected $smtpPort;

	
	/**
     * Nombre cuenta smtp   
     */
	protected $smtpUsername;

	/**
     *  Contraseña cuanta smtp
     */
	protected $smtpPassword;

	/**
     *  Correo origen
     */
	protected $emailFrom;

	/**
     * Correo destino
     */
	protected $emailTo;
	
	/**
     * Adjunto fichero  (trazas o n3) al mail si/no
     */
	protected $mailFile;

	/**
     * array de trazas de error
     */
	protected $trazas;
	         

	public function __construct($id, 
								$carpeta,
								$dcType,
								$actualizarItems,
								$isqlHost, 
								$isqlDb,
								$isqlBufferLineas,
								$smtpEncryption, 
								$smtpHost,
								$smtpPort, 
								$smtpUsername, 
								$smtpPassword, 
								$emailFrom, 
								$emailTo,
								$mailFile,						
								$trazasDebug,
								$trazas) 
	{
		$this->trazas = $trazas;
		$this->id = $id;
		$this->carpeta = $carpeta;
		$this->dcType = $dcType;
		$this->actualizarItems = $actualizarItems;
		$this->isqlHost = $isqlHost;
		$this->isqlDb = $isqlDb;
		$this->isqlBufferLineas = $isqlBufferLineas;
		$this->smtpEncryption = $smtpEncryption;
		$this->smtpHost = $smtpHost;
		$this->smtpPort = $smtpPort;
		$this->smtpUsername = $smtpUsername;
		$this->smtpPassword = $smtpPassword;
		$this->emailFrom = $emailFrom;
		$this->emailTo = $emailTo;
		$this->mailFile = $mailFile;
		$this->trazas->setClase("worker");
		$this->trazas->LineaInfo("__construct", "Inicia el constructor del worker"); 
		$this->trazas->setEscribeTrazasDebug($trazasDebug);

	}
	
	//javi para el de borado por dc:type
    public function Procesa($webPath,$appPath)
	{  
	
		$pathNoporcesados =  sprintf("%s/NoProcesados/%s", $webPath, $this->carpeta);
		$pathPorcesados =  sprintf("%s/Procesados/%s", $webPath, $this->carpeta);
		$pathError =  sprintf("%s/Error/%s", $webPath, $this->carpeta);

		//Si la carpeta no existe informa del error
		if (file_exists($pathNoporcesados. "/datos.csv")) { 
			$this->trazas->LineaInfo("Procesa","Archivo datos CSV encontrado");
		} else{
			$this->trazas->LineaError("Procesa","Archivo datos CSV no encontrado");
		}

		//Si no hay errores carga las isonomia y procesa el esquema 
		if ($this->trazas->SinError()) {
			$this->trazas->LineaInfo("Procesa","Carga las isonomía y procesa el esquema"); 
			$Isonomia = new Isonomia($this->id,
									 $this->trazas,
									 $appPath);
			$PilaTriplesEsquema = $Isonomia->ProcesaEsquema();
		}

		//Si no hay errores carga los datos del archivo CSV
		if ($this->trazas->SinError()) {
			$this->trazas->LineaInfo("Procesa","Carga los datos del archivo CSV"); 
			$Csv = new Csv($pathNoporcesados,$this->trazas);
			$FilasCsv = $Csv->DameCsv();
		}
	

		//Si no hay errores genero las triples
		//Cruza los datos del esquema preparado con los datos del CSV
		if ($this->trazas->SinError()) {
			$this->trazas->LineaInfo("Procesa","Cruza los datos del esquema preparado con los datos del CSV"); 
			$TriplesProcesadas = $this->GeneraTriples($PilaTriplesEsquema,$FilasCsv,$pathNoporcesados);
		}

		if ($this->actualizarItems=="true"){
			if ($this->trazas->SinError()) {
				$this->trazas->LineaInfo("Procesa","Obtengo las uris"); 
				$uris = $Csv->DameUris();
			}
			if (count($uris)>0) {
				if ($this->trazas->SinError()) {
					$this->trazas->LineaInfo("Procesa","Genero los triples que hay que borrar");
					$triples = $this->GeneraTriplesBorrar($uris, $pathNoporcesados);
				}
				//Borro los triples que se quieren actualizar
				if ($this->trazas->SinError()) {
					$this->trazas->LineaInfo("Procesa","Borro los triples a actualizar");
					$this->BorraTriples($triples);
				}
			}
		}

		if ($this->trazas->SinError()) {
			//Borro los triples generados anteriormente
			if ($this->dcType!="false") {
				$this->BorraTriplesDctype();
			}
		}
	
		//Si no hat errores guardo las triples en virtuosos
		if ($this->trazas->SinError()) {
			$this->trazas->LineaInfo("Procesa","Guardo las triples en virtuoso"); 
			$this->GuardaTriplesVirtuoso($pathNoporcesados);
		}

		//Envía correo con la información al administrador
		$this->trazas->LineaInfo("Procesa","Envía correo con la información al administrador"); 
		if ($this->trazas->SinError()) {
			$this->EnviaEmial($pathNoporcesados,TRUE);
		}  else {
			$this->EnviaEmial($pathError, FALSE);
		}
		//borro las capetas que pudieran existir
		try{
			$this->trazas->LineaInfo("Procesa","existe carpeta: " . $pathPorcesados);
			if (file_exists($pathPorcesados)){
				$this->trazas->LineaInfo("Procesa","borro carpeta" . $pathPorcesados);
				array_map('unlink', glob("$pathPorcesados/*.*"));
			}
			$this->trazas->LineaInfo("Procesa","existe carpeta: " . $pathError);
			if (file_exists($pathError)){
				$this->trazas->LineaInfo("Procesa","borro carpeta" . $pathError);
				array_map('unlink', glob("$pathError/*.*"));
			}
		} catch (Exception $e) {
			$this->trazas->LineaError("Procesa",'Excepción capturada: ' . $e->getMessage());
		}
		try{
			//Si hay errores mueve la carpeta, a la capeta raiz de errores
			//Si no hay errores mueve la carpeta a la capeta raiz de Procesados 
			$fileSystem = new Filesystem();
			if ($this->trazas->SinError()) {
				$this->trazas->LineaInfo("Procesa","Mueve la carpeta a la capeta raiz de Procesados");
				$fileSystem->mkdir($pathPorcesados);
				rename($pathNoporcesados,$pathPorcesados);
			} else {
				$this->trazas->LineaInfo("Procesa","Mueve la carpeta a la capeta raiz de errores");
				$fileSystem->mkdir($pathError);
				rename($pathNoporcesados,$pathError);
			}
		} catch (Exception $e) {
			$this->trazas->LineaError("Procesa",'Excepción capturada: ' . $e->getMessage());
		}

		$this->trazas->LineaInfo("Procesa","Fin proceso PUBLICA API");
		return;
	}


    /**
	 * Función que realiza un doble Loop por cada una de las filas del CSV y cada una de los nodos de la isonomia
	 * Parámetros:
	 *    pilaTriples:      array contador de la las triples  (objetos Triple)
	 *    registrosCSV:      array con los datos del archivo CSV
	 *    pathNoporcesados: path de la carpeta donde está el archivo n3 a procesar
	 *                      /web/publicacion/NoProcesados/{$carpeta}
	 * 
	 */
	function GeneraTriples($pilaTriples,$registrosCSV,$pathNoporcesados)
	{    
		$this->trazas->LineaInfo("GeneraTriples","Inicio de generación de triples"); 
		$nombreFichero = $pathNoporcesados . "/datos.n3";    
		//abro fichero para escribir las triples
		$myfile = fopen($nombreFichero, "w+");
		$cuenta=0;
		//por cada registro del CSV
		foreach ($registrosCSV as $filaCVS) 
		{
			//ppor cada linea a parsear de la isonomia
			foreach ($pilaTriples as $triple) 
			{
				//parseo y guardo
				$triple->ProcesaDatos($filaCVS);
				//la triple pude ser nula porque algún campo del archivo CSV esta vacío
				if (!empty($triple->getTripleValor())) {
				fwrite($myfile, $triple->getTripleValor() ."\n");
					$cuenta++;
				} 
			}
		}
		fclose($myfile);
		$this->trazas->LineaInfo("GeneraTriples","Fin de generación de triples.Triples generadas:". $cuenta ); 
	}

	/**
	 * Función que guarda las triples en servidor Virtuoso mediante la herramienta de lines comando isql
	 * Parámetros:
	 * pathNoporcesados:        path de la carpeta donde está el archivo n3 a procesar
	 *                             /web/publicacion/NoProcesados/{$carpeta}     
	 */
	function GuardaTriplesVirtuoso($pathNoporcesados){

		$this->trazas->LineaInfo("GuardaTriplesVirtuoso", sprintf("%s %s %s %s",
																	$pathNoporcesados, 
																	$this->isqlHost,
																	$this->isqlDb,
																	$this->isqlBufferLineas));
		
		// inicilizo la url endpoint de virtuoso
		$url = $this->isqlHost;
		//preparo la plantilla de sparql
		$sql = "INSERT INTO <" . $this->isqlDb  . "> { %s }";
		//$sql = "DELETE { GRAPH <" . $this->isqlDb  ."> { %s }}";
		// informo del archivo de triples
		$nombrefichero = $pathNoporcesados . "/datos.n3";                 
		$query = "" ;
		$maxCarga = $this->isqlBufferLineas;
		$cuenta =0;
		$cuentaTotal =0;
		$cuentaError =0;
		//si el archivo existe lo proceso
		if (file_exists($nombrefichero)){
			$this->trazas->LineaDebug("GuardaTriplesVirtuoso", "El archivo existe lo proceso:" . $nombrefichero); 
			if ($file = fopen($nombrefichero, "r")) {
				// recorro el archivo cada linea es una triple
				$this->trazas->LineaDebug("GuardaTriplesVirtuoso", "recorro el archivo cada linea es una triple"); 
				while(!feof($file)) {
					//leo la triple
					$line = fgets($file);
					//si hay error dejo de cargar
					if ($this->trazas->SinError()) {
						//acumulo las triples linea a linea
						$query = sprintf("%s %s",$query,$line); 
						$cuenta = $cuenta+1;
						//si el total de lineas es igual al buffer lanzo la carga
						if ($cuenta==$maxCarga){
							// parseo con las triples el insert
							$query = sprintf($sql,$query); 
							//lanzo consulta
							$this->trazas->LineaDebug("GuardaTriplesVirtuoso", "Lanzo Consulta: " . $query); 
							$this->LanzaConsulta($url,$query,$this->trazas);
							//cuento para el log
							if (!$this->trazas->SinError()) {
							  $cuentaError =  $cuentaError + $cuenta;
							}
							$cuentaTotal =  $cuentaTotal + $cuenta;
							//inicia el buffer de nuevo
							$cuenta = 0;
							//inicia la query para nueva carga
							$query = "";
						}
					} else {
						//si hay error cuanto el total y las que me han quedado sin cargar
						$cuentaError =  $cuentaError + 1;
						$cuentaTotal =  $cuentaTotal + 1;
					}
				}
				//si hay triples pendientes en la ultima pasada que no llegan al limite del buffer (resto)
				//
				if (!empty(trim($query))) {
					$cuenta = $cuenta -1;
					$this->trazas->LineaDebug("GuardaTriplesVirtuoso", "Lanzo Consulta resto: " . $query); 
					if ($this->trazas->SinError()) {
						$query = sprintf($sql,$query);
						$this->LanzaConsulta($url,$query);
						//si hay error recalculo
						if (!$this->trazas->SinError()) {
							$cuentaError =  $cuentaError + $cuenta;
							$cuentaTotal =  $cuentaTotal - $cuenta;
						} else {
							$cuentaTotal =  $cuentaTotal + $cuenta;
						}
					}
				}
				fclose($file);
				if ($this->trazas->SinError()) {
					$this->trazas->LineaInfo("GuardaTriplesVirtuoso", "Triples insertadas correctas:" . $cuentaTotal); 
				} else {
					$this->trazas->LineaError("GuardaTriplesVirtuoso", "Triples no insertadas:". $cuentaError. " de un total de " . $cuentaTotal); 
				}
			}
		} else {
			$this->trazas->LineaError("GuardaTriplesVirtuoso", "Archivo no encontrado: ". $nombrefichero ); 
		}
	}

	/**
	 * Función que realiza una consulta a Virtuoso para obtener los triples que hay que borrar por dc:type
	 * (falta buscar el nombre del archivo n3, con las triples borradas)
	 * Una vez creado los triples los guarda en un archivo n3 y devuelve el string con todos los triples.
	 * Parámetros:
	 *    uris: Son las uris que hay que modificar
	 *    pathNoporcesados: path de la carpeta donde está el archivo n3 a procesar
	 *                      /web/publicacion/NoProcesados/{$carpeta}
	 * 
	 */
	function GeneraTriplesBorrar($uris, $pathNoporcesados)
	{
		$triples = "";
		$this->trazas->LineaInfo("GeneraTriplesBorrar","Genero los triples que tengo que borrar"); 
		foreach ($uris as $uri) {
			
			//$query = $this->isqlHost."?default-graph-uri=&query=select+%3Fs+%3Fp+%3Fo+from+%3Chttp%3A%2F%2Fopendata.aragon.es%2Fgraph%2Fpool%3E%0D%0Awhere+%0D%0A%7B%0D%0A%09%3C$uri%3E+dc%3Asource+%3Fsource.+%3Fs+dc%3Asource+%3Fsource.+%3Fs+%3Fp+%3Fo.+%0D%0A%7D%0D%0A&should-sponge=&format=application%2Fsparql-results%2Bxml&timeout=0&debug=on&run=+Run+Query+";
			$query = "select ?s ?p ?o from <$this->isqlDb> where { <$uri> dc:source ?source. ?s dc:source ?source. ?s ?p ?o. }";
			//Inicializo la peticion get para obtener el xml con los triples
			$xmlTriples = $this->LanzaConsultaRespuesta($this->isqlHost,$query);
			
			if (empty ($xmlTriples)) {
				$this->trazas->LineaError("GeneraTriplesBorrar", "No se ha obtenido ningún triple a borrar");
			}
			if ($this->trazas->SinError()) {
				$listadoTriples = $xmlTriples->{"results"};		
				//Genero los triples
				$elementos = $listadoTriples->{"result"}->count ();
				for ($i = 0; $i < $elementos; $i ++) {
					$result = $listadoTriples->result[$i];
					for ($x = 0; $x < $result->{"binding"}->count (); $x++) {
						$blindig = $result->binding [$x];
				
						$uri = $blindig->{'uri'}->__toString ();           
				
						$literal = $blindig->{'literal'};
					
						if (empty ($literal)) {
							$triples .= "<$uri>";
						}
						else {
							$atributos = (array) $literal->attributes ();
								
							$typo = "";
							if ((count ($atributos)) > 0) {
								$atributos = $atributos ["@attributes"];
								$typo = "^^<$atributos[datatype]>";
							}
								
							$triples .= "\"$literal\"".$typo;
						}   
					}
					$triples .= " .\n";  
				}
				$this->trazas->LineaInfo("GeneraTriplesBorrar","Guardo los triples en datosBorrar.n3"); 
				$nombreFichero = $pathNoporcesados . "/datosBorrar.n3";    
				//abro fichero para escribir las triples
				$myfile = fopen($nombreFichero, "w+");
				
				fwrite($myfile, $triples);
				
				fclose($myfile);
			}	
		}
		
		$this->trazas->LineaInfo("GeneraTriplesBorrar","Fin de generación de triples a borrar."); 
		return $triples;
	}
	
	//Funcion que manda las consultas de borrado de las tripes generas
	//La funcion ba lanzando lotes de tripes del tamaño de la configuración MaxCarga
	//La funcion recive como parameyros la cadena con todas las tripes
	function BorraTriples($triples) {		
		$this->trazas->LineaInfo("BorraTriples","Comienzo a borrar");	
        //creo un array de triples
		$tripleArray = explode(" .\n",$triples);
		//recojo el total 
		$total = count($tripleArray);
		$this->trazas->LineaInfo("BorraTriples","Comienzo a borrar");	
		$this->trazas->LineaInfo("BorraTriples",'La variable $triples tiene '. count($total));
		//inicilizo varibles
		$cuenta=0;
		$maxCarga = $this->isqlBufferLineas;
		$totalborradas=0;
		//difenecio indice de total borradas porque pued eque el array de sentencias que no son triples.
		$indice=0;
		//miestras el total sea mayot que el total borradas sigo borrando
		while($total>$totalborradas) {
			$tripleBorrar= "";
			for($i=0;$i<$maxCarga;$i++) {
				if ($total>$totalborradas) {
					if (isset($tripleArray[$indice])) {
						if (!empty($tripleArray[$indice])) {
							$tripleBorrar .= "$tripleArray[$indice].\n"; 
							$indice++;
						}
					}
					$totalborradas++;
				}
			}
			//lanzo las consulta de borrado
			$consulta = "delete data from <$this->isqlHost> { $tripleBorrar }";
			$this->trazas->LineaDebug("BorraTriples",'Borro: '. $totalborradas);
			$this->LanzaConsulta($this->isqlHost,$consulta,$this->trazas);
		}	
	}
	
	//función que envia la query de borrado por dc:type
	//No hay parámetros porque pertenecen a la clase
	//Cra la plantilla y la envía
	function BorraTriplesDctype() {	
		$this->trazas->LineaInfo("borraTriplesDctype","Comienzo a borrar");	
		$consulta = "DELETE FROM GRAPH <".$this->isqlDb."> { ?s ?p ?o }  where {?sujetoTipo dc:type <$this->dcType>. ?sujetoTipo dc:source ?source. ?s dc:source ?source. ?s ?p ?o. }";	
		// inicilizo la url endpoint de virtuoso
		$this->LanzaConsulta($this->isqlHost,$consulta,$this->trazas);
	}
	
	/**
	 * Función que lanza la consulta POST sobre VIRTUOSO
	 *  Parámetros:
	 *    pathNoporcesados:  path de la carpeta donde está el archivo n3 a procesar
	 *                      /web/publicacion/NoProcesados/{$carpeta}
	 *    trazas:            objeto de trazas
	 *    url:               url endpoint del servicio web virtuoso (http://localhost:8890/sparql)
	 *    query:             spaql de inserción
	 */
	function LanzaConsulta($url,$query)
	{
		$this->trazas->LineaDebug("LanzaConsulta", "Query:" . $query);  
		$data = array('query' => $query , 
					'timeout' => 0,
					'format' => 'text/csv');
		// use key 'http' even if you send the request to https://...
		$options = array(
			'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded",
				'method'  => 'POST',
				'encoding' => 'UTF8',
				'content' => http_build_query($data)
			)
		);
		$context  = stream_context_create($options);
		$result = file_get_contents($url, false, $context);
		if ($result === FALSE) { 
			$this->trazas->LineaError("LanzaConsulta", "Se a producido un error en la carga:" .$query); 
		} else {
			$this->trazas->LineaDebug("LanzaConsulta", "Resultado:" . $result);  
		}
		
	}   
	
	/**
	 * Función que lanza la consulta POST sobre VIRTUOSO
	 *  Parámetros:
	 *    url:               url endpoint del servicio web virtuoso (http://localhost:8890/sparql)
	 *    query:             spaql de inserción
	 */
	function LanzaConsultaRespuesta($url,&$query)
	{
		$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("Inicio: url:%s , query:%s", $url, $query));
	    $resultArray = array();
		$data = array('query' => $query , 
					'timeout' => 0,
					'format' => 'application/sparql-query-results+xml',
					'Content-Type' => 'application/x-www-form-urlencoded');
		// use key 'http' even if you send the request to https://... 
		$options = array(
			    'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded",
				'method'  => 'POST',
				'encoding' => 'UTF8',
				'content' => http_build_query($data)
			)
		);
		$context  = stream_context_create($options);
		$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("SPARQL>>>: %s", $query));
		$result = @file_get_contents($url, false, $context);
		
		//si es error informo del mismo
		if ($result === FALSE) { 
			$this->error400 = "Se a producido un error en la carga:";
			$this->trazas->LineaError("LanzaConsultaRespuesta",trim($this->error400));
			$this->error = true;
		} else {
			//si no es error
			$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("Se ha realizado la consulta correctamente"));
			$resultArray = simplexml_load_string ($result,'SimpleXMLElement', LIBXML_NOCDATA);
		}
		return $resultArray;	
	}  

	/**
	 * Función que envía correo al administrador adjuntando el archivo n3 si nio hay error o el de trazas 
	 * hay error
	 * Parámetros:
	 *    path:               path de la carpeta donde está el archivo n3 a procesar
	 *                        /web/publicacion/NoProcesados/{$carpeta}
	 *    sinError:           Indica si ha habido error o no
	 *    trazas:             Objeto de trazas
	 * 
	 */
	function EnviaEmial($path,$sinError)
	{

		$trazaTexto = sprintf("path %s email_protocol: %s email_host: %s email_port:%s email_username:%s  email_password:%s  email_from:%s email_to: %s",
								$path,
								 
								$this->smtpEncryption, 
								$this->smtpHost, 
								$this->smtpPort , 
								$this->smtpUsername , 
								$this->smtpPassword, 
								$this->emailFrom, 
								$this->emailTo );

		$this->trazas->LineaDebug("EnviaEmial",'Envia mail '. $trazaTexto  );
		try 
		{
			$this->trazas->LineaDebug("EnviaEmial",'Envia mail configuro usuario SMTP' );
			if ($this->smtpEncryption !== "none") {
				$transport = (\Swift_SmtpTransport::newInstance($this->smtpHost ,$this->smtpPort , $this->smtpEncryption));
			} else {
				$transport = (\Swift_SmtpTransport::newInstance($this->smtpHost ,$this->smtpPort));
			}
		    if (($this->smtpUsername!="none") && ($this->smtpPassword !=="none")) {
				$transport->setUsername($this->smtpUsername);
				$transport ->setPassword($this->smtpPassword);
			}
			$this->trazas->LineaDebug("EnviaEmial",'Envia mail configuro Swift_Mailer' );
			// Create the Mailer using your created Transport
			$mailer = \Swift_Mailer::newInstance($transport);
			if ($sinError) {
				$body = "El proceso de publicacion ha terminado con éxito \n. Ajuntamos el archivo de triples generadas";
			} else {
				$body = "El proceso de publicacion ha terminado con errores \n. Ajuntamos el archivo de log generado";
			}
			$this->trazas->LineaDebug("EnviaEmial",'Envia mail configuro creo mensaje' );
			// Create a message
			$message = (\Swift_Message::newInstance('AodPool mensaje fin proceso Publicación'));
			$message->setFrom([$this->emailFrom => 'AodPool']);
			$message->setTo([$this->emailTo => 'Administrador AodPool']);
			$message->setBody( $body );
            if ($this->mailFile){
				$this->trazas->LineaDebug("EnviaEmial",'Envia mail configuro adjunto archivo' );
				if ($sinError) {  
					$message->attach(\Swift_Attachment::fromPath($path . '/datos.n3'));
				} else {
					$message->attach(\Swift_Attachment::fromPath($this->trazas->DamePath()));
				}
		    }
			$this->trazas->LineaDebug("EnviaEmial",'Envia mail envío' );
			// Send the message
			$result = $mailer->send($message);
		} catch (Exception $e) {
				$this->trazas->LineaDebug("EnviaEmial",'Error envío mail Excepción capturada: '.  $e->getMessage());
		}
	}
}