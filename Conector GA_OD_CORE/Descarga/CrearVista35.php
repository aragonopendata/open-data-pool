<?php
    $vista=35;
    define ("CLAVE_URI", "CVT_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>