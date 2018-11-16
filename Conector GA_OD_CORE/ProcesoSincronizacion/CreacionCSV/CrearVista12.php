<?php
    $vista=12;
    define ("CLAVE_URI", "ID_AGRUPACION_SECRETARIAL");
    include 'comun.php';

    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>