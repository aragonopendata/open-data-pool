<?php
    $vista=39;
    define ("CLAVE_URI", "ORDENANZA_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>