<?php
    $vista=17;
    define ("CLAVE_URI", "DIRECCION_ID");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>