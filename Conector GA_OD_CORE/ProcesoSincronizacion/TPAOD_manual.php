<?php
require_once './config/configuracion.php'; // Contiene la configuracion del programa.
require_once './config/dcTypes.php'; // Incluimos los dcTypes que tiene cada vista.
require_once './lib/pgsql.php'; // Contiene las funciones relacionadas con PostgreSQL
require_once './lib/filesystem.php'; // Contiene las funciones relacionadas con el manejo de archivos.
require_once './lib/aod.php'; // Contiene funciones relacionadas con el Api de Aragon.
iniciarEstructuraDirectorios(); // 
// $ConsultaSQLVistasActualizar = "SELECT code,nombre,criterio,periodicidad,fecha,hora,estado,logs,archivos,active,created FROM public.cargavistas where periodicidad in ('semanal','diaria','mensual')";
$ConsultaSQLVistasActualizar = "SELECT code,nombre,criterio,periodicidad,fecha,hora,estado,logs,archivos,active,created FROM public.cargavistas where nombre in ('11 Datos Municipio')";

$conexionSQL      = conectarPosgreSQL($host, $puerto, $bbdd, $usuario, $clave);
$VistasActualizar = ConsultarPostgreSQL($conexionSQL, $ConsultaSQLVistasActualizar);

$Numfila = 0;
while ($fila = pg_fetch_array($VistasActualizar, $Numfila, PGSQL_NUM)) {
    // Indica la fila que luego hay que actualizar en Base de datos.
    $IDFilaEnBBDD              = $fila[0];
    $nombreVista               = $fila[1];
    $periocidad                = $fila[3];
    $ultimaActualizacion       = $fila[4];
    $FechaultimaActualizacion  = new DateTime($ultimaActualizacion); // convertimos el valor de BBDD a un objeto DateTime .
    $FechaActual               = new DateTime(); // Obtenemos la fecha actual como objeto DateTime.
    $DiasDiferenciaEntreFechas = $FechaultimaActualizacion->diff($FechaActual)->format("%d"); // Guardamos la diferencia en dias desde la ultima carga.
    
    
    // Condicion para actualizar la vista, si es mensual mas de 6 dias sin refrescar, si es diaria todos los dias y si es Mensual cada 27 dias para no agregar complejidad y que actulize en febrero.
    if (($periocidad = 'semanal' and $DiasDiferenciaEntreFechas > 6) or $periocidad = 'diaria' or ($periocidad = 'mensual' and $DiasDiferenciaEntreFechas > 27)) {
        $NumeroVista = (int) filter_var($nombreVista, FILTER_SANITIZE_NUMBER_INT);
        logErrores("Leida desde base de datos la vista numero $NumeroVista con nombre $nombreVista , periocidad $periocidad y ultima actualizacion $ultimaActualizacion");
        $ResultadoDescarga = DescargarVistaCompleta($NumeroVista);
        if ($ResultadoDescarga === 'FIN') {
            // Solo al terminar de descargar bien la vista procedemos con la conversion del CSV.
            GenerarCSVDesdeXMLVista($NumeroVista);
            actualizarCsv($NumeroVista, $nombreVista, $dcTypes, $URLApi);
        }
    }
    $Numfila++;
    
}
;
?>
