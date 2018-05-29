<?php
    define ("RUTA_CSV", "../VistasCsv/Vista".$vista."/vista_".$vista.".csv");	//La ruta al csv que vamos a usar
   
    $datosCsv = file_get_contents(RUTA_CSV); //Se optiene los datos del csv a cargar
        
    $ch = curl_init(); //Se crea un curl
    $datosCsv = curl_escape($ch, $datosCsv);
    $idEsquema = curl_escape($ch, $idEsquema);
    
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
    curl_setopt ($ch, CURLOPT_URL, $ipServidor);
    curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
    curl_setopt($ch, CURLOPT_POSTFIELDS,"idesquema=".$idEsquema."&csv=".$datosCsv);
    
    curl_exec ($ch); //Se ejecuta la peticion
    
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    print_r ($httpcode);
?>