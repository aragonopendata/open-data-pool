<?php
    define ("CLAVE_URI", "SIGNATURA");
    define("CLAVE_NECESITA", "CODIGO_MUN");                         //La clave que necesita para relacionarse con la vista 11   
    define("CLAVE_MUN", "MUNICIPIO_ESTABLECIMIENTO");               //Una de las claves por la cual se compone la calve que necesita
    define("CLAVE_PRO", "PROVINCIA_ESTABLECIMIENTO");               //La otra de las claves que se compone la calve que necesita
    define ("CLAVE_CATEGORIA", "CATEGORIA");
    
    $vista=67;
    include 'comun.php';
    
    $relacion ["1 tenedor"] = "1";
    $relacion ["1 taza"] = "1";
    $relacion ["2 tenedores"] = "2";
    $relacion ["2 tazas"] = "2";
    $relacion ["3 tenedores"] = "3";
    $relacion ["3 tazas"] = "3";
    $relacion ["4 tenedores"] = "4";
    $relacion ["5 tenedores"] = "5";      
    
    
    if ($archivoCSV !== false) {
        array_push ($keys, CLAVE_NECESITA);
        fwrite ($archivoCSV, "\"".CLAVE_NECESITA."\";");
       
        
        fwrite ($archivoCSV, "\n");
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count()); $x++) {
                foreach ($keys as $key) {
                    $elemento = $xml->item[$x]->$key;
                    
                    if ($key == CLAVE_NECESITA) {
                        $id_mun = $xml->item[$x]->{CLAVE_MUN}->__toString();
                        $id_pro = $xml->item[$x]->{CLAVE_PRO}->__toString();
                        
                        while (strlen($id_mun) < 3) {
                            $id_mun = "0".$id_mun;
                        }
                        
                        $elemento = $id_pro.$id_mun;
                        
                    }                    
                    
                    if ($key == CLAVE_URL) {
                        $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
                    }
                    
                    if ($key == CLAVE_CATEGORIA) {
                        $elemento = $relacion [trim($elemento->__toString())];
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