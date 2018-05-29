<?php
    $vista=25;
    define ("CLAVE_URI", "WNOV_ID");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>