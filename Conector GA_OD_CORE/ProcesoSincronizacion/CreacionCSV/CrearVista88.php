<?php 
    $vista = 88;
    define ("CLAVE_URI", "DCOMAR");   
    
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        crearCsvSinDependencias (CLAVE_URI);
    }
 ?>