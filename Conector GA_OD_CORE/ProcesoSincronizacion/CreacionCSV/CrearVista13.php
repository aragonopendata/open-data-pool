<?php
    $vista=13;
    define ("CLAVE_URI", "CONSORCIO_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>