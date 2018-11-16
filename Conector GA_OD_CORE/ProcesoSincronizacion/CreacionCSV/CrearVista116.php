<?php
   $vista=116;
   define ("CLAVE_URI", "OBJECTID");
   define ("CLAVE_MUN", "CODIGO_MUN");   
   define ("COD_MUN", "CO2MUN");   
   define ("COD_PRO", "CO1PRV");   
   include 'comun.php';
   
   if ($archivoCSV !== false) {            
       array_push ($keys,CLAVE_MUN); //Le añadimos la clave que necesita y no la tiene el xml
       fwrite ($archivoCSV, "\"".CLAVE_MUN."\";"); //y la añadidomos al csv
       
       fwrite ($archivoCSV, "\n");
       for ($i = 1; $i <= $numeroArchivos; $i ++) {
           $datosArchivo = file_get_contents (RUTA_XML."Vista_".$vista."_$i.xml");
           $xml = simplexml_load_string($datosArchivo);
           
           for ($x = 0; $x < ($xml->count ()); $x++) {
               foreach ($keys as $key) {
                   $elemento = $xml->item[$x]->$key->__toString();
                   
                   if ($key == CLAVE_URL) {
                       $elemento = obtenerUrlVinculacion($xml, $x, $vista, CLAVE_URI);
                   }
                   
                   if ($key == CLAVE_MUN) {     
                       $codMun = $xml->item[$x]->{COD_MUN}->__toString();
                       
                       while (strlen($codMun) < 3) {
                           $codMun = "0".$codMun;
                       }
                       
                       $codPro= $xml->item[$x]->{COD_PRO}->__toString();
                       $elemento = $codPro.$codMun;
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