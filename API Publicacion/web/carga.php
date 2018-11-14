<?php 

    $url = "http://localhost:8890/sparql";
    $sql = "INSERT INTO <http://gnoss.com/adopool/#> { %s }";
    $nombrefichero = "/var/www/html/web/datos.n3";
                     
    $query = "" ;
    $maxCarga = 5;
    $cuenta =0;
    if (file_exists($nombrefichero)){
    //  $query = $query . file_get_contents($nombrefichero);
        if ($file = fopen($nombrefichero, "r")) {
            while(!feof($file)) {
                $line = fgets($file);
                $query = sprintf("%s %s",$query,$line); 
                $cuenta = $cuenta+1;
                if ($cuenta==$maxCarga){
                    $query = sprintf($sql,$query); 
                    LanzaConsulta($url,$query);
                    $cuenta = 0;
                    $query = "";
                }
            }
            if (!empty(trim($query))){
                $query = sprintf($sql,$query);
                LanzaConsulta($url,$query);
            }
            fclose($file);
        }
    }
    function LanzaConsulta($url,$query)
    {
        $data = array('query' => $query , 
                    'timeout' => 0,
                    'format' => '"text/csv');
        // use key 'http' even if you send the request to https://...
        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'encoding' => 'UTF8',
                'content' => http_build_query($data)
            )
        );
        $context  = stream_context_create($options);
        try{
            $result = file_get_contents($url, false, $context);
        } catch (Exception $e) {
			 var_dump($e);
	    } 
        if ($result === FALSE) { 
        /* Handle error */ 
        } else {
            var_dump($result); 
        }
    }  
