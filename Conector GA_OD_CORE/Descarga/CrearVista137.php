<?php   
    $vista = 137;
    define ("CLAVE_URI", "COD_RUTA");
    include 'comun.php'; //Incluimos toda la parte comun a todos los archivos    
       
    if ($archivoCSV !== false) {        
        crearCsvSinDependencias(CLAVE_URI);
    }
?>