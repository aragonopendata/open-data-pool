<?php
require_once './config/configuracion.php'; // Contiene la configuracion del programa.
require_once './config/dcTypes.php'; // Incluimos los dcTypes que tiene cada vista.
require_once './lib/pgsql.php'; // Contiene las funciones relacionadas con PostgreSQL
require_once './lib/filesystem.php'; // Contiene las funciones relacionadas con el manejo de archivos.
require_once './lib/aod.php'; // Contiene funciones relacionadas con el Api de Aragon.
iniciarEstructuraDirectorios(); // 
DescargarVistaCompleta(10);
DescargarVistaCompleta(11);
DescargarVistaCompleta(12);
DescargarVistaCompleta(13);
DescargarVistaCompleta(16);
DescargarVistaCompleta(19);
DescargarVistaCompleta(20);
DescargarVistaCompleta(22);
DescargarVistaCompleta(24);
DescargarVistaCompleta(26);
DescargarVistaCompleta(27);
DescargarVistaCompleta(34);
DescargarVistaCompleta(35);
DescargarVistaCompleta(150);
// DescargarVistaCompleta(136); Pendiente de revisar.

?>
