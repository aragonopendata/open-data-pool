<?php

namespace ApiRest\AodPoolBundle\Controller\Virtuoso;

use ApiRest\AodPoolBundle\Controller\Virtuoso\Triples;
use ApiRest\AodPoolBundle\Controller\Utility\Trazas;


/**
* Acceso lectura a la Base de datos virtuoso 
* La clase tiene las funcionalidades: 
*  1 -Contiene una funcion por cada uno ade los acessos que se desea realizar con expresión a parsear
*  2.-Contiene un acceso via http lanzando la consulta sparql 
*  3.- Devuelve array con respuesta y/o la gestion de errores
*/
class Acceso{

	/**
     * Id de la isonomía
     */
	protected $id;

	/**
     * Nombre de la carpeta donde se almacena el proceso
     */
	protected $carpeta;

	/**
     * host del virtuoso
     */
	protected $isqlHost;

	/**
     * Base de datos de virtuoso
     */
	protected $isqlDb;

	/**
     * array de trazas de error
     */
	protected $trazasdebug;



	/**
     * Flag de error para sacar en 400
     */
	protected $error = false;

	/**
     * Cadena de error para sacar en 400
     */
	protected $error400 = "";

	/**
     * Array de prefijos
     */
	protected $prefijos = array();


	public function getError(){
		return $this->error;
	}

	public function getError400(){
		return $this->error400;
	}

	//clase de trazas
	protected $trazas=null;

	public function setTrazas($trazas){
        $this->trazas = $trazas;
    }

    public function getTrazas(){
        return $this->trazas;
	}
	
    public function getIsqlDb(){
        return 	$this->isqlDb;
	}

	protected $directoryPath;

	/**
	* Constructor con objeto logger de trazas y los parámetros de configuración 
	*/
	public function __construct() 
	{
			 
	}
	
	protected function configure()
    {
		$this->setName('Virtuoso_Acceso');     
	}	

	public function Configura($parametros, $directoryPath) {
		$trazas = new Trazas($directoryPath);
		$this->directoryPath = $directoryPath;
		$trazas->setClase("Acceso");
		$this->setTrazas($trazas);	
		$this->trazas->LineaDebug("Configura","Llamada a Función");
		$this->parametros = $parametros;
		$this->error= false;
		$this->error400="";
		$this->error = $this->error && (!isset($parametros['isql_host']));
		$this->error = $this->error && (!isset($parametros['isql_db']));  
		$this->error = $this->error && (!isset($parametros['trazas_debug']));
		if ($this->error) {
			$this->error400 = "No se han informado alguno de los parámetros de configuración AodPool Consulta";
			$this->trazas->LineaError("Configura",trim($this->error400));
		} else {
			$this->isqlHost = trim($parametros['isql_host']);
			$this->isqlDb = trim($parametros['isql_db']);
			$this->trazasdebug = trim($parametros['trazas_debug']);
			$this->trazas->setEscribeTrazasDebug($this->trazasdebug);
			$this->trazas->LineaDebug("Configura",sprintf("Inicializo la clase: %s, %s, %s",$parametros['isql_host'],$parametros['isql_db'],$parametros['trazas_debug'])); 
		}
	}


	/**
	* Función que corresponde al servicio get-query.
	* dado una url devuelve el rdf completo de esa entidad
	* http://www.w3.org/ns/org#hasSite@http://www.w3.org/ns/org#siteAddress@http://www.w3.org/2006/vcard/ns#hasAddress@http://www.w3.org/2006/vcard/ns#locality='ABIEGO'|http://www.w3.org/ns/org#subOrganizationOf=<http://opendata.aragon.es/pool/datos-comarca/07>
	*/
	public function DameQuery($filtes, $pageSize, $page, $orderBy){
		$this->error= false;
		$this->error400="";
		$condicionOrderBy ="";

		$resupuesta = array();
		$this->trazas->LineaDebug("DameQuery:",sprintf("parametros: filtes:%s, pageSize:%s, page:%s, orderBy:%s",
													  $filtes, $pageSize, $page, $orderBy));
	    $prefijos="";
	   //valido que el parmetro es una url
	   $arrayFilters = explode("|",$filtes);
	   if (count($arrayFilters)>0) {
		   $prefijos = $this->DamePrefijos($filtes);
		   $this->trazas->LineaDebug("DameQuery", sprintf("prefijos: %s",$prefijos));	
		   $this->trazas->LineaDebug("DameQuery", sprintf("filtes validados:%s",$filtes));			
	   } else {
		   //si no es correcto informo del error y marco el falg a true
		   $this->error400 = sprintf("Filtes validados: %s",$filtesuri);
		   $this->trazas->LineaError("DameRdf",trim($this->error400));
		   $this->error = true; 
	   }
	   //valido que el pageSize es entero	
	   if (!$this->error){ 
			if (is_numeric($pageSize)) {
				$pageSize = intval($pageSize);
				$this->trazas->LineaDebug("DameQuery", sprintf("pageSize validados:%s",$filtes));	
			} else {
				//si no es correcto informo del error y marco el falg a true
				$this->error400 = sprintf("pageSize no es un número entero: %s",$pageSize);
				$this->trazas->LineaError("DameRdf",trim($this->error400));
				$this->error = true; 
			}
	   }
        //valido que el pageSize es entero	
	   if (!$this->error){	
			if (is_numeric($page)) {
				$page = intval($page);
				$this->trazas->LineaDebug("DameQuery", sprintf("page validados:%s",$filtes));	
			} else {
				//si no es correcto informo del error y marco el falg a true
				$this->error400 = sprintf("page no es numero: %s",$pageSize);
				$this->trazas->LineaError("DameRdf",trim($this->error400));
				$this->error = true; 
			}
	   }
	   //order by es un parametro opcional si existe creo la condicion sparql necesaria
	   if (!$this->error){	
		   if (!empty($orderBy)) {
			  $condicionOrderBy = sprintf(" ?s %s ?oderby . ", $orderBy);
		   }
	   }
	   //si no es error creo la plantilla y la parseo
	   if (!$this->error){	
           //primero creo las condiciones del filtro
		   $stringFiltres = "";
		   foreach ($arrayFilters as $filter) {
			    $stringFiltres .= $this->DameFiltro($filter);
		   }
		   //añado la ultima condicion si orderby esta relleno
		   $stringFiltres  .=  $condicionOrderBy;

		   //emprizo con la plantilla que voy creando segun los parámetros
		   //primero las condiciones del filtro con el from
		   $sql = $prefijos . " select ?s from <%s> where { %s }";
		   //si existe order by añado la clausula orderby que ya esta incorporada en las condiciones
		   if (!empty($orderBy)) {
			$sql .= " order by ?oderby";
		   } else {
			$sql .= " order by ?s";
		   }
		   //si la pagina es mayot que 1 (la primera) añado el offseet
		   if ($page>1) {
			$offseet = sprintf(" offset %d",$page*$pageSize);
			$sql .= $offseet;
		   }
		    //si la el tamaño de la pagina es mayor que 0 añado el limite
		   if ($pageSize>0) {
			$limit = sprintf(" limit %d",$pageSize);
			$sql .= $limit;
		   }
		   //con la platilla ya creada parseo las condiciones y el from
		   $query = sprintf($sql, $this->isqlDb, $stringFiltres);
		   $this->trazas->LineaDebug("DameQuery", sprintf("lanzo sparql: %s",$query));	

		   //lanzo la consulta a vituoso esperando array de sujetos		
		   $resupuesta = $this->LanzaConsulta($this->isqlHost,$query,"SUJETOS");
	   }
	   return $resupuesta;
	}
	
	/**
	 * Función que dada una cadena de texto devuelve el filtro o filtros con formato sparql
	 * Los filtos pueden estar anidados por @ y condicionados con $ para el reverso
	 * REsta función es llamada poc cada uno de los filtros del parámetro filtesrs
	 */
	public function Damefiltro($filter){
		$filtro = "";
		//separo la condicion del valor 
		$filterPart = explode("=",$filter);
		//si hay condicon y valor 
		if (count($filterPart)==2) {
			//compruebo que existe operador '@' (filtros anidados)
			$pos = strpos($filterPart[0], "@");
			//si no hay es una condicion simple 
			if ( $pos === FALSE) {
				 $filtro  = sprintf("?s %s %s .",$filterPart[0],$filterPart[1]);
			} else {
				//en caso contrario miro si existe operador $ (condicion reverso para la primara condición)
				$condolar = (boolean)(strpos($filterPart[0], "$")===0);
				//separo los anidamientos por '@'
				$filterConditionPart = explode("@",$filterPart[0]);
				$count = 0;
				//por cada uno de ellos creo la condicicón anidada
				foreach ($filterConditionPart as $filterCondition) {
					//en caso que sea la primara condiciopn y tenga reverso cruzo las condiciones
					if ($count==0){
						if ($condolar) {
							$filtro .=  sprintf("?s%s %s ?s . ",$count, $filterCondition);
						} else {
							//si no creo el anidamiento normalmente
							$filtro .=  sprintf("?s %s ?s%s . ", $filterCondition, $count);
						}
				    } else {
						$filtro .=  sprintf("?s%s %s ?s%s . ",$count-1, $filterCondition, $count);		
					}
					$count++;
				}
				//repplazo la ultima variable con el valor a buscar
				$ultimo = sprintf("?s%s",$count-1);
				$filtro = str_replace($ultimo,$filterPart[1],$filtro);
			}
		}
		return $filtro;
	}
	
	/**
	 * Función que dada una cadena de texto devuelve el encabezado con los prefijos sparqs
	 */
	public function DamePrefijos($filter){
	   $prefijos=""; 
	   if (count($this->prefijos)==0) {
		$this->prefijos = array('ei2a'=>'http://opendata.aragon.es/def/ei2a#',
								'org'=>'http://www.w3.org/ns/org#',
								'harmonise'=>'http://protege.stanford.edu/rdf/HTOv4002#',
								'gtfs:http'=>'//vocab.gtfs.org/terms#',
								'wisdom'=>'http://www.semanticwater.com/WISDOM#',
								'dc:http'=>'//purl.org/dc/elements/1.1/',
								'owl'=>'http://www.w3.org/2002/07/owl#',
								'time'=>'http://www.w3.org/2006/time#',
								'foaf'=>'http://xmlns.com/foaf/0.1/',
								'locn'=>'http://www.w3.org/ns/locn#',
								'vcard'=>'http://www.w3.org/2006/vcard/ns#',
								'wgs84_pos'=>'http://www.w3.org/2003/01/geo/wgs84_pos#',
								'person'=>'http://www.w3.org/ns/person#',
								'dul'=>'http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#',
								'event'=>'http://purl.org/NET/c4dm/event.owl#',
								'rdf'=>'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
								'rdfs'=>'http://www.w3.org/2000/01/rdf-schema#');
	    }
       foreach ($this->prefijos as $key => $value) {
		   if (strpos($filter,$key)!==false){
			$prefijo = sprintf("PREFIX %s:<%s> ",$key, $value);
			$prefijos .=$prefijo;
		   }
	   }
	   return  $prefijos;
	}


	/**
	* Funcion que corresponde al servicio get-rdf.
	* da do una url devuelve el rdf completo de esa entidad
	*/
	public function DameRdf($uri){
		 $this->error= false;
		 $this->error400="";
		 $resupuesta = array();
		 $this->trazas->LineaDebug("DameRdf",$uri);
		//valido que el parmetro es una url
	    if (filter_var($uri, FILTER_VALIDATE_URL)) {
			$this->trazas->LineaDebug("DameRdf", sprintf("Url validada con exito: %s",$uri));			
		} else {
			//si no es correcto informo del error y marco el falg a true
			$this->error400 = sprintf("Url no validada: %s",$uri);
			$this->trazas->LineaError("DameRdf",trim($this->error400));
			$this->error = true; 
		}	
		if (!$this->error)	{	
			//si no es error creo la plantilla y la parseo		 
			//$sql ="select <%s> ?p ?o from <%s> where { <%s> ?p ?o . }";
			//$query = sprintf($sql, $uri, $this->isqlDb, $uri);
			
			//$sql ="prefix dc: <http://purl.org/dc/elements/1.1/> select ?s ?p ?o from <%s> where {<%s> dc:source ?source. ?s ?p ?o. ?s dc:source  ?source}"
			//$query = sprintf($sql, $this->isqlDb, $uri);
			
			$sql ="select <%s> ?p ?o from <%s> where {<%s> ?p ?o. }";			
			$query = sprintf($sql, $uri, $this->isqlDb, $uri);
			$this->trazas->LineaDebug("DameRdf", sprintf("lanzo sparql: %s",$query));	
			//lanzo la consulta a vituoso		
			$resupuesta = $this->LanzaConsulta($this->isqlHost,$query,"TRIPLES");
		}
        return $resupuesta;
	}

	/**
	 * Función que lanza la consulta  sobre VIRTUOSO
	 * Diseñada para la web
	 *  Parámetros:
	 *    query: spaql de inserción 
	 */
	public function DameConsulta($query){
		try{
			$resupuesta = $this->LanzaConsulta($this->isqlHost,$query,"TRIPLES");
		} catch(Exception $e)
		{
			$valorError = $e->getMessage();
			throw new Exception($e->getMessage(), 1);
		}
		return $resupuesta;
	}

	 /**
	 * Función que lanza la consulta  sobre VIRTUOSO
	 * Diseñada para la web
	 *  Parámetros:
	 *    query: spaql de inserción 
	 */
	public function DameConsultaWeb(&$query,$tipo){
		try{
			$resupuesta = $this->LanzaConsulta($this->isqlHost,$query,$tipo);
		} catch(Exception $e)
		{
			$valorError = $e->getMessage();
			throw new Exception($e->getMessage(), 1);
		}
		return $resupuesta;
	}

	/**
	 * Función que lanza la consulta POST sobre VIRTUOSO
	 *  Parámetros:
	 *    url:               url endpoint del servicio web virtuoso (http://localhost:8890/sparql)
	 *    query:             spaql de inserción
	 */
	function LanzaConsulta($url,&$query,$tipoRespuesta)
	{
		$this->trazas->LineaDebug("LanzaConsulta", sprintf("Inicio: url:%s , query:%s", $url, $query));
	    $resultArray = array();
		$data = array('query' => $query , 
					'timeout' => 0,
					'format' => '"text/csv');
		// use key 'http' even if you send the request to https://... 
		$options = array(
			    'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
				'method'  => 'POST',
				'encoding' => 'UTF8',
				'content' => http_build_query($data)
			)
		);
		$context  = stream_context_create($options);
		$this->trazas->LineaDebug("LanzaConsulta", sprintf("SPARQL>>>: %s", $query));
		$result = @file_get_contents($url, false, $context);
		//si es error informo del mismo
		if ($result === FALSE) { 
			$this->error400 = "Se a producido un error en la carga:";
			$this->trazas->LineaError("LanzaConsulta",trim($this->error400));
			$this->error = true;
		} else {
			//si no es error
			$this->trazas->LineaDebug("LanzaConsulta", sprintf("Se ha realizado la consulta correctamente"));
			//creo un nuevo pareaseador de triples
			$parsedorTriples = new Triples($this->directoryPath,$this->trazasdebug);
			// recojo el array convertido de la cadena de texto result
			if ($tipoRespuesta=="TRIPLES") {
				$resultArray = $parsedorTriples->DameTriples($result);
			} else if ($tipoRespuesta=="SUJETOS") {
				$resultArray = $parsedorTriples->DameSujetos($result);
			} else {
				$resultArray = array("respuesta"=>$result);
			}
			if ($parsedorTriples->getError()) {
				//si el parseador tiene error lo recojo para mostrtralo como 400
				$this->error = true;
				$this->error400 = $parsedorTriples->error400;
			}
		}
		return $resultArray;	
	}  
	
}