<?php
    define ("CLAVE_URI", "CODIGO_COMARC");
    define("CLAVE_URL_COMAR", "ComarcaAragopediaURI");                      //La clave que esta puesta en el mapeo para poder hacer la relacion con aragopedia
    define("URL_CLAVE_COMAR", "../VistasCsv/Relacion/DatosURLComar.csv");   //La ruta al archvio de datos donde se encuentra el enelace para cada comarca
    define("CLAVE_COMAR", "DENOMINACION");                                  //La clave que se usa para poder relacionar la vista con el archivo de datos adicionales
    
     $vista=10;
    include 'comun.php';   
    
    $arrayClaves = obtenerURL (URL_CLAVE_COMAR);
    
    if ($archivoCSV !== false) {
        array_push ($keys, CLAVE_URL_COMAR);
        fwrite ($archivoCSV, "\"".CLAVE_URL_COMAR."\";");      
        
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