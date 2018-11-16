<?php

function iniciarEstructuraDirectorios()
{
    global $RutaTrabajo;
    CrearCarpeta($RutaTrabajo . '/Log/');
    CrearCarpeta($RutaTrabajo . '/VistasXml/');
    CrearCarpeta($RutaTrabajo . '/VistasCsv/');
    CrearCarpeta($RutaTrabajo . '/Log/ArchivosErroneos');
}

function CrearCarpeta($carpeta)
{
    if (!file_exists($carpeta)) {
        mkdir($carpeta, 0777, true);
        if (!file_exists($carpeta)) {
            logErrores('TPAOD: No se he podido crear la carpeta de trabajo ' . $carpeta);
        }
    }
    
    
}

function logErrores($Mensaje)
{
    syslog(LOG_INFO, 'TPAOD: ' . date("Y-m-d H:i:s") . ' ' . $Mensaje);
    
}

?>