<?php

namespace ApiRest\WorkerBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

use ApiRest\WorkerBundle\Controller\Trazas;
use ApiRest\WorkerBundle\Controller\Worker;

class DefaultController extends Controller
{
    /**
     * @Route("/worker/{id}") 1522477576 "152247757"
     */
    public function indexAction($id)
    {
        $nowtime = time();
        $trazaError="";
        $error = false;
        try{
            $parametrosUrl = explode("_",$id);
            $idIso = base64_decode($parametrosUrl[0]);
            $cuenta = strlen($parametrosUrl[1]);
            //recojo las variables de la cadena URL
            //el tiemstamp de seguridad
            $fromtime = substr($parametrosUrl[1], 14);
            //el nombre de la carpeta 
            $csv  = substr($parametrosUrl[1], 0, 8) . "_" . substr($parametrosUrl[1], 8, 6);
            $dctype = base64_decode($parametrosUrl[2]);
			$actualizarItems = $parametrosUrl[3];
            //id de isonomia
           
        }  catch (Exception $e) {
            $trazaError=$e->getMessage();
        } 
        //recojo los parámetros de la configuracion
        $parametros = $this->container->getParameter('api_publicacion');
    
        if (is_null($parametros)) {
            $error = true;
            $trazaError = "No se han informado los parámetros de configuración AodPool";
        }
        if (!$error) {
            $error = $error && (!isset($parametros['isql_host']));
            $error = $error && (!isset($parametros['isql_db']));  
            $error = $error && (!isset($parametros['isql_tam_buffer_lineas']));   
            $error = $error && (!isset($parametros['smtp_encryption']));  
            $error = $error && (!isset($parametros['smtp_host']));
            $error = $error && (!isset($parametros['smtp_port'])); 
            $error = $error && (!isset($parametros['smtp_username'])); 
            $error = $error && (!isset($parametros['smtp_password']));
            $error = $error && (!isset($parametros['email_from']));
            $error = $error && (!isset($parametros['email_to']));
            $error = $error && (!isset($parametros['mail_file']));
            $error = $error && (!isset($parametros['trazas_debug']));
            $error = $error && (!isset($parametros['time_stamp_worker']));
            if ($error) {
                $trazaError = "No se han informado alguno de los parámetros de configuración AodPool";
            } 
        }
     /*   if (!$error) { 
            $timeStamp = $parametros['time_stamp_worker'];
            //compruebo que a llamada es inmediata      
            if (($nowtime - $fromtime)> intval($timeStamp)){
                $error = true;
                $trazaError = "Llamada fuera de tiempo ";
            }
        }*/
        //compruebo que la llamada es local
        if (!in_array( $_SERVER['REMOTE_ADDR'], array( '127.0.0.1', '::1','localhost'))){
            $error = true;
            $trazaError = "La llamada no es localhost";
        }  
        if (!isset($idIso)) {
            $error = true;
            $trazaError = "El idisonomia es requerido";
        } 
        //calculo las rutas relativas al proceso
        $appPath = $this->container->getParameter('kernel.root_dir');
        $webPath = realpath($appPath . '/../web/publicacion');
        $pathNoporcesados =  sprintf("%s/NoProcesados/%s", $webPath, $csv);
        //genera un nuevo contenedor de trazas
        $trazas = new Trazas($pathNoporcesados);
        $trazas->setClase("worker");
        $trazas->LineaInfo("indexAction","Inicio Trabajo worker");
        if (!$error) {          
            $worker = new Worker($idIso, 
                                $csv,
                                $dctype,
                                $actualizarItems,
                                $parametros['isql_host'],
                                $parametros['isql_db'], 
                                $parametros['isql_tam_buffer_lineas'],
                                $parametros['smtp_encryption'], 
                                $parametros['smtp_host'],
                                $parametros['smtp_port'],
                                $parametros['smtp_username'],
                                $parametros['smtp_password'],
                                $parametros['email_from'],
                                $parametros['email_to'],
                                $parametros['mail_file'],
                                $parametros['trazas_debug'],
                                $trazas);
			$worker->Procesa($webPath,$appPath); 
            $trazas->LineaInfo("indexAction","Fin Trabajo worker"); 
            return $this->render('@ApiRestAodPool/Default/index.html.twig', array(
                "mensaje" =>  "Proceso realizado con éxito"));  
        } else {
            $trazas->LineaInfo("indexAction","Fin Trabajo worker");   
            $trazas->LineaError("indexAction", $trazaError);   
            return $this->render('@ApiRestAodPool/Default/index.html.twig', array(
                "mensaje" =>  "Acceso no permitido o erróneo"));
        }

    }

}
