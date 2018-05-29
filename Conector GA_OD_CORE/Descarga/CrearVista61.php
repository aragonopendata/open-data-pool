<?php
    $vista=61;
    define ("CLAVE_URI", "AGRUPANTE_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>