<?php
    $vista=43;
    define ("CLAVE_URI", "ORDENANZA_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>