<?php
    $vista=144;
    define ("CLAVE_URI", "GRT_ID_RUTA");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>