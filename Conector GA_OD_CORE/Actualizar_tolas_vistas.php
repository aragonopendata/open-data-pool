<?php
    define ("RUTA_XML", "../MapeosActualizar/");	//La ruta al csv que vamos a usar.
    
    $carpetaXml = new FilesystemIterator(RUTA_XML, FilesystemIterator::SKIP_DOTS);
    $vistasSaltar = array(7, 31, 30, 33, 28, 57, 58, 59, 60, 61, 67);
    
    $dcTypes [0] = ""; 
    $dcTypes [1] = ""; 
    $dcTypes [2] = "simbolo"; 
    $dcTypes [3] = "miembro_pleno_municipal"; 
    $dcTypes [4] = "miembro_pleno_comarcal"; 
    $dcTypes [5] = "ordenanza_general_municipio"; 
    $dcTypes [6] = "ordenanza_general_comarca"; 
    $dcTypes [7] = "ordenanza_fiscal_municipio"; 
    $dcTypes [8] = "ordenanza_fiscal_comarca"; 
    $dcTypes [9] = "eleccion"; 
    $dcTypes [10] = "comarca"; 
    $dcTypes [11] = "municipio"; 
    $dcTypes [12] = "agrupacion_secretarial"; 
    $dcTypes [13] = "consorcio"; 
    $dcTypes [15] = "curso"; 
    $dcTypes [16] = "diputacion"; 
    $dcTypes [17] = "direccion_de_interes"; 
    $dcTypes [19] = "entidad_menor"; 
    $dcTypes [20] = "entidad_singular"; 
    $dcTypes [22] = "fundacion"; 
    $dcTypes [24] = "mancomunidad"; 
    $dcTypes [25] = "noticia"; 
    $dcTypes [26] = "nucleo"; 
    $dcTypes [27] = "organismo_autonomo"; 
    $dcTypes [28] = "organizacion_complementaria"; 
    $dcTypes [30] = "planeamiento"; 
    $dcTypes [31] = "plantilla"; 
    $dcTypes [32] = "postgrado"; 
    $dcTypes [33] = "presupuesto"; 
    $dcTypes [34] = "sociedad_mercantil"; 
    $dcTypes [35] = "villas_y_tierras"; 
    $dcTypes [38] = "ordenanza_fiscal_consorcio"; 
    $dcTypes [39] = "ordenanza_fiscal_diputacion"; 
    $dcTypes [40] = "ordenanza_fiscal_entidad_menor"; 
    $dcTypes [41] = "ordenanza_fiscal_mancomunidad"; 
    $dcTypes [42] = "ordenanza_fiscal_organismo_autonomo"; 
    $dcTypes [43] = "ordenanza_fiscal_villas_y_tierras"; 
    $dcTypes [44] = "ordenanza_general_consorcio"; 
    $dcTypes [45] = "ordenanza_general_diputacion"; 
    $dcTypes [46] = "ordenanza_general_entidad_menor"; 
    $dcTypes [47] = "ordenanza_general_mancomunidad"; 
    $dcTypes [48] = "ordenanza_general_nucleo"; 
    $dcTypes [49] = "ordenanza_general_organismo_autonomo"; 
    $dcTypes [50] = "ordenanza_general_villas_y_tierras"; 
    $dcTypes [51] = "miembro_pleno_consorcio"; 
    $dcTypes [52] = "miembro_pleno_entidad_menor"; 
    $dcTypes [53] = "miembro_pleno_mancomunidad"; 
    $dcTypes [54] = "miembro_pleno_organismo_autonomo"; 
    $dcTypes [56] = "miembro_pleno_villas_y_tierras"; 
    $dcTypes [57] = ""; 
    $dcTypes [58] = ""; 
    $dcTypes [59] = ""; 
    $dcTypes [60] = ""; 
    $dcTypes [61] = ""; 
    $dcTypes [62] = "registro_llamada"; 
    $dcTypes [63] = "agencia_viaje"; 
    $dcTypes [64] = "albergue_refugio"; 
    $dcTypes [66] = "apartamento"; 
    $dcTypes [67] = "cafeteria_restaurante"; 
    $dcTypes [68] = "camping"; 
    $dcTypes [69] = "guia_turismo"; 
    $dcTypes [70] = "oficina_turismo"; 
    $dcTypes [71] = "punto_informacion_turistica"; 
    $dcTypes [72] = "punto_informacion_turistica"; 
    $dcTypes [73] = "alojamiento_rural"; 
    $dcTypes [74] = ""; 
    $dcTypes [75] = ""; 
    $dcTypes [76] = ""; 
    $dcTypes [77] = ""; 
    $dcTypes [78] = ""; 
    $dcTypes [79] = ""; 
    $dcTypes [80] = ""; 
    $dcTypes [81] = ""; 
    $dcTypes [82] = ""; 
    $dcTypes [83] = ""; 
    $dcTypes [84] = ""; 
    $dcTypes [85] = ""; 
    $dcTypes [86] = ""; 
    $dcTypes [87] = ""; 
    $dcTypes [88] = ""; 
    $dcTypes [89] = ""; 
    $dcTypes [90] = ""; 
    $dcTypes [91] = ""; 
    $dcTypes [92] = ""; 
    $dcTypes [93] = ""; 
    $dcTypes [94] = ""; 
    $dcTypes [95] = ""; 
    $dcTypes [96] = ""; 
    $dcTypes [97] = ""; 
    $dcTypes [98] = ""; 
    $dcTypes [99] = ""; 
    $dcTypes [100] = ""; 
    $dcTypes [101] = ""; 
    $dcTypes [102] = ""; 
    $dcTypes [103] = ""; 
    $dcTypes [104] = ""; 
    $dcTypes [105] = ""; 
    $dcTypes [106] = ""; 
    $dcTypes [107] = ""; 
    $dcTypes [108] = ""; 
    $dcTypes [109] = ""; 
    $dcTypes [110] = ""; 
    $dcTypes [111] = ""; 
    $dcTypes [112] = ""; 
    $dcTypes [113] = ""; 
    $dcTypes [114] = ""; 
    $dcTypes [115] = ""; 
    $dcTypes [116] = ""; 
    $dcTypes [117] = ""; 
    $dcTypes [118] = ""; 
    $dcTypes [119] = ""; 
    $dcTypes [120] = ""; 
    $dcTypes [121] = ""; 
    $dcTypes [122] = ""; 
    $dcTypes [123] = ""; 
    $dcTypes [124] = ""; 
    $dcTypes [125] = ""; 
    $dcTypes [126] = ""; 
    $dcTypes [127] = ""; 
    $dcTypes [128] = ""; 
    $dcTypes [129] = ""; 
    $dcTypes [130] = ""; 
    $dcTypes [131] = ""; 
    $dcTypes [132] = "concesion"; 
    $dcTypes [133] = "expedicion"; 
    $dcTypes [134] = "expedicion_parada_y_horario"; 
    $dcTypes [135] = "operador"; 
    $dcTypes [136] = "parada"; 
    $dcTypes [137] = "ruta"; 
    $dcTypes [138] = "servicio"; 
    
    $ch = curl_init(); //Se crea un curl
    
    
    $ipEsquema = @$argv[1];
    $ipPublicacion = @$argv[2];
    $ipActualizacion = @$argv[3];
    
    if (! empty($ipEsquema) and ! empty($ipPublicacion) and ! empty($ipActualizacion)) {
        foreach ($carpetaXml as $xml) {
            $log = fopen ("../Log/log".date("Ymd").".txt", "a+");
            
            $nombre = "";
            $idVista = 0;
            
            subirEsquema($log, $nombre, $idVista, $xml, $ch, $ipEsquema);
            
            if (! in_array($idVista, $vistasSaltar)){
                actualizarCsv ($log, $idVista, $nombre, $dcTypes, $ch, $ipPublicacion, $ipActualizacion);
            }
            
            curl_reset ($ch);
            fclose ($log);            
        }
    }
    else {
        fwrite ($log, date(DATE_W3C)." Error, no se ha indicado las rutas del api necesarias\r\n");
    }
    
    
    
    
    function subirEsquema(&$log, &$nombre, &$idVista, $xml, &$ch, $ipEsquema) {
        $ipServidor = $ipEsquema; //Ip para actualizar los esquemas
        if ($xml->isFile()) {
            $datosXml = file_get_contents($xml);
            $nombre = utf8_encode($xml->getBasename('.xml'));
            $idVista = substr($nombre, 0 ,strpos($nombre, " "));
            $datosXml = curl_escape($ch, $datosXml);
            $idEsquema = curl_escape($ch, $nombre);
            
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
            curl_setopt($ch, CURLOPT_TIMEOUT, 400);
            curl_setopt ($ch, CURLOPT_URL, $ipServidor);
            curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
            curl_setopt($ch, CURLOPT_POSTFIELDS,"nombre=".$nombre."&xml=".$datosXml);
            
            curl_exec ($ch); //Se ejecuta la peticion
            
            $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            
            curl_reset ($ch);
            
            $log = fopen ("../Log/log".date("Ymd").".txt", "a+");
            fwrite ($log, date(DATE_W3C)." Se ha mandado la peticion de actualización de la isonomia vista: $nombre. Estado: ".$httpcode."\r\n");
        }         
            
    }
    
    function actualizarCsv ($log, $idVista, $nombre, $dcTypes, &$ch, $ipPublicacion, $ipActualizacion) {
        $datosCSV = file_get_contents ("../VistasCsv/Vista$idVista/vista_$idVista.csv");
        
        $ipServidor = $ipActualizacion;
        
        $datosCSV = curl_escape($ch, $datosCSV);
        
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 400);
        curl_setopt ($ch, CURLOPT_URL, $ipServidor);
        curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
        curl_setopt($ch, CURLOPT_POSTFIELDS,"idesquema=".$nombre."&csv=".$datosCSV."&dc_type=".$dcTypes[$idVista]);
        
        curl_exec ($ch); //Se ejecuta la peticion
        
        $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        
        fwrite ($log, date(DATE_W3C)." Se ha mandado la peticion de actualización del csv de la vista: $nombre. Estado: ".$httpcode."\r\n");
        
        switch ($idVista) {
            case 10:
                subirRelacion ("57 Relaciones de Comarca", $nombre, 57, $log, $ipPublicacion);
                break;
            case 20:
                subirRelacion ("58 Relaciones de Entidades Singulares", $nombre, 58, $log, $ipPublicacion);
                break;
            case 22:
                subirRelacion ("59 Relaciones de Fundaciones", $nombre, 59, $log, $ipPublicacion);
                break;
            case 24:
                subirRelacion ("60 Relaciones de Mancomunidades", $nombre, 60, $log, $ipPublicacion);
                break;
            case 35:
                subirRelacion ("61 Relaciones de Villas y Tierras", $nombre, 61, $log, $ipPublicacion);
                break;
            default:
                break;
        }
    }
    
    
    function subirRelacion($nombre, $vistaActualizar, $id, $log, $ipPublicacion) {
        $ipServidor = $ipPublicacion; //Ip para puiblicar las relaciones  
        
        $ch = curl_init(); //Se crea un curl
        $datosCsv = file_get_contents("../VistasCsv/Vista$id/vista_$id.csv");   
       
        $datosCsv = curl_escape($ch, $datosCsv);
        
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 400);
        curl_setopt ($ch, CURLOPT_URL, $ipServidor);
        curl_setopt($ch, CURLOPT_POST, 1); //Se le dice que tiene que usar el protocolo POST
        curl_setopt($ch, CURLOPT_POSTFIELDS,"idesquema=".$nombre."&csv=".$datosCsv);
            
        curl_exec ($ch); //Se ejecuta la peticion
            
        $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            
        curl_close ($ch);            
       
        fwrite ($log, date(DATE_W3C)." Se ha mandado la peticion de actualización las relaciones de la vista: $vistaActualizar. Estado: ".$httpcode."\r\n");        
    }
    
?>