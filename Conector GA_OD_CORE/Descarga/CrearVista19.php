<?php
    $vista=19;
    define ("CLAVE_URI", "ELM_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>