<?php
    define ("CLAVE_URI", "CODIGO_COMARC");
    define("CLAVE_URL_COMAR", "ComarcaAragopediaURI");                      //La clave que esta puesta en el mapeo para poder hacer la relacion con aragopedia
    define("URL_CLAVE_COMAR", "../VistasCsv/Relacion/DatosURLComar.csv");   //La ruta al archvio de datos donde se encuentra el enelace para cada comarca
    define("CLAVE_COMAR", "DENOMINACION");                                  //La clave que se usa para poder relacionar la vista con el archivo de datos adicionales
    define("CLAVE_NECESITA", "CODIGO_MUN");                                 //La calve del id de la vista 11 Datos Municipio
    define ("RUTA_XML11", "../VistasXml/Vista11/vista_11_1.xml");           //La ruta del xml para poder optener el codigo del municipio que corresponde
    
    $vista=10;
    include 'comun.php';   
    
    
    $xml11 = simplexml_load_file (RUTA_XML11);
    $arrayClaves = obtenerURL (URL_CLAVE_COMAR);
    
    if ($archivoCSV !== false) {
        array_push ($keys, CLAVE_URL_COMAR);
        fwrite ($archivoCSV, "\"".CLAVE_URL_COMAR."\";");      
        array_push ($keys, CODIGO_MUN);
        fwrite ($archivoCSV, "\"".CODIGO_MUN."\";");      
        
        fwrite ($archivoCSV, "\n");
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count()); $x++) {
                foreach ($keys as $key) {
                    $elemento = $xml->item[$x]->$key;
                    
                    if ($key == CLAVE_URL_COMAR) { //Insertamos en enlace con aragopedia
                        $id_comar = $xml->item[$x]->{CLAVE_COMAR}->__toString();
                        $elemento = $arrayClaves [$id_comar];
                    }
                    
                    if ($key == CLAVE_NECESITA) {
                        $mun = $xml->item[$x]->{'MUNICIPIO_CAPITAL'};
                        $id_mun = $xml11->xpath("/root/item[DENOMINACION='$mun']/CODIGO_MUN");
                        $elemento = $id_mun[0];
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
    else {
        escribirError ($vista, "Se ha producido un erro en la vista:");
    }
	
?>