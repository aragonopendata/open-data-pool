<?php
    $vista=24;
    define ("CLAVE_URI", "MANCO_ID");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>