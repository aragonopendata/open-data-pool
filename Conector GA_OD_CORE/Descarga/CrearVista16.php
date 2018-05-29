<?php
    $vista=16;
    define ("CLAVE_URI", "DIPUTACION_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>