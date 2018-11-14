<?php
    $vista=112;
    define ("CLAVE_URI", "ID_EDAR");
    include 'comun.php';
	
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
?>