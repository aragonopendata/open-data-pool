<?php
    $vista=30;
    define ("CLAVE_URI1", "ENTIDAD");
    define ("CLAVE_URI2", "TIPO_PLAN");
    define ("CLAVE_URI3", "A_F_ACUERDO_INI");
    include 'comun.php';   
    
    define ("VISTA_NECESITA", "11");										//El numero de la vista que necesita para completar sus datos
    define ("CLAVE_TIENE", "ENTIDAD");										//La clve que tiene para poder relacionarse
    define ("CLAVE_NECESITA","CODIGO_MUN"); 								//La clave que necesita
    define ("XML_DEPENDE", "vista_".VISTA_NECESITA."_1.xml"); 				//El xml que depende para sacar todos sus datos
    define ("RUTA_XML_DEPENDE", "../VistasXml/Vista".VISTA_NECESITA."/"); 	//La ruta del xml que necesita para completar datos
    
    $root = "root";
    $item = "item";
    $claveBuscar ="DENOMINACION";
    if ($archivoCSV !== false) { 
        if (file_exists (RUTA_XML_DEPENDE)) {
            
            $datosArchivo = file_get_contents (RUTA_XML_DEPENDE.XML_DEPENDE);
            $xmlDepende = simplexml_load_string($datosArchivo);
            
           
        }
        
        array_push ($GLOBALS["keys"],CLAVE_NECESITA); //Le añadimos la clave que necesita y no la tiene el xml
        fwrite ($GLOBALS["archivoCSV"], "\"".CLAVE_NECESITA."\";"); //y la añadidomos al csv
        
        fwrite ($GLOBALS["archivoCSV"], "\n"); //introducimos un salto de linea para separar las keys del resto de los elemntos
        
        //se leen los archivos xml de la vista de los datos y se crea el archivo csv correspondientes a la vista
        for ($i = 1; $i <= $GLOBALS["numeroArchivos"]; $i++) {
            $datosXml2 = file_get_contents (RUTA_XML."vista_".$GLOBALS["vista"]."_$i.xml");
            $xml2 = simplexml_load_string($datosXml2);
            
            for ($z = 0; $z < ($xml2->count ()); $z++) {
                foreach ($GLOBALS["keys"] as $key) {
                    $elemento = $xml2->item[$z]->$key;
                    
                    if ($key == CLAVE_NECESITA){ //Si es el elemento del codigo de provincia que no esta en el xml se busca en el array creado antes y se inserta en el documento
                        $idTiene = $xml2->item[$z]->{CLAVE_TIENE}->__toString();
                        $idTiene = preg_replace("/\r|\n/", "", $idTiene);	//Quitamos los saltos de linea porque sino da error
                        $idTiene = mb_strtoupper($idTiene);
                        $claveNecesita = $xmlDepende->xpath ("/".$root."/".$item."[".$claveBuscar."= '".$idTiene."']/".CLAVE_NECESITA);
                        $elemento = $claveNecesita [0]; //OJO, obtenemos el codigo de municipio, porque la linea anterior devuelve un array
                    }
                    
                    if ($key == CLAVE_URL) {
                        $elemento = obtenerUrlVinculacionTresClaves ($xml2, $z, $GLOBALS["vista"], CLAVE_URI1, CLAVE_URI2, CLAVE_URI3);
                    }
                    
                    editarElemento($elemento);
                    
                    fwrite ($GLOBALS["archivoCSV"], "\"$elemento\";");
                }
                
                fwrite($GLOBALS["archivoCSV"], "\n");
            }
        }
        
        fclose ($GLOBALS["archivoCSV"]);
    }	
?>