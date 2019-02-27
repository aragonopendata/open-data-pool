<?php
    $vista=59;
    define ("CLAVE_URI", "ID_FUN");
    include 'comun.php';   
    
    if ($archivoCSV !== false) { 
        crearCsvSinDependencias (CLAVE_URI);
    }	
?>