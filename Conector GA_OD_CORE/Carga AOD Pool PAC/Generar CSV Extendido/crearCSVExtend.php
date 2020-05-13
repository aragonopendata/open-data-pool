<?php
define("CODIGO_MUN", "FUENTE");

function crearCSVExtendVariasClavesSinDependencia($numVista, $csvToRead, $csvToExtend)
{
    define("CLAVE_URL", "FUENTE");
    $vista = $numVista;
    $csvExtend = fopen($csvToExtend, 'w');
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $elemento = obtenerUrlVinculacionVariasClaves($vista, $arrayCSV[$c], 'CANO', 'CPRODU');
        editarElemento($elemento);
        array_push($arrayCSV[$c], $elemento);
        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);

    return $csvExtend;
}

function crearCSVExtendTresClavesSinDependencia($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_MUN');
    array_push($arrayCSV[0], 'SEXO_ENTIDAD');
    array_push($arrayCSV[0], 'ESTADO_STRING');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $elemento = obtenerUrlVinculacionVariasClaves($vista, $arrayCSV[$c], 'CCORRE', 'CCOSEC');
        editarElemento($elemento);
        $cod_mun = $arrayCSV[$c][6];
        $cod_pro = $arrayCSV[$c][7];
        if (strlen($cod_pro) == 1) {
            $cod_pro = "00" . $cod_pro;
        } else if (strlen($cod_pro) == 2) {
            $cod_pro = "0" . $cod_pro;
        }
        $cod_fin = $cod_mun . $cod_pro;
        $sexo = $arrayCSV[$c][12];
        if ($sexo == 'H') {
            $sexo = 'http://opendata.aragon.es/def/ei2a#Masculino';
        } else if ($sexo == 'M') {
            $sexo = 'http://opendata.aragon.es/def/ei2a#Femenino';
        } else {
            $sexo = ' ';
        }
        $estado = $arrayCSV[$c][11];
        if ($estado == 'S') {
            $estado = 'Soltero';
        } else if ($estado == 'C') {
            $estado = 'Casado';
        } else if ($estado == 'V') {
            $estado = 'Viudo';
        } else if ($estado == 'O' || $estado == 'D') {
            $estado = 'Divorciado';
        } else {
            $estado = ' ';
        }
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $cod_fin);
            array_push($arrayCSV[$c], $sexo);
            array_push($arrayCSV[$c], $estado);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia80($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_MUN');
    array_push($arrayCSV[0], 'SECRE_STRING');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_mun = $arrayCSV[$c][14];
        $cod_pro = $arrayCSV[$c][15];
        if (strlen($cod_pro) == 1) {
            $cod_pro = "00" . $cod_pro;
        } else if (strlen($cod_pro) == 2) {
            $cod_pro = "0" . $cod_pro;
        }
        $cod_fin = $cod_mun . $cod_pro;
        $secre = $arrayCSV[$c][21];
        if ($secre == 'S') {
            $secre = 'Secano';
        } else if ($secre == 'R') {
            $secre = 'Regadío';
        } else {
            $secre = ' ';
        }
        $elemento = obtenerUrlVinculacionClavesVista80($vista, $arrayCSV[$c], 'CCORRE', 'CCOSEC', 'CPROCA', 'CMUNCA', 'CPOLIG', 'CPARCE', 'CSUBPA');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $cod_fin);
            array_push($arrayCSV[$c], $secre);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia81($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_MUN');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_pro = $arrayCSV[$c][1];
        $cod_mun = $arrayCSV[$c][2];
        if (strlen($cod_pro) == 1) {
            $cod_pro = "0" . $cod_pro;
        }
        if (strlen($cod_mun) == 1) {
            $cod_mun = "00" . $cod_mun;
        } else if (strlen($cod_mun) == 2) {
            $cod_mun = "0" . $cod_mun;
        }

        $codigo_municipio = $cod_pro . $cod_mun;

        $elemento = obtenerUrlVinculacionClavesVista81($vista, $arrayCSV[$c], 'CCOSEC', 'CPROVI', 'CMUNCA', 'CPARCE', 'CSUBPA', 'CPOLIG');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $codigo_municipio);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia83($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_PRODU');
    array_push($arrayCSV[0], 'CODIGO_VARIE');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_pro = $arrayCSV[$c][1];
        $cod_varie = $arrayCSV[$c][2];
        if (strlen($cod_pro) == 1) {
            $cod_pro = "0" . $cod_pro;
        }
        if (strlen($cod_varie) == 1) {
            $cod_varie = "00" . $cod_varie;
        } else if (strlen($cod_varie) == 2) {
            $cod_varie = "0" . $cod_varie;
        }

        $elemento = obtenerUrlVinculacionClavesVista83($vista, $arrayCSV[$c], 'CCOSEC', 'CPRODU', 'CVARIE');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $cod_pro);
            array_push($arrayCSV[$c], $cod_varie);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia84($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_PRODU');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_pro = $arrayCSV[$c][1];

        if (strlen($cod_pro) == 1) {
            $cod_pro = "00" . $cod_pro;
        } else if (strlen($cod_pro) == 2) {
            $cod_pro = "0" . $cod_pro;
        }

        $elemento = obtenerUrlVinculacionClavesVista84($vista, $arrayCSV[$c], 'CCOSEC', 'CPRODU');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $cod_pro);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia86($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {

        $elemento = obtenerUrlVinculacionClavesVista86($vista, $arrayCSV[$c], 'CCOSEC', 'CUSO');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia89($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_MUN');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_pro = $arrayCSV[$c][1];
        $cod_mun = $arrayCSV[$c][9];

        if (strlen($cod_mun) == 1) {
            $cod_mun = "00" . $cod_mun;
        } else if (strlen($cod_mun) == 2) {
            $cod_mun = "0" . $cod_mun;
        }

        if (strlen($cod_pro) == 1) {
            $cod_pro = "0" . $cod_pro;
        }

        $codigo_municipio = $cod_pro . $cod_mun;

        $elemento = obtenerUrlVinculacionClavesVista89($vista, $arrayCSV[$c], 'CAGENC');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $codigo_municipio);
        }

        fputcsv($csvExtend, $arrayCSV[$c], ';');
    }

    fclose($csvExtend);
}

function crearCSVExtendTresClavesSinDependencia79($numVista, $csvToRead, $csvToExtend)
{
    $vista = $numVista;
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    $csvExtend = fopen($csvToExtend, 'w');
    ini_set('memory_limit', '-1');
    while (($line = fgetcsv($csvRead, 1000, ';')) != FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    array_push($arrayCSV[0], 'FUENTE');
    array_push($arrayCSV[0], 'CODIGO_MUN');
    array_push($arrayCSV[0], 'SECRE_STRING');
    fclose($csvRead);

    for ($c = 0; $c < count($arrayCSV); $c ++) {
        $cod_mun = $arrayCSV[$c][10];
        $cod_pro = $arrayCSV[$c][11];
        if (strlen($cod_pro) == 1) {
            $cod_pro = "00" . $cod_pro;
        } else if (strlen($cod_pro) == 2) {
            $cod_pro = "0" . $cod_pro;
        }
        $cod_fin = $cod_mun . $cod_pro;
        $secre = $arrayCSV[$c][17];
        if ($secre == 'S') {
            $secre = 'Secano';
        } else if ($secre == 'R') {
            $secre = 'Regadío';
        } else {
            $secre = ' ';
        }
        $elemento = obtenerUrlVinculacionClavesVista79($vista, $arrayCSV[$c], 'CCORRE', 'CCOSEC', 'CPROCA', 'CMUNCA', 'CPOLIG', 'CPARCE', 'CSUBPA');
        editarElemento($elemento);
        if ($c != 0) {
            array_push($arrayCSV[$c], $elemento);
            array_push($arrayCSV[$c], $cod_fin);
            array_push($arrayCSV[$c], $secre);
        }
        if (strpos($arrayCSV[$c][16], 'CSUBPA') !== false) {
            fputcsv($csvExtend, $arrayCSV[$c], ';');
        } else if (strpos($arrayCSV[$c][16], 'None') !== false) {
            fputcsv($csvExtend, $arrayCSV[$c], ';');
        }
    }

    fclose($csvExtend);
}

function obtenerUrlVinculacionTresClaves($vista, $csv, $claveURI1, $claveURI2, $claveURI3)
{
    $valor1 = $csv[0];
    $valor2 = $csv[6];
    $valor3 = $csv[7];

    $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$valor3'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista80($vista, $csv, $claveURI1, $claveURI2, $claveURI3, $claveURI4, $claveURI5, $claveURI6, $claveURI7)
{
    $valor1 = $csv[3];
    $valor2 = $csv[0];
    $cod_mun = $csv[14];
    $cod_pro = $csv[15];
    $valor4 = $csv[18];
    $valor5 = $csv[19];
    $valor6 = $csv[20];
    if ($valor6 == 'None') {
        $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$cod_mun' and $claveURI4='$cod_pro' and $claveURI5='$valor4' and $claveURI6='$valor5'";
    } else {
        $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$cod_mun' and $claveURI4='$cod_pro' and $claveURI5='$valor4' and $claveURI6='$valor5' and $claveURI7='$valor6'";
    }

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista81($vista, $csv, $claveURI1, $claveURI2, $claveURI3, $claveURI4, $claveURI5, $claveURI6)
{
    $valor1 = $csv[0];
    $valor2 = $csv[1];
    $valor3 = $csv[2];
    $valor4 = $csv[6];
    $valor5 = $csv[7];
    $valor6 = $csv[5];
    $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$valor3' and $claveURI4='$valor4' and $claveURI5='$valor5' and $claveURI6='$valor6'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista83($vista, $csv, $claveURI1, $claveURI2, $claveURI3)
{
    $valor1 = $csv[0];
    $valor2 = $csv[1];
    $valor3 = $csv[2];
    $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$valor3'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista84($vista, $csv, $claveURI1, $claveURI2)
{
    $valor1 = $csv[0];
    $valor2 = $csv[1];
    $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista86($vista, $csv, $claveURI1, $claveURI2)
{
    $valor1 = $csv[0];
    $valor2 = $csv[1];
    $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista89($vista, $csv, $claveURI1, $claveURI2)
{
    $valor1 = $csv[2];
    $filtro = "$claveURI1='$valor1'";

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionClavesVista79($vista, $csv, $claveURI1, $claveURI2, $claveURI3, $claveURI4, $claveURI5, $claveURI6, $claveURI7)
{
    $valor1 = $csv[3];
    $valor2 = $csv[0];
    $cod_mun = $csv[10];
    $cod_pro = $csv[11];
    $valor4 = $csv[14];
    $valor5 = $csv[15];
    $valor6 = $csv[16];
    if ($valor6 == 'None') {
        $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$cod_mun' and $claveURI4='$cod_pro' and $claveURI5='$valor4' and $claveURI6='$valor5'";
    } else {
        $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2' and $claveURI3='$cod_mun' and $claveURI4='$cod_pro' and $claveURI5='$valor4' and $claveURI6='$valor5' and $claveURI7='$valor6'";
    }

    $filtro = urlencode($filtro);

    return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
}

function obtenerUrlVinculacionVariasClaves($vista, $csv, $claveURI1, $claveURI2)
{
    if (! in_array($claveURI1, $csv)) {
        $valor1 = $csv[3];
        $valor2 = $csv[0];

        $filtro = "$claveURI1='$valor1' and $claveURI2='$valor2'";

        $filtro = urlencode($filtro);

        return "https://opendata.aragon.es/GA_OD_Core/preview?view_id=$vista&filter_sql=$filtro&_pageSize=1&_page=1";
    }
}

function editarElemento(&$elemento)
{
    $elemento = preg_replace("/\r|\n/", "", $elemento); // quitamos los saltos de linea
    $elemento = str_replace("\"", "\"\"", $elemento); // cambiamos el caracter " por ""
    $elemento = trim($elemento);
}

function obtenerURICodMun($csvToRead)
{
    $arrayCSV = array();
    $csvRead = fopen($csvToRead, 'r');
    while (($line = fgetcsv($csvRead, 1000, ';')) !== FALSE) {

        array_pop($line);
        array_push($arrayCSV, $line);
    }
    fclose($csvRead);
}

$gestor = opendir('/data/AOD_Pool_PAC/');
while ($entrada = readdir($gestor)) {
    if ($entrada != "." && $entrada != ".." && strpos($entrada, '.csv') !== false ) {
        $ficheroEntrada = '/data/AOD_Pool_PAC/' . $entrada;
        $ficheroSalida = '/data/AOD_Pool_PAC/csvExtend/' . $entrada;
        //crearCSVExtendTresClavesSinDependencia79('79', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia('78', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia80('80', '/data/AOD_Pool_PAC/view80_2019.csv', $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia('266', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia81('81', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia83('83', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia84('84', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia83('85', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia86('86', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia89('89', $ficheroEntrada, $ficheroSalida);
        //crearCSVExtendTresClavesSinDependencia79('266', $ficheroEntrada, $ficheroSalida);
	    crearCSVExtendTresClavesSinDependencia81('267', $ficheroEntrada, $ficheroSalida);
    }
}
?>
