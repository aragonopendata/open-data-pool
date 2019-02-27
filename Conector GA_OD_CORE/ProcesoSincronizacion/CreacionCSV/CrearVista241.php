<?php 
    $vista = 241;
    define ("CLAVE_URI", "NUMERO_REGISTRO");
    define ("CLAVE_URL_PRO", "ProvinciaAragopediaURI");                    //La clave que esta puesta en el mapeo para poder hacer la relacion con aragopedia
    define ("URL_CLAVE_PRO", "../VistasCsv/Relacion/DatosURLPro.csv");     //Ruta al achivo de datos externo para en campo de ProvinciaAragopediaURI
    define ("CLAVE_PRO", "AMBITO");                                     //La clave que tiene para la relacion del archivo de datos extra para las provincias
    define ("COOR_X", "COORD_X");
    define ("COOR_Y", "COORD_Y");
    
    include 'comun.php';
    include 'convertir.php'; //Clase para convertir coordenadas
    $arrayProvincias = obtenerURL (URL_CLAVE_PRO); 
    
    $codigosMunicipio = array ();
    $codigosMunicipio ["50"] = "ZARAGOZA";
    $codigosMunicipio ["22"] = "HUESCA";
    $codigosMunicipio ["44"] = "TERUEL";
    
    if ($archivoCSV !== false) {
        
        array_push ($keys, CLAVE_URL_PRO);
        fwrite ($archivoCSV, "\"".CLAVE_URL_PRO."\";");
        
        fwrite ($GLOBALS["archivoCSV"], "\n"); //introducimos un salto de linea para separar las keys del resto de los elemntos
        
        //se leen los archivos xml de la vista de los datos y se crea el archivo csv correspondientes a la vista
        for ($i = 1; $i <= $GLOBALS["numeroArchivos"]; $i++) {
            $datosXml2 = file_get_contents (RUTA_XML."vista_".$GLOBALS["vista"]."_$i.xml");      
            if (is_string ($datosXml2) ) {
			$xml2 = simplexml_load_string($datosXml2);
            for ($z = 0; $z < ($xml2->count ()); $z++) {
                foreach ($GLOBALS["keys"] as $key) {
                    $elemento = $xml2->item[$z]->$key;
                    
                    if ($key == COOR_Y) {
                        $x = $xml2->item[$z]->{'COORD_X'}->__toString ();
                        $y = $xml2->item[$z]->{'COORD_Y'}->__toString ();
                        
                        $array = utm2ll ($x,$y,30,true);
                        $elemento = radian2degree($array[0]);
                    }
                    
                    if ( $key == COOR_X) {
                        $x = $xml2->item[$z]->{'COORD_X'}->__toString ();
                        $y = $xml2->item[$z]->{'COORD_Y'}->__toString ();
                        
                        $array = utm2ll ($x,$y,30,true);
                        
                        $elemento = radian2degree($array[1]);
                        
                    }
                    
                    if ($key == CLAVE_URL_PRO) {
                        $provincia = $xml->item[$z]->{CLAVE_PRO}->__toString();
                        
                        $elemento = $arrayProvincias[$codigosMunicipio [$provincia]];
                    }
                    
                    if ($key == CLAVE_URL) { //Se tiene que quitar el float
                        $valor = $xml->item[$z]->{CLAVE_URI}->__toString();
                        
                        
                        $filtro = CLAVE_URI."='$valor'";
                        
                        $filtro = urlencode ($filtro);
                        
                        
                        $elemento = "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
                    }
                    
                    editarElemento($elemento);
                    
                    fwrite ($GLOBALS["archivoCSV"], "\"$elemento\";");
                }
                
                fwrite($GLOBALS["archivoCSV"], "\n");
            }
        }
        }
        fclose ($GLOBALS["archivoCSV"]);
        
        
    }






?>