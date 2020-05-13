<?php
namespace ApiRest\WorkerBundle\Controller;

spl_autoload_register(function ($Worker) {
    include $Worker . '.php';
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
                $work->Procesa("/var/www/html/web/publicacion", "/var/www/html/app/publicacion");
            }
        }
    }
}
$main = new Main();
$main->worker('78', '/data/AOD_Pool_PAC');
?>