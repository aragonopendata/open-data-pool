<?php
    
    define("CLAVE_URL_MUN", "MunicipioAragopediaURI");                    //La clave que esta puesta en el mapeo para poder hacer la relacion con aragopedia
    define("CLAVE_URL_PRO", "ProvinciaAragopediaURI");                    //La clave que esta puesta en el mapeo para poder hacer la relacion con aragopedia
    define("URL_CLAVE_MUN", "../VistasCsv/Relacion/DatosURLMun.csv");     //Ruta al achivo de datos extra para en campo de MunicipioAragopediaURI
    define("URL_CLAVE_PRO", "../VistasCsv/Relacion/DatosURLPro.csv");     //Ruta al achivo de datos extra para en campo de ProvinciaAragopediaURI
    define("CLAVE_MUN", "CODIGO_MUN");                                    //La clave que tiene para la relacion del archivo de datos extra para los municipios
    define("CLAVE_PRO", "PROVINCIA");                                     //La clave que tiene para la relacion del archivo de datos extra para las provincias
    define("CLAVE_URI", "CODIGO_MUN");
    
     $vista=11;
    include 'comun.php';   
    
    $arrayClaves = obtenerURL (URL_CLAVE_MUN);
    $arrayProvincias = obtenerURL (URL_CLAVE_PRO); 
    
    if ($archivoCSV !== false) {
        array_push ($keys, CLAVE_URL_MUN);
        fwrite ($archivoCSV, "\"".CLAVE_URL_MUN."\";");
        
        array_push ($keys, CLAVE_URL_PRO);
        fwrite ($archivoCSV, "\"".CLAVE_URL_PRO."\";");      
        
        fwrite ($archivoCSV, "\n");
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count()); $x++) {
                foreach ($keys as $key) {
                    $elemento = $xml->item[$x]->$key;
                    
                    if ($key == CLAVE_URL_MUN) {
                        $id_municipio = $xml->item[$x]->{CLAVE_MUN}->__toString();                        
                        $elemento = @$arrayClaves [$id_municipio];
                    }
                    
                    if ($key == CLAVE_URL_PRO) {
                        $provincia = $xml->item[$x]->{CLAVE_PRO}->__toString();
                        $elemento = $arrayProvincias[$provincia];
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