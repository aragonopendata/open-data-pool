<?php
    $vista=60;
    define ("CLAVE_URI", "ID_MAN");
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>