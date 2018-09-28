<?php
    $vista=159;
    define ("CLAVE_URI", "COD_SIU");
    define ("CLAVE_NECESITA", "PADRE");
    define ("CLAVE_PADRE", "ID_ENTIDAD_PADRE");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        array_push ($keys,CLAVE_NECESITA); //Le añadimos la clave que necesita y no la tiene el xml
        fwrite ($archivoCSV, "\"".CLAVE_NECESITA."\";"); //y la añadidomos al csv
        
        fwrite ($archivoCSV, "\n");
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count ()); $x++) {
                if (!empty ($xml->item[$x]->{CLAVE_URI})) {
                    foreach ($keys as $key) {
                        $elemento = $xml->item[$x]->$key;
                        
                        if ($key == CLAVE_URL) {
                            $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
                        }
                        
                        if ($key == CLAVE_NECESITA) {
                            $elemento = $xml->item[$x]->{CLAVE_PADRE};
                        }
                        
                        editarElemento($elemento);
                        fwrite ($archivoCSV, "\"$elemento\";");
                     }
                        fwrite ($archivoCSV, "\n");
                    }
                }                
        }
        
        fclose ($archivoCSV);
    }
?>