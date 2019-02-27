<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

/*
 * Esta funcion descarga el XML correspondiente a una vista, si la descarga es exitosa
 * devuelve un array con los datos descargados, la ruta donde  
 * se guarda el fichero, en caso contrario devuelve un array con un boleano a FALSE.
 */
function DescargarVistaAOD($idVista, $numPagina)
{
    if (!is_int($idVista) || !is_int($numPagina)) {
        logErrores("TPAOD: Error al descargar la vista los identificadores no son numericos, el numero de pagina: \"$numPagina\" o numero de vista: \"$idVista\" no son numericos.");
        return FALSE;
    }
    global $RutaTrabajo;
    logErrores("TPAOD:  Inicio descarga de la vista $idVista y la pagina $numPagina");
    libxml_use_internal_errors(true);
    $ch = curl_init(); // instanciamos curl e iniciamos un handler para trabajar.
    $xml;
    $datosXMLDescargadosCorrecto;
    $datosXMLDescargados;
    $ContadorReintentosDescarga = 1;
    $url                        = "https://opendata.aragon.es/GA_OD_Core/download?view_id=$idVista&formato=xml&_pageSize=1000&_page=$numPagina"; //Url del archivo xml
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_ENCODING, "gzip");
    curl_setopt($ch, CURLOPT_ENCODING, 'UTF-8');
    
    
    // Intentamos la descarga, si falla reintamos n veces.    
    while ((empty($datosXMLDescargadosCorrecto) || strpos($datosXMLDescargados, "<TITLE>P&aacute;gina en mantenimiento</TITLE>") || strpos($datosXMLDescargados, "<ERROR>") ) and $ContadorReintentosDescarga != 4) {
        logErrores("TPAOD:  Inicio descarga de la vista $idVista y la pagina $numPagina intento: $ContadorReintentosDescarga ");
        $datosXMLDescargados         = curl_exec($ch);
        $datosXMLDescargadosCorrecto = preg_replace('/[\x00-\x1F\x7F]/u', '', $datosXMLDescargados); //se quitan todos los caracteres especiales
        if (empty($datosXMLDescargadosCorrecto) || strpos($datosXMLDescargadosCorrecto, "<TITLE>P&aacute;gina en mantenimiento</TITLE>") || strpos($datosXMLDescargados, "<ERROR>") ) {
            logErrores("TPAOD: Error descargando la pagina $numPagina de la vista $idVista, página en mantenimiento, intento Nº: " . "$ContadorReintentosDescarga ");
            sleep(3);
        }
        $ContadorReintentosDescarga++;
    }
    $xml = simplexml_load_string($datosXMLDescargadosCorrecto);
    libxml_clear_errors();
	if(!is_object($xml) )
	{
	logErrores('TPAOD: Error al crear el objeto desde el xml de la página $numPagina de la vista $idVista probablemente el GA_OD_CORE API, esta respondiendo con XML incorrecto o incompleto.');
	 return 'FIN';
	}
    if ($xml->count() < 1 || strpos($datosXMLDescargados, "<ERROR>"))  {
        logErrores("TPAOD: Se ha terminado la descarga de la vista $idVista");
        return 'FIN';
    }
    if ($datosXMLDescargadosCorrecto === false) {
        logErrores("TPAOD: Error al leer el xml de la página $numPagina de la vista $idVista ");
        return 'FIN';
    } else {
        logErrores("TPAOD: Se ha descargado exitosamente la pagina $numPagina de la vista $idVista");
        return $datosXMLDescargadosCorrecto;
    }
    
    
}

/*
 * Descarga una vista de AOD y la guarda en un fichero, devuelve un string con donde a guardado el fichero,
 * en caso de que haya fallado la descarga devolvera un booleano a FALSE.
 * 
 */

function DescargarVistaAODaFichero($idVista, $numPagina)
{
    $datosXMLDescargadosCorrecto = DescargarVistaAOD($idVista, $numPagina);
    if ($datosXMLDescargadosCorrecto === 'FIN') {
        return 'FIN';
    }
    global $RutaTrabajo;
    
    
    if ($datosXMLDescargadosCorrecto === false) {
        logErrores('TPAOD: Error al leer el xml de la página $numPagina de la vista $idVista ');
        file_put_contents($RutaTrabajo . "/Log/ArchivosErroneos/(" . date("Ymd Gis") . ")" . "Error_vista_" . $idVista . "_$numPagina.xml", $datosXMLDescargados);
        return FALSE;
    } else {
        
        if (!file_exists($RutaTrabajo . "/VistasXml/Vista$idVista")) {
            mkdir($RutaTrabajo . "/VistasXml/Vista$idVista");
        }
        
        // Comprobamos si existe la carpeta de descarga, si no la creamos.
        CrearCarpeta($RutaTrabajo . "/VistasCsv/Vista$idVista");
        CrearCarpeta($RutaTrabajo . "/VistasXml/Vista$idVista");
        $FicheroDestino = $RutaTrabajo . "/VistasXml/Vista$idVista/vista_" . $idVista . "_$numPagina.xml";
        file_put_contents($FicheroDestino, $datosXMLDescargadosCorrecto);
        $FicheroDestino = $RutaTrabajo . "/VistasXml/Vista$idVista/Vista_" . $idVista . "_$numPagina.xml";
        file_put_contents($FicheroDestino, $datosXMLDescargadosCorrecto);
        logErrores("TPAOD: Se ha descargado exitosamente la pagina $numPagina de la vista $idVista en $FicheroDestino");
        return $FicheroDestino;
    }
    return FALSE;
    
}

function DescargarVistaCompleta($idVista)
{
    
    for ($i = 1; $i <= 1000; $i++) {
        $RutaFichero = DescargarVistaAODaFichero($idVista, $i);
        VerificarEspacioEnDisco(); //Por si acaso, comprobamos el espacio disponible en cada descarga, no vaya a ser, que se ocupe todo el espacio al descargar :(.
        if ($RutaFichero === 'FIN') {
            return 'FIN';
        }
    }
    return FALSE;
}

function GenerarCSVDesdeXMLVista($idVista)
{
    // Limpiamos la variable idVista, dejando solo numeros.
    VerificarEspacioEnDisco(); //Por si acaso, comprobamos el espacio disponible antes de generar el fichero CSV.
    $NumeroVista         = (int) filter_var($idVista, FILTER_SANITIZE_NUMBER_INT);
    $RutaDeTrabajo       = getcwd();
    $ResultadoComandoCMD = shell_exec("cd $RutaDeTrabajo/CreacionCSV && " . PHP_BINARY . ' ./CrearVista' . $NumeroVista . '.php');
    if (empty($ResultadoComandoCMD)) {
        $ResultadoComandoCMD = 'Ejecucion Correcta :)';
    }
    logErrores("TPAOD: Resultado de ejecucion del comando para Generar Vistas: $ResultadoComandoCMD");
    return;
}


/*
 * Esta funcion se encarga de actualizar la vista con el CSV.
 * $idVista es el identificador numerico de la vista.
 * $nombreVista Es el nombre del equema que se usara para actualizar la vista.
 * $dcTypes es el array de dcTypes de todas las vistas.
 * $URLApi es la URL del Api-docs de Aragon Open Data Pool.
 */
function actualizarCsv($idVista, $nombreVista, $dcTypes, $URLApi)
{
    $ficheroCSV = "./VistasCsv/Vista$idVista/vista_$idVista.csv";
    if (!file_exists($ficheroCSV)) {
        $ficheroCSV = "./VistasCsv/Vista$idVista/Vista_$idVista.csv";
        if (!file_exists($ficheroCSV)) {
            logErrores("TPAOD: Error al leer el fichero $ficheroCSV");
            return FALSE;
        }
    }
    $ch       = curl_init(); //Se crea un curl
    $datosCSV = file_get_contents($ficheroCSV);
    $datosCSV = curl_escape($ch, $datosCSV);
    
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
    curl_setopt($ch, CURLOPT_URL, $URLApi);
    curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
    curl_setopt($ch, CURLOPT_POSTFIELDS, "idesquema=" . $nombreVista . "&csv=" . $datosCSV . "&dc_type=" . $dcTypes[$idVista]);
    
    $RespuestaHTTP = curl_exec($ch); //Se ejecuta la peticion
    
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    
    logErrores("TPAOD: Se ha mandado la peticion de actualizacion del csv de la vista: $nombreVista Estado: $httpcode y respuesta: $RespuestaHTTP");
    
    switch ($idVista) {
    	
        case 10:
            subirRelacion("57 Relaciones de Comarca", $nombreVista, 57, $URLApi);
            break;
        case 20:
            subirRelacion("58 Relaciones de Entidades Singulares", $nombreVista, 58, $URLApi);
            break;
        case 22:
            subirRelacion("59 Relaciones de Fundaciones", $nombreVista, 59, $URLApi);
            break;
        case 24:
            subirRelacion("60 Relaciones de Mancomunidades", $nombreVista, 60, $URLApi);
            break;
        case 35:
            subirRelacion("61 Relaciones de Villas y Tierras", $nombreVista, 61, $URLApi);
            break;
        case 102:
            subirArchivoAdicinal("Coordenadas Vista 102", $nombreVista, "../VistasCsv/Vista$idVista/coordenadas.csv", $URLApi);
            break;
        default:
            break;
    }
}

/*
 * Esta funcion se encarga de publicar la relacion de una vista atraves del Api.
 * $nombre Es el Nombre del equema que se usara para actualizar la vista.
 * $ipPublicacion es la URL del Api-docs de Aragon Open Data Pool.
 * $vistaActualizar es el nombre de la vista.
 * $ruta es el fichero adicional que se publica.
 */
function subirArchivoAdicinal($nombre, $vistaActualizar, $ruta, $ipPublicacion)
{
    $ipServidor = $ipPublicacion; //Ip para puiblicar las relaciones
    
    $ch = curl_init(); //Se crea un curl
    if (!file_exists($ruta)) {
        logErrores("TPAOD: Error al leer el fichero adicional $ruta");
        return FALSE;
    }
    $datosCsv = file_get_contents($ruta);
    
    $datosCsv = curl_escape($ch, $datosCsv);
    
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
    curl_setopt($ch, CURLOPT_URL, $ipServidor);
    curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
    curl_setopt($ch, CURLOPT_POSTFIELDS, "idesquema=" . $nombre . "&csv=" . $datosCsv);
    
    curl_exec($ch); //Se ejecuta la peticion
    
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    curl_close($ch);
    
    
    logErrores("TPAOD: Se ha mandado la peticion de subida del archivo adicional de la vista: $vistaActualizar Estado: $httpcode");
}

/*
 * Esta funcion se encarga de publicar la relacion de una vista atraves del Api.
 * $id Es el Numero Identificativo de la Vista en el Api CORE.
 * $ipPublicacion es la URL del Api-docs de Aragon Open Data Pool.
 * $nombre es el nombre del Esquema
 *  subirRelacion("57 Relaciones de Comarca", $nombreVista, 57, $URLApi);
 */
function subirRelacion($nombre, $vistaActualizar, $id, $ipPublicacion)
{
    $ipServidor = str_replace('/publicacion/update/view.json', '/publicacion/insert.json',$ipPublicacion);  
    
    
    $ficheroCSV = "./VistasCsv/Vista$idVista/vista_$idVista.csv";
    if (!file_exists($ficheroCSV)) {
        $ficheroCSV = "./VistasCsv/Vista$idVista/Vista_$idVista.csv";
        if (!file_exists($ficheroCSV)) {
            logErrores("TPAOD: Error al leer el fichero $ficheroCSV");
            return FALSE;
        }
    }
    $ch       = curl_init(); //Se crea un curl
    $datosCSV = file_get_contents($ficheroCSV);
    $datosCSV = curl_escape($ch, $datosCSV);
    
    
    
    
    
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
    curl_setopt($ch, CURLOPT_URL, $ipServidor);
    curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
    curl_setopt($ch, CURLOPT_POSTFIELDS, "idesquema=" . $nombre . "&csv=" . $datosCsv);
    
    curl_exec($ch); //Se ejecuta la peticion
    
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    curl_close($ch);
    logErrores("TPAOD: Se ha mandado la peticion de actualizacion las relaciones de la vista: $vistaActualizar. Estado: $httpcode");
}

/*
 * Funcion que obtiene el numero de triples de virtuoso que corresponden a una vista.
 */
function ObtenerNumeroSujetosVirtuoso($idVista)
{
    global $URLEndpointVirtuoso;
    global $dcTypes;
    $dctypeParaConsulta = $dcTypes[$idVista]; // Obtenemos el dctype que corresponde a la vista.
    $db                 = sparql_connect($URLEndpointVirtuoso); //Iniciamos conexion a virtuoso.
    $FiltroSQL=str_replace ('ei2a:','http://opendata.aragon.es/def/ei2a#',$dctypeParaConsulta); // Creamos el dc:type correcto.
    $ConsultaSPARQL          = 'select count(distinct(?s)) As ?total from <http://opendata.aragon.es/def/ei2a> where { ?s ?p ?o.  ?s dc:type  <' . $FiltroSQL . '>}'; // Preparamos la consulta SPARQL.
    $resultadoConsultaSPARQL = sparql_query($ConsultaSPARQL); // Consultamos a virtuoso.
    if (!$resultadoConsultaSPARQL) { //Controlamos errores de conexion, si no funciona virtuoso detenemos la carga.
        $errorSPARQL = sparql_errno() . ": " . sparql_error(); // Capturamos el error de virtuoso.
        logErrores($errorSPARQL); // Lo guardamos en el log.
        EnviarMail('Notificacion AOD Pool',"Tenemos un problema en virtuoso. \n $errorSPARQL \n ",NULL);
        die("\n" . $errorSPARQL . "\n"); // Lo mostramos por pantalla y acabamos el programa.
    }
    $ArrayResultado=sparql_fetch_array($resultadoConsultaSPARQL); //Obtenemos la columna fila del resultado como un array.
    $ValorResultado=$ArrayResultado["total"]; // Nos quedamos con el valor total de la consulta.
    //Si no hay ningun error, obtenemos el numero de filas y lo devolvemos.
    return $ValorResultado;
}

function VerificarDatosVista($idVista) {
logErrores("Verificamos los datos de la vista");
$ficheroCSV = "./VistasCsv/Vista$idVista/vista_$idVista.csv";
    if (!file_exists($ficheroCSV)) {
        $ficheroCSV = "./VistasCsv/Vista$idVista/Vista_$idVista.csv";
        if (!file_exists($ficheroCSV)) {
            logErrores("TPAOD: Error al leer el fichero $ficheroCSV");
            return FALSE;
        }
    }
$LineasTotalesFicheroCSV = count(file($ficheroCSV, FILE_SKIP_EMPTY_LINES));
$LineasTotalesVirtuoso=ObtenerNumeroSujetosVirtuoso($idVista);
// Nos aseguramos que la actualizacion contiene los mismos datos o mas.
logErrores("Verificamos la vista numero $idVista con $LineasTotalesFicheroCSV en el CSV y $LineasTotalesVirtuoso en virtuoso.");
if ($LineasTotalesFicheroCSV >= $LineasTotalesVirtuoso  ) {
	return TRUE; 
} else {
logErrores("No se actualiza la vista porque contiene menos datos que virtuoso"); 
return FALSE;
}

	
}

function VerificarEspacioEnDisco() {
logErrores("Verificamos el espacio en disco");
global $RutaTrabajo;
global $ProcentajeEspacioMinimoEnDisco;
$EspacioLibreEnBytes=disk_free_space($RutaTrabajo);
$EspacioTotalEnBytes=disk_total_space($RutaTrabajo);
$EspacioUsadoEnBytes= $EspacioTotalEnBytes - $EspacioLibreEnBytes;
$PorcentajeDeUsoDeDisco = sprintf('%.2f',($EspacioUsadoEnBytes / $EspacioTotalEnBytes) * 100);
$PorcentajeEspacioLibre=round(100 - $PorcentajeDeUsoDeDisco);
if ($PorcentajeEspacioLibre <= $ProcentajeEspacioMinimoEnDisco) {
	logErrores('Espacio de disco insuficiente, se detiene el proceso de carga.');
	EnviarMail('Notificacion AOD Pool','Espacio de disco insuficiente, se detiene el proceso de carga.',NULL);
	die('Espacio de disco insuficiente, se detiene el proceso de carga.');
}
}

function EnviarMail($asunto='Notificacion AOD Pool',$mensaje,$RutaFicheroadjunto=NULL) {
global $EmailResponsable;
global $EmailOrigen; 
global $ficheroLog;
if (!file_exists($RutaFicheroadjunto)) {
	$RutaFicheroadjunto=$ficheroLog;
}
$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
	// Cabecera del Correo.
    $mail->setFrom($EmailOrigen, 'AOD Pool');
    $mail->addAddress($EmailResponsable, 'Responsable AOD Pool');     // Add a recipient

    //Adjuntos  
	if (file_exists($RutaFicheroadjunto)) {
   		$mail->addAttachment($RutaFicheroadjunto);         // Agregamos el adjunto.
	}


    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $asunto;
    $mail->Body    = "<p>$mensaje</p>"; //contenido del Email en HTML.
    $mail->AltBody = $mensaje; //Contenido del email en Text Plano

    $mail->send(); 
    logErrores('Notificacion de correo enviada al email: '.$EmailResponsable);
} catch (Exception $e) {
    logErrores('Error al enviar la notificacion de correo: '. $mail->ErrorInfo);
}
}
?>