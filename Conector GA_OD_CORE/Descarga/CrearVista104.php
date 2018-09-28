<?php
    $vista=104;
    define ("CLAVE_URI", "id");
    define ("CLAVE_LAT", "gradoslatitud");
    define ("CLAVE_LONG", "gradoslongitud");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        fwrite ($archivoCSV, "\n");
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count ()); $x++) {
                foreach ($keys as $key) {
                    $elemento = $xml->item[$x]->$key;
                    
                    if ($key == CLAVE_URL) {
                        $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
                    }
                    
                    if ($key == CLAVE_LAT or $key == CLAVE_LONG) {
                        $cor = $elemento;
                        $dir = 1;
                        
                        if (substr($cor, 0, 1) == "-"){
                            $dir = -1;
                        }
                        
                        $partes = explode (" ", $cor);
                        $grados = $partes [0];
                        $grados = substr ($grados, 0, (strlen($grados) - 2));
                        $minutos = $partes [1];
                        $minutos = substr ($minutos, 0, strlen($minutos) - 1);
                        $segundos = $partes [2];
                        $segundos = substr ($segundos, 0, strlen($segundos) - 1);
                        
                        $elemento = ($grados + ($minutos / 60.0) + ($segundos / 60.0 / 60.0)) * $dir;                        
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