<?php
require_once './config/configuracion.php'; // Contiene la configuracion del programa.
require_once './config/dcTypes.php'; // Incluimos los dcTypes que tiene cada vista.
require_once './config/dcTypesBOA.php'; // Incluimos los dcTypes que tiene cada vista.
require_once './lib/pgsql.php'; // Contiene las funciones relacionadas con PostgreSQL
require_once './lib/filesystem.php'; // Contiene las funciones relacionadas con el manejo de archivos.
require_once './lib/aod.php'; // Contiene funciones relacionadas con el Api de Aragon.
require_once('./lib/sparqllib.php'); // Contiene las funciones para acceder al EndPoint de virtuoso.
require_once('./lib/PHPMailer/src/PHPMailer.php'); // Contiene las funciones y metodos para enviar correos.
require_once('./lib/PHPMailer/src/Exception.php'); // Contiene el control de excepciones para enviar correos.
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

iniciarEstructuraDirectorios(); // 

if (empty($VistasActualizar)) {
    $ConsultaSQLVistasActualizar = "SELECT distinct code,nombre,criterio,periodicidad,fecha,hora,estado,logs,archivos,active,created FROM public.cargavistas where periodicidad in ('semanal','diaria','mensual') and active is true";
} else {
    //Generamos el string para usar la funcion IN de SQL Server.
    $ArrayVistasActualizar  = explode(',', $VistasActualizar); // Convertimos los parametros a Array para poder tratar los datos.
    // Inicializamos variables vacias para prevenir errores de codigo.
    $ListaVistasActualizar  = '';
    $ParametrosCondicionSQL = '';
    // Recorremos el array y generamos un string para añadir a la funcion IN de SQL.
    foreach ($ArrayVistasActualizar as $numArray => $ListaVistasActualizar) {
        // Si la vista no es del BOA: nos aseguramos que el valor es numerico para evitar SQLi y preparamos la condición.
        if ($ListaVistasActualizar != 'boa_eli') {
            $ParametrosCondicionSQL = $ParametrosCondicionSQL . 'nombre like \'' . filter_var($ListaVistasActualizar, FILTER_SANITIZE_NUMBER_INT) . ' %\' or ';
        } else {
            $ParametrosCondicionSQL = $ParametrosCondicionSQL . 'nombre like \'' . $ListaVistasActualizar . '%\' or ';
        }
    }
    $ParametrosCondicionSQL      = substr_replace($ParametrosCondicionSQL, "", -3); // Eliminamos la ?ltima coma del string generado.
    $ConsultaSQLVistasActualizar = "SELECT distinct code,nombre,criterio,periodicidad,fecha,hora,estado,logs,archivos,active,created FROM public.cargavistas where " . $ParametrosCondicionSQL;
    
}


$conexionSQL      = conectarPosgreSQL($host, $puerto, $bbdd, $usuario, $clave);
$VistasActualizar = ConsultarPostgreSQL($conexionSQL, $ConsultaSQLVistasActualizar);

$Numfila = 0;

$ArrayVistasExcluir  = explode(',', $VistasExcluir); // Convertimos los parametros a Array para poder tratar los datos. 
while ($fila = pg_fetch_array($VistasActualizar, $Numfila, PGSQL_NUM)) {
    // Indica la fila que luego hay que actualizar en Base de datos.
    $IDFilaEnBBDD              = $fila[0];
    $nombreVista               = $fila[1];
    $periocidad                = $fila[3];
    $ultimaActualizacion       = $fila[4];
    $FechaultimaActualizacion  = new DateTime($ultimaActualizacion); // convertimos el valor de BBDD a un objeto DateTime .
    $FechaActual               = new DateTime(); // Obtenemos la fecha actual como objeto DateTime.
    $DiasDiferenciaEntreFechas = $FechaultimaActualizacion->diff($FechaActual)->format("%d"); // Guardamos la diferencia en dias desde la ultima carga.
    
    // Condicion para actualizar la vista, primero si es la vista del BOA (diferente fuente de dato), si es mensual mas de 6 dias sin refrescar, si es diaria todos los dias y si es Mensual cada 27 dias para no agregar complejidad y que actulize en febrero.
    if ($nombreVista == 'boa_eli') {
        $ResultadoDescarga = DescargarBOAJSON();
        logErrores("Descargado el BOA en formato JSON, ahora verificaremos los datos de la vista");
        if ($ResultadoDescarga === 'FIN') {
            logErrores("Se ha descargado el fichero JSON correctamente");
            // Solo al terminar de descargar bien el fichero BOA en JSON procedemos con la conversion del CSV.
            GenerarCSVDesdeBOAJSON();

            if (VerificarDatosBOA($nombreVista) or in_array($nombreVista, $ArrayVistasExcluir)) {
                logErrores("Se va a proceder a actualizar");
                VerificarEspacioEnDisco();
                actualizarCSV(0, $nombreVista, $dcTypesBOA, $URLApi);
            } else {
                logErrores("No se va a actualizar.");
            }
        }
    } elseif (($periocidad = 'semanal' and $DiasDiferenciaEntreFechas > 6) or $periocidad = 'diaria' or ($periocidad = 'mensual' and $DiasDiferenciaEntreFechas > 27) or !empty($VistasActualizar) ) {
        $NumeroVista = (int) filter_var($nombreVista, FILTER_SANITIZE_NUMBER_INT);
        logErrores("Leida desde base de datos la vista numero $NumeroVista con nombre $nombreVista , periocidad $periocidad y ultima actualizacion $ultimaActualizacion");
        $ResultadoDescarga = DescargarVistaCompleta($NumeroVista);
        logErrores("Descargada la vista ahora verificaremos los datos de la vista");
        if ($ResultadoDescarga === 'FIN') {
            // Solo al terminar de descargar bien la vista procedemos con la conversion del CSV.
            GenerarCSVDesdeXMLVista($NumeroVista);
            if (VerificarDatosVista($NumeroVista) or in_array($NumeroVista, $ArrayVistasExcluir) ) {
                VerificarEspacioEnDisco();
                actualizarCsv($NumeroVista, $nombreVista, $dcTypes, $URLApi);
            }
            
        }
    }
    $Numfila++;
    
}
;
?>
