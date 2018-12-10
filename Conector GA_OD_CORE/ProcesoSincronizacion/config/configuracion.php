<?php
date_default_timezone_set('Europe/Madrid'); // Configura la zona horaria por si no esta configurada.
ini_set('max_execution_time', 86400); // Aumenta el tiempo maximo de ejecucio para evitar ejecuciones intermedias.n:  http://php.net/manual/en/info.configuration.php#ini.max-execution-time
ini_set('memory_limit', '-1'); // No quitar el  limite de uso de memoria, para evitar ejecuciones intermedias.
$host        = 'servidor.local'; // IP del servidor PostgreSQL 
$puerto      = '5432'; // Puerto del servidor PostgreSQL 
$bbdd        = 'bbdd'; // Nombre de la base de datos que se consultara del servidor PostgreSQL.
$usuario     = 'nombrebbdd'; // Usuario con el que se conectara al servidor PostgreSQL.
$clave       = 'clavebbdd'; // Clave del usuario con el que se conectara al servidor PostgreSQL.
$RutaTrabajo = '.'; // Indica la carpeta donde se guardaran las descargas y los logs de la descarga.
$URLApi      = 'http://localhost/api-publicacion/publicacion/update/view.json'; //Indica la URL del Api de AODPOOL
?>
