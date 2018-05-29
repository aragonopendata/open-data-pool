<?php
    $vista=4;
    define ("CLAVE_URI", "NOMBRE");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>