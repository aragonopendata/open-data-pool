<?php
    $vista = 22;
    define ("CLAVE_URI", "FUNDACION_ID");	
	define ("URL_VISTA_10", "../VistasXml/Vista10/vista_10_1.xml"); //La ruta a la vista 10
	define ("URL_VISTA_11", "../VistasXml/Vista11/vista_11_1.xml");	//La ruta a la vista 11
	define ("URL_VISTA_16", "../VistasXml/Vista16/vista_16_1.xml"); //La ruta a la vista 16
	
	
	$claveComun = "DENOMINACION"; //La clave que tiene en comun todas la vista
	$root = "root"; //El directorio raiz para la consulta xpath
	$item = "item"; //El nombre de cada elemento item del xml.
	
	define ("URI10","http://opendata.aragon.es/def/ei2a#datos-comarca-"); //La uri para hacer referencia a entidades de la vista 10
	define ("URI11","http://opendata.aragon.es/def/ei2a#municipio-"); //La uri para hacer referencia a entidades de la vista 11
	define ("URI16","http://opendata.aragon.es/def/ei2a#datos-diputacion-"); //La uri para hacer referencia a entidades de la vista 16
	
	
	$clave10 = "CODIGO_COMARC"; //La clave de la uri de la vista 10
	$clave11 = "CODIGO_MUN"; //La clave de la uri de la vista 11
	$clave16 = "DIPUTACION_ID"; //La clave de la uri de la vista 16
	
	
	define("CLAVE_NECESITA", "UrlEntidad");  //La clave que pusimos en el mapeo
	define("CLAVE_TIENE", "ENTIDAD_LOCAL"); //La calve que tiene por la que tiene que buscar para relacionar con las demas vistas
	
	
	
	$xmls = array(); //Un array con los xml a buscar
	$xmls[0] = simplexml_load_file (URL_VISTA_10);
	$xmls[1] = simplexml_load_file (URL_VISTA_11);	
	$xmls[2] = simplexml_load_file (URL_VISTA_16);	
	
	include 'comun.php';
	
	if ($archivoCSV !== false) {
	    
	    
	    array_push ($keys, CLAVE_NECESITA);
	    fwrite ($archivoCSV, "\"".CLAVE_NECESITA."\";");
	    
	    fwrite ($archivoCSV, "\n");
	    for ($i = 1; $i <= $numeroArchivos; $i ++) {
	        $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
	        $xml = simplexml_load_string($datosArchivo);
	        
	        for ($x = 0; $x < ($xml->count()); $x++) {
	            foreach ($keys as $key) {
	                
	                $elemento = $xml->item[$x]->$key->__toString();
	                
	                if ($key == CLAVE_NECESITA) {
	                    $encontrado = false;
	                    $claveTiene = $xml->item[$x]->{CLAVE_TIENE}->__toString();
	                    for ($z = 0; $z < count ($xmls) && !$encontrado; $z++) {
	                        $xmlDepende = $xmls[$z];
	                        $resultado = $xmlDepende->xpath ("/".$root."/".$item."/".$claveComun." [text()= '".$claveTiene."']");
	                        
	                        if (count ($resultado) > 0) {
	                            $encontrado = true;
	                            switch ($z) {
	                                case 0:
	                                    $codigo = $xmlDepende->xpath ("/".$root."/".$item."[".$claveComun."= '".$claveTiene."']/".$clave10);
	                                    $elemento = URI10.$codigo[0];
	                                    break;
	                                case 1:
	                                    $codigo = $xmlDepende->xpath ("/".$root."/".$item."[".$claveComun."= '".$claveTiene."']/".$clave11);
	                                    $elemento = URI11.$codigo[0];
	                                    break;	                                
	                                case 2:
	                                    $codigo = $xmlDepende->xpath ("/".$root."/".$item."[".$claveComun."= '".$claveTiene."']/".$clave16);
	                                    $elemento = URI16.$codigo[0];
	                                    break;	                                
	                            }
	                        }
	                    }
	                }
	                
	                if ($key == CLAVE_URL) {
	                    $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
	                }
	                
	                
	                editarElemento($elemento);
	                
	                fwrite ($archivoCSV, "\"$elemento\";");
	            }
	            fwrite ($archivoCSV, "\n");
	        }
	    }
	    
	    fclose ($archivoCSV);
	}
?>