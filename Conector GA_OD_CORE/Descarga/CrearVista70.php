<?php
    $vista=70;
    define ("CLAVE_URI", "CODIGO");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>