<?php
    $vista=34;
    define ("CLAVE_URI", "SOCMERC_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>