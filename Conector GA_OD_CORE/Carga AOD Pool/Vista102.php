<?php
    define ("RUTA_CSV_COORDENADAS", "../VistasCsv/Vista102/coordenadas.csv");	//La ruta al csv que vamos a usar
	$vista = "102"; 								//La vista que estamos usando
	$idEsquema = "102 Turismo de Aragon, Senderos Rutas";  //El nombre el archivo de mapeo
	$ipServidor = $argv[1];                     //Es la ip del servidor donde quieres subir los datos.
	include 'comun.php';	
	
	//Subimos el archivo adicional de las coodenadas
	$log = fopen ("../Log/log".date("Ymd").".txt", "a+");
	
	if (!empty ($ipServidor)) {
	    $idEsqueCoorde = "Coordenadas Vista 102";
	    $datosCsv = file_get_contents(RUTA_CSV_COORDENADAS); //Se optiene los datos del csv a cargar
	    
	    $ch = curl_init(); //Se crea un curl
	    $datosCsv = curl_escape($ch, $datosCsv);
	    $idEsqueCoorde = curl_escape($ch, $idEsqueCoorde);
	    
	    curl_setopt($ch, CURLOPT_HEADER, 0);
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_TIMEOUT, 400);
	    curl_setopt ($ch, CURLOPT_URL, $ipServidor);
	    curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
	    curl_setopt($ch, CURLOPT_POSTFIELDS,"idesquema=".$idEsqueCoorde."&csv=".$datosCsv);
	    
	    curl_exec ($ch); //Se ejecuta la peticion
	    
	    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	    fwrite ($log, date(DATE_W3C)." Se ha mandado la petición de publicacion de las coordenadas para la vista: ".urldecode ($idEsquema).". Estado: $httpcode\r\n");
	    
	}
	else {
	    fwrite ($log, date(DATE_W3C)." Error, no se ha indicado la ruta del api de publicación\r\n");
	}
	
	fclose ($log); 
?>