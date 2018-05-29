<?php
    $vista=69;
    define ("CLAVE_URI", "GUIA");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>