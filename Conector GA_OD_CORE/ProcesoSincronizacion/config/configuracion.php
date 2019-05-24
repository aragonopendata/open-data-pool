<?php
date_default_timezone_set('Europe/Madrid'); // Configura la zona horaria por si no esta configurada.
ini_set('max_execution_time', 86400); // Aumenta el tiempo maximo de ejecucio para evitar ejecuciones intermedias.n:  http://php.net/manual/en/info.configuration.php#ini.max-execution-time
ini_set('memory_limit', '-1'); // No quitar el  limite de uso de memoria, para evitar ejecuciones intermedias.
$host        = 'postgresql.local'; // IP del servidor PostgreSQL. 
$puerto      = '5432'; // Puerto del servidor PostgreSQL.
$bbdd        = 'BBDDaodpool'; // Nombre de la base de datos que se consultara del servidor PostgreSQL.
$usuario     = 'MiUsuariodeBBDD'; // Usuario con el que se conectara al servidor PostgreSQL.
$clave       = 'MiContraseñadeBBDD'; // Clave del usuario con el que se conectara al servidor PostgreSQL.
$RutaTrabajo = '.'; // Indica la carpeta donde se guardaran las descargas y los logs de la descarga.
$URLApi      = 'http://localhost/api-publicacion/publicacion/update/view.json'; //Indica la URL del Api de AODPOOL.
$URLEndpointVirtuoso='http://virtuoso.local:8890/sparql'; // Indica la URL que se usa para acceder a virtuoso.
$ProcentajeEspacioMinimoEnDisco=10; // Indica el espacio en disco minimo requerido para realizar la carga, si se alcanza el proceso se detiene.
$EmailResponsable='responsable@example.com'; // Email al que llegaran los errores de la carga, (Solo cuando no hay espacio disponible en disco o cuando un csv contiene datos inferiores a virtuoso).
$EmailOrigen='notificacionesaodp@example.com'; // Email usado para enviar las notificaciones, usar el configurado en Postfix.
$VistasActualizar='2,4,2,'; // Indica el numero de las vistas que se van a actualizar ejemplo 3,4,7,91. Solo actualizara las vistas: 3,4,7,91, si se deja vacio ($VistasActualizar='') se actualizaran las correspondientes por fecha.
$ficheroLog=$RutaTrabajo . '/Log/TPAOD_'.date("Ymd").'.log'; // Ubicacion del Log de la TP.
$VistasExcluir='9999'; // Indica las vistas que se van a excluir indicando su numero de vista por ejemplo 3,4,7,9,1  hara que se no se compruebe el numero de triples que hay en virtuoso y el numero de filas del fichero CSV de las vistas 3,4,7,9 y 1 a la hora de actualizarse (Esto es para que no se compruebe que en el fichero vienen menos filas que sujetos hay en virtuoso.).
?>
