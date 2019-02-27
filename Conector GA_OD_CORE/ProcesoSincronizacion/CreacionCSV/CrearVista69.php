<?php
    $vista=69;
    define ("CLAVE_URI", "GUIA");
    define ("CLAVE_COMAR", "COMARCAS");
    define ("COD_COMAR", "CODIGO_COMARC");   
    define ("CLAVE_BUSCAR", "DENOMINACION"); //Es la clave por la cual tiene que buscar en la vista 10 Datos Comarcas
    define ("MAX_COMAR", 15); //El maximo de comarcas permitidas 
    define ("RUTA_VISTA_10", "../VistasXml/Vista10/vista_10_1.xml"); //La ruta al xml de la vista 10 Datos Comarcas 
    include 'comun.php'; 
    
    $insertarElemento = TRUE; //Variable que indica si tiene que insertar el elemento o no. Se usa al escribir el codigo de las comarcas
    $xmlDepende = simplexml_load_file (RUTA_VISTA_10);
    
    
    $root = "root"; //El directorio raiz para la consulta xpath
    $item = "item"; //El nombre de cada elemento item del xml.
    
    if ($archivoCSV !== false) {         
        for ($i = 1; $i <= MAX_COMAR; $i++) {
            array_push ($keys,COD_COMAR.$i);
            fwrite ($archivoCSV, "\"".COD_COMAR.$i."\";");
        }         
        
        fwrite ($archivoCSV, "\n");
        
        for ($i = 1; $i <= $numeroArchivos; $i ++) {
            $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
			if (is_string ($datosArchivo) ) {

            $xml = simplexml_load_string($datosArchivo);
            
            for ($x = 0; $x < ($xml->count ()); $x++) {
                foreach ($keys as $key) {
                    $elemento = $xml->item[$x]->$key;
                    $insertarElemento = TRUE;
                    
                    if ($key == CLAVE_URL) {
                        $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
                    }
                    
                    if ($key == COD_COMAR."1") {
                        $insertarElemento = FALSE;
                        $comarcas = $xml->item[$x]->{CLAVE_COMAR}->__toString();
                        $comarcas = substr ($comarcas, 4);
                        $arrayComarcas = explode (",", $comarcas);
                                                
                        for ($z = 0; $z < MAX_COMAR; $z++) {  
                            $nombreComarca = "";
                            
                            if ($z <= count ($arrayComarcas)) { //Comporbamos que el indice esta definido para que no tenga errores
                                $nombreComarca = $arrayComarcas[$z];
                            }
                            
                            $nombreComarca = remplazarComarcas ($nombreComarca);
                            $codigoComar = $xmlDepende->xpath ("/".$root."/".$item."[".CLAVE_BUSCAR."= '".$nombreComarca."']/".COD_COMAR);                            
                            fwrite ($archivoCSV, "\"".$codigoComar[0]."\";");
                        }  
                       
                    }
                    
                    editarElemento($elemento);
                    
                    if ($insertarElemento) {
                        fwrite ($archivoCSV, "\"$elemento\";");
                    }                    
                }
                
                fwrite ($archivoCSV, "\n");
            }
        }
        }
        fclose ($archivoCSV);
    }	
    
    /*
     * Función que reemplaza las comarcas que estan mal puestas como por ejemplo "D.C. ZARAGOZA" por "ZARAGOZA"
    */
    function remplazarComarcas($nomComar) {
       $nomComar = preg_replace("/\r|\n/", "", $nomComar); //quitamos los saltos de linea
       $nomComar = str_replace ("D.C. ZARAGOZA", "ZARAGOZA", $nomComar);
       //$nomComar = str_replace ("COMUNIDAD DE ", "", $nomComar);
       $nomComar = quitar_tildes ($nomComar);
       return $nomComar;
    }
    
    /*
     * Función que quita las tildes
     */
    function quitar_tildes($cadena) {
        $no_permitidas= array ("á","é","í","ó","ú","Á","É","Í","Ó","Ú","Ã","Ì","Ò","Ù","Ã™","Ã ","Ã¨","Ã¬","Ã²","Ã¹","ç","Ç","Ã¢","ê","Ã®","Ã´","Ã»","Ã‚","ÃŠ","ÃŽ","Ã”","Ã›","ü","Ã¶","Ã–","Ã¯","Ã¤","«","Ò","Ã","Ã„","Ã‹");
        $permitidas= array ("a","e","i","o","u","A","E","I","O","U","A","E","I","O","U","a","e","i","o","u","c","C","a","e","i","o","u","A","E","I","O","U","u","o","O","i","a","e","U","I","A","E");
        $texto = str_replace($no_permitidas, $permitidas ,$cadena);
        return $texto;
    }
?>