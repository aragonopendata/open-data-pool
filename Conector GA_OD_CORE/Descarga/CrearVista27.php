<?php
    $vista=27;
    define ("CLAVE_URI", "ORGAUTO_ID");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>