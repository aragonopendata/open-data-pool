<?php
namespace ApiRest\WorkerBundle\Controller;

spl_autoload_register(function ($Worker) {
    include __DIR__ . '/' . str_replace('\\','/', $Worker) . '.php';
});

class Main
{

    function worker($idVista, $dir)
    {
        $gestor = opendir($dir);
        while ($entrada = readdir($gestor)) {
            if ($entrada != "." && $entrada != "..") {
                $id = $idVista;
                $carpeta = $entrada;
                $work = new Worker($id, $carpeta, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
                $work->Procesa("/data/AOD_Pool_PAC/API/web/publicacion", "/data/AOD_Pool_PAC/API/web/publicacion");
            }
        }
    }
}
$main = new Main();
$main->worker('267', '/data/AOD_Pool_PAC/API/web/publicacion/267API');
?>
