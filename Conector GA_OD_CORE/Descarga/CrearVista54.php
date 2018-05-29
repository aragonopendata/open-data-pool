<?php
    $vista=54;
    define ("CLAVE_URI", "NOMBRE");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>