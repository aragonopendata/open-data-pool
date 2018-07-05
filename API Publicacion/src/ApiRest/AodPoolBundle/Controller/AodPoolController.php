<?php // AodPool/src/ApiRest/AodPoolBundle/Controller/AodPoolController.php

namespace ApiRest\AodPoolBundle\Controller;



use FOS\RestBundle\Controller\Annotations\Get; 
use FOS\RestBundle\Controller\Annotations\Post; 
use FOS\RestBundle\Controller\Annotations\Delete; 
use FOS\RestBundle\Controller\Annotations\Put; 
use FOS\RestBundle\Controller\Annotations\View; 
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\ExceptionController;

use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter; 
use Symfony\Component\Process\PhpExecutableFinder;
use Symfony\Component\HttpFoundation\Request; 
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;


use Swagger\Annotations as SWG;

use ApiRest\AodPoolBundle\Entity\Publicacion; 
use ApiRest\AodPoolBundle\Form\Type\PublicacionPoolType;

use ApiRest\AodPoolBundle\Entity\Esquema; 
use ApiRest\AodPoolBundle\Form\Type\EsquemaPoolType;

use ApiRest\AodPoolBundle\Entity\Update; 
use ApiRest\AodPoolBundle\Form\Type\UpdatePoolType;

use ApiRest\AodPoolBundle\Entity\UpdateItems; 
use ApiRest\AodPoolBundle\Form\Type\UpdateItemsPoolType;

use ApiRest\AodPoolBundle\Repository\WebConfig;
use ApiRest\AodPoolBundle\Entity\Configuracion;


use ApiRest\AodPoolBundle\Controller\Utility\Trazas;

use Katzgrau\KLogger\Logger;
use Psr\Log\LogLevel;

use Symfony\Component\Yaml\Yaml;

/*
use Symfony\Bundle\FrameworkBundle\Console\Application;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\ProcessBuilder;

use Symfony\Component\Console\Input\ArrayInput;
use Symfony\Component\Console\Output\BufferedOutput;
*/

/**
 * Clase que publica los servicios REST
 */
class AodPoolController extends FOSRestController {


    //clase de trazas
    protected $trazas=null;

    public function setTrazas($trazas){
        $this->trazas = $trazas;
    }

    //directorio de la apliacion
    protected $appPath=null;

    public function getTrazas(){
        if (!isset($this->trazas)){
            $this->appPath = $this->container->getParameter('kernel.root_dir');
            $directoryPath = str_replace("app","src/ApiRest/AodPoolBundle/Resources/Files/Logs/",$this->appPath);
            $trazas = new Trazas($directoryPath);
            $trazas->setClase("AodPoolController");
            $trazasDebug = $this->container->getParameter('api_publicacion')['trazas_debug'];
            $trazas->setEscribeTrazasDebug($trazasDebug); 
            $this->SetTrazas($trazas);
        }
        return $this->trazas;
    }

    /** 
    * Servicio de lectura de las configuraciones web, en el servidor. Devuelve los nombres, rdftype o dftype de los existentes.
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/web/configuracion/listadoyammer")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve el listado de configuraciones existentes en el servidor ",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    */
	public function getListadoYammerAction(Request $request)
	{
        $errorFormulario = "";
        $this->getTrazas()->LineaDebug("getListadoAction","llamada a Función");
        $dal = $this->get('Repository_WebConfig');   
        $rdfs = $dal->GetConfiguracionWebs();         
        if (count($rdfs)==0) {
            $errorFormulario = $errorFormulario . " No existe ninguna configuración" ;
            $this->getTrazas()->LineaInfo("getListadoAction","No existe ninguna configuración");
        }
        if (empty($errorFormulario)) {
            $this->getTrazas()->LineaError("getListadoAction","Fin proceso rest");  
            return $rdfs;   
        } else {
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getListadoAction","Fin proceso rest");  
            throw $ex;
        }
    }

    /** 
    * Servicio de lectura de una configuración web en servidor. Devuelve el archivo yammer por nombre en formato yml. Para descarga directa del archivo *.yml desde el navegador ( /api/web/configuracion/yammer/{nombre}.json)
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|file
	*
	* @View()
    * @Get("/web/configuracion/yammer/{nombre}")
    * @throws BadRequestHttpException
    * @return file
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve una configuración web existente en el servidor por nombre en formato yml.",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function getYammerAction(Request $request, $nombre)
	{
        $this->getTrazas()->LineaInfo("getYammerAction","llamada a Función");
        $yammerContenido="";
        $errorFormulario ="";
        if ($nombre=="{nombre}"){
            $nombre="";
        }
        if (empty($nombre)) {
            $errorFormulario = $errorFormulario . " El nombre del la configuración es requerido.";
            $this->getTrazas()->LineaError("getYammerAction","El nombre del esquema es requerido");
        } else {
            $dal = $this->get('Repository_WebConfig');   
            $yammerContenido = $dal->GetConfiguracionWebYammerbySlug($nombre); 
            if (strlen($yammerContenido)==0) {
                $errorFormulario = $errorFormulario . " No existe ninguna configuracion con nombre: '" . $nombre . "'.";
                $this->getTrazas()->LineaError("getYammerAction","El nombre del esquema es requerido");
            }
        }
        if (empty($errorFormulario)) {
            $this->getTrazas()->LineaDebug("getYammerAction","Nombre:" .$nombre);
            $directoryPath = str_replace("app","src/ApiRest/WorkerBundle/Resources/Files/Yammer/",$this->appPath);
            $ficheroYammer = $nombre . ".yml";
  
            $fileDestino = $directoryPath . $ficheroYammer; 
            $this->getTrazas()->LineaDebug("getYammerAction","File:" . $fileDestino);


            $fileSystem = new Filesystem();
            //Primero si viene desde archivo
            if ($fileSystem->exists($fileDestino)) {
                $fileSystem->remove($fileDestino);
                $this->getTrazas()->LineaDebug("getYammerAction","Fichero borrado:" . $fileDestino);
            }
            $fileSystem->dumpFile($fileDestino, $yammerContenido);
            $this->getTrazas()->LineaDebug("getYammerAction","Fichero Credo:" . $fileDestino);
            chmod($fileDestino, 0744); 
            
            $this->getTrazas()->LineaDebug("getYammerAction","Fichero publicado:" . $fileDestino);
            header('Content-Description: File Transfer');
            header('Content-Type: text/html; charset=UTF-8');
            header('Pragma: public');
            header('Content-Length: ' . filesize($fileDestino));
            header('Content-disposition: attachment; filename='. basename($fileDestino));
            header('Pragma:public');
            header('Content-Length:' . filesize($fileDestino));
            $this->getTrazas()->LineaInfo("getYammerAction","Fin proceso rest");    
            readfile($fileDestino);       
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getYammerAction","Fin proceso rest");  
            throw $ex;
        }       
    }

    /** 
    * Servicio de lectura de la configuracion web en servidor por nombre. Devuelve el en formato json el yml introducido.
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/web/configuracion/{nombre}")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve una configuración web existente en el servidor por nombre en formato json",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function getConfiguracionAction(Request $request, $nombre)
	{    
        $this->getTrazas()->LineaInfo("getConfiguracionAction","llamada a Función");
        $errorFormulario ="";
        $rdfs = array();
        if ($nombre=="{nombre}"){
            $nombre="";
        }
        if (empty($nombre)) {
            $errorFormulario = $errorFormulario . " El nombre del la configuración es requerido.";
            $this->getTrazas()->LineaError("getConfiguracionAction","El nombre del esquema es requerido");
        } else {
            $dal = $this->get('Repository_WebConfig');   
            $rdfs  = $dal->GetConfiguracionWebbySlug($nombre); 
            if (count($rdfs)==0) {
                $errorFormulario = $errorFormulario . " No existe ninguna configuracion con nombre: '" . $nombre . "'.";
                $this->getTrazas()->LineaError("getConfiguracionAction","El nombre del esquema es requerido");
            }
        }
        if (empty($errorFormulario)) {
            $dal = $this->get('Repository_WebConfig');   
            $rdfs = $dal->GetConfiguracionWebbySlug($nombre);      
            /* retornar el arreglo en formato JSON */
            $this->getTrazas()->LineaInfo("getConfiguracionAction","Fin proceso rest");  
            return $rdfs;   
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getConfiguracionAction","Fin proceso rest");  
            throw $ex;
        }
    }


  /** 
    * Servicio de borrado de una configuracion web en servidor por nombre. Borra  yml introducido por nombre.
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Delete("/web/configuracion/{nombre}")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *   resource=false,
    *  description="Borra la configuración yammer existente en el servidor por nombre ",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function deleteConfiguracionAction($nombre)
	{
        $this->getTrazas()->LineaInfo("deleteConfiguracionAction","llamada a Función");
        $errorFormulario ="";
        $rdfs = array();
        if ($nombre=="{nombre}"){
            $nombre="";
        }
        if (empty($nombre)) {
            $errorFormulario = $errorFormulario . " El nombre del la configuración es requerido.";
            $this->getTrazas()->LineaError("deleteConfiguracionAction","El nombre del esquema es requerido");
        } else {
            $dal = $this->get('Repository_WebConfig');   
            $rdfs  = $dal->GetConfiguracionWebbySlug($nombre); 
            if (count($rdfs)==0) {
                $errorFormulario = $errorFormulario . " No existe ninguna configuracion con nombre: '" . $nombre . "'.";
                $this->getTrazas()->LineaError("deleteConfiguracionAction","El nombre del esquema es requerido");
            }
        }
        if (empty($errorFormulario)) {
            $dal = $this->get('Repository_WebConfig');   
            $rdfs = $dal->DeleteConfiguracionWeb($nombre);   
            $this->getTrazas()->LineaInfo("getConfiguracionAction","Fin proceso rest");   
            return array($nombre=>"Configuracion RdfType Borrado");  
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("deleteConfiguracionAction","Fin proceso rest");  
            throw $ex;
        }       
    }


    /**
    * Servicio de publicación las configuraciones web en servidor desde: archivo, o contenido yml.
    * El servicio es sincrono,es decir: registra la entrada y guarda el contenido del archivo yml en base de datos</br>
    * <h4>Notas a la publicación:</h4></br>
    * 0.- El servicio responde con un json proveniente la conversión del yml a array y de array a json</br>
    * 1.- Es muy importante revisar que la información del json es la misma que se a introducido en estructura yml .</br>
    * 2.- Es posible que por error de formato el archivo yml se guarde correctamente, pero no contenga toda la información pretendida </br>
    * 3.- Para confirmar que la información introducida es la misma que se va a extraer se responde con el json a revisar manualmente </br>
    * 7.- El encoding esperado es "UTF-8".
    * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Post("/web/configuracion")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Guarda configuraciones web en la Base de datos, por archivo (*.yml) o contenido con formato yammer.",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\ConfiguracionType",
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\Configuracion",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function postConfiguracionAction(Request $request)
	{
        //calculo la ruta de destino
        $this->getTrazas()->LineaInfo("postConfiguracionAction","llamada a Función");   
        $this->getTrazas()->LineaDebug("postConfiguracionAction","Creo un objeto rdf");
        $configuracion = new Configuracion();
        $this->getTrazas()->LineaDebug("postConfiguracionAction","Creo el formulario de validación");
        $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\ConfiguracionType', $configuracion);
        $dal = $this->get('Repository_WebConfig'); 
        //Gestiono el request
        $form->handleRequest($request);
        $yamer= array();
        if ($form->isValid()) {
            $errorFormulario ="";
            $fileSystem = new Filesystem();
            //Primero si viene desde archivo
            if (empty($configuracion->getNombre())) {
                $errorFormulario = $errorFormulario . " El nombre del esquema es requerido.";
                $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);
            } else {
                if($dal->GetExitsConfiguracionWebbySlug($configuracion->getNombre())) {
                    $errorFormulario = $errorFormulario . " El nombre del esquema ya existe.";
                    $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);   
                }    
            }
            if (empty($configuracion->getTipo())) {
                $errorFormulario = $errorFormulario . " El tipo del esquema es requerido.";
                $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);
            }  else {
                if($dal->GetExitsConfiguracionWebbyTipo($configuracion->getTipo())) {
                    $errorFormulario = $errorFormulario . " El del tipo ya se está utilizando.";
                    $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);   
                } 
            }
            if (empty($errorFormulario)) {
                $ficheroEsquema = $configuracion->getNombre() . ".yml";
                if (count($request->files)>0) {
                    if ($_FILES['yml']['error'] > 0) {
                        $errorArchivo = $this->DameErrorUpload($_FILES['yml']['error']);
                        $errorFormulario = $errorFormulario .$errorArchivo ;
                        $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);   
                    }  else {
                        $file = $request->files->get('yml');
                        $this->getTrazas()->LineaDebug("postConfiguracionAction","Recojo el archivo YML");              
                        if (!isset($file)) {
                            $errorFormulario =  $errorFormulario . " No se ha informado el archivo XML.";
                            $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);  
                        }  else  {
                            $original_filename =  $file->getClientOriginalName();
                            $ext = pathinfo($original_filename, PATHINFO_EXTENSION);
                            if ($ext!='yml') {
                                $errorFormulario = $errorFormulario ." El Archivo no es yml.";
                                $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);  
                            }
                            if (empty($errorFormulario)) {
                                $contenido = @file_get_contents($file);
                                try {
                                    $yamer = Yaml::parse( $contenido );
                                } catch (\Symfony\Component\Yaml\Exception\ParseException $e) {
                                    $errorFormulario = 'Caught exception: ' .  $e->getMessage();
                                    $this->getTrazas()->LineaError("postConfiguracionAction", $errorFormulario); 
                                }
                                if (empty($errorFormulario)) {   
                                    $configura = $dal->SetConfiguracionWeb($configuracion->getNombre(), $configuracion->getTipo(), $contenido ); 
                                }     
                            }   
                        }
                    }
                } else {
                    //Segundo si viene desde texto 
                    //recojo el texto si lo ha enviado via textArea
                    $fileTxt =  $configuracion->getYml();
                    //valido que el csv stá bien formado separado por  ;
                    $this->getTrazas()->LineaDebug("postConfiguracionAction","Validación del texto introducido como YML");    
                    if (!empty($fileTxt)) 
                    {   
                        //reviso el yml desde el texto
                        try {
                            $yamer = Yaml::parse( $fileTxt );
                        } catch (\Symfony\Component\Yaml\Exception\ParseException $e) {
                            $errorFormulario = 'Caught exception: ' .  $e->getMessage();
                            $this->getTrazas()->LineaError("postConfiguracionAction", $errorFormulario); 
                        }  
                        $dal = $this->get('Repository_WebConfig');   
                        $configura = $dal->SetConfiguracionWeb($configuracion->getNombre(), $configuracion->getTipo(), $fileTxt  );      
                    } else {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Yml.";
                    } 
                }
            }
            if (empty($errorFormulario)) { 
                $this->getTrazas()->LineaInfo("postConfiguracionAction","Archivo yml de configuracion rdfType guardado con éxito en Base de datos");   
                $this->getTrazas()->LineaInfo("postConfiguracionAction","Fin proceso rest");    
                return array("Configuracion RdfType" =>  $yamer);
            } else {     
                $ex = new BadRequestHttpException($errorFormulario);
                $this->getTrazas()->LineaError("postConfiguracionAction","Fin proceso rest");  
                throw $ex;
                return array('Configuracion RdfType' => "Proceso con errores");
            }
        } else {
            $ex = new BadRequestHttpException("Sin Parámetros",null ,400);
            $this->getTrazas()->LineaInfo("postConfiguracionAction","Fin proceso rest");  
            throw $ex;
        }
        $this->getTrazas()->LineaInfo("postConfiguracionAction","Fin proceso rest");  
	    return array(
            //devuelvo el error
		    'form' => $form,
        );  
    }



    /**
    * Servicio de lectura de esquemas de configuracion para la publicación en virtuoso. Devuelve el listado de los esquemas existentes.
    * El servicio es síncrono,es decir: registra la entrada y responde inmediatamente. 
    * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/publicacion/esquema/listadoxml")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve el listado de los esquemas de configuracion para la publicación en virtuoso",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function getListadoXmlAction(Request $request)
	{
        $errorFormulario ="";
        $this->getTrazas()->LineaInfo("getEsquemasAction","llamada a Función");  
        $directoryPath = str_replace("app","src/ApiRest/WorkerBundle/Resources/Files/Isonomias/",$this->appPath);

        $files = preg_grep('~\.(xml)$~', scandir($directoryPath,1)); 
        if (count($files)==0){
            $errorFormulario = $errorFormulario . " No hay esquemas en el servidor.";
            $this->getTrazas()->LineaError("getEsquemasAction",$errorFormulario);
        } 
        if (empty($errorFormulario)) { 
            $esquemas = array();
            foreach ($files as $file) {
                $esquemas[] = str_replace(".xml", "",$file);
            }
            $this->getTrazas()->LineaInfo("getEsquemasAction","Fin proceso rest");
            return array ("Esquemas"=>$esquemas); 
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getEsquemasAction","Fin proceso rest");  
            throw $ex;
        } 
    }

      /** 
    * Servicio de lectura de una configuración de publicación de triples en virtuoso. Devuelve el archivo XML por nombre en formato XML. Para descarga directa del archivo *.yml desde el navegador ( /api/publicacion/esquema/xml/{nombre}.json)
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|file
	*
	* @View()
    * @Get("/publicacion/esquema/xml/{nombre}")
    * @throws BadRequestHttpException
    * @return file
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve una configuración de publicación de triples en virtuoso por nombre en formato XML.",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function getXmlAction(Request $request, $nombre)
	{
        $this->getTrazas()->LineaInfo("getXmlAction","llamada a Función");
        $this->getTrazas()->LineaDebug("getXmlAction","Nombre:" .$nombre);
        $fileDestino="";
        $errorFormulario ="";
        $fileSystem = new Filesystem();
        if ($nombre=="{nombre}"){
            $nombre="";
        }
        if (empty($nombre)) {
            $errorFormulario = $errorFormulario . " El nombre del esquema es requerido.";
            $this->getTrazas()->LineaError("getXmlAction",$errorFormulario);
        } else {
            $directoryPath = str_replace("app","src/ApiRest/WorkerBundle/Resources/Files/Isonomias/",$this->appPath);
            $fileDestino = $directoryPath . $nombre . ".xml";
            if (!$fileSystem->exists($fileDestino)) {
                $errorFormulario = $errorFormulario . " No hay esquemas en el servidor con el nombre indicado.";
                $this->getTrazas()->LineaError("getXmlAction",$errorFormulario);
            }  
        } 
        if (empty($errorFormulario)) {
            $this->getTrazas()->LineaDebug("getXmlAction","Fichero publicado:" . $fileDestino);
            header('Content-Description: File Transfer');
            header('Content-Type: text/html; charset=UTF-8');
            header('Pragma: public');
            header('Content-Length: ' . filesize($fileDestino));
            header('Content-disposition: attachment; filename='. basename(str_replace(" ", "_",$fileDestino)));
            header('Pragma:public');
            header('Content-Length:' . filesize($fileDestino));
            $this->getTrazas()->LineaInfo("getXmlAction","Fin proceso rest");    
            readfile($fileDestino);       
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getXmlAction","Fin proceso rest");  
            throw $ex;
        }       
    }

    /**
    * Servicio de borrado de los esquemas XML de configuracion para la publicacion en virtuoso existentes por nombre.
    * El servicio es síncrono,es decir: registra la entrada y responde inmediatamente. 
    * 
	* @var Request $request
	* @return View|array
	*
    * @View()
    * @Delete("/publicacion/esquema/{nombre}")

    * @throws BadRequestHttpException
    * @return array
    * @ApiDoc(
    *  description="Borra esquemas XML de configuracion para la publicacion en virtuoso existentes por nombre",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function deleteEsquemaAction(Request $request, $nombre)
	{
        $errorFormulario ="";
        if ($nombre=="{nombre}"){
            $nombre="";
        }
        $this->getTrazas()->LineaInfo("deleteEsquemaAction","llamada a Función"); 
        $fileSystem = new Filesystem();
        $fileDestino="";
        if (empty($nombre)) {
            $errorFormulario = $errorFormulario . " El nombre del esquema es requerido.";
            $this->getTrazas()->LineaError("postConfiguracionAction",$errorFormulario);
        } else {
            $directoryPath = str_replace("app","src/ApiRest/WorkerBundle/Resources/Files/Isonomias/",$this->appPath);
            $fileDestino = $directoryPath . $nombre . ".xml";
            if (!$fileSystem->exists($fileDestino)) {
                $errorFormulario = $errorFormulario . " No hay esquemas en el servidor con el nombre indicado.";
                $this->getTrazas()->LineaError("deleteEsquemaAction",$errorFormulario);
            }  
        }     
        if (empty($errorFormulario)) { 
            $fileSystem->remove($fileDestino);
            $this->getTrazas()->LineaInfo("deleteEsquemaAction","Fin proceso rest");
            return array("status" => "Borrado:" . $fileDestino); 
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("deleteEsquemaAction","Fin proceso rest");  
            throw $ex;
        }  
          
    }

    /**
    * Servicio de publicación de esquemas de configuracion para la publicacion en virtuoso desde: archivo, o contenido XML.
    * El servicio es asíncrono,es decir: registra la entrada y guarda el archivo para devolver la respuesta. </br>
    * <h4>Notas a la publicación:</h4></br>
    * 0.- Todos los campos de referencia al CSV han de estar limitados por llaves Ejemplos: '{CAMPO}',  '{CAMPO1}{CAMPO2}'.</br>
    * 1.- Si el lugar donde se introduce un campo o campos del CSV parsea un namespace, no ha de haber espacios ni caracteres no validos para el dicho namespace.</br>
    * 2.- Los atribute 'condition' han de informase con un campo que tenga informado un valor booleano  [1|0] y [true|false] (incluidas las minúsculas)</br>
    * 3.- Tipos permitidos: [time | dateTime | integer | float | decimal | string  | boolean ].(Se ha de poner exacto incluidas las mayúsculas). </br>
    * 4.- Los nodos con atributo ‘value’ han de ser de tipo string</br>
    * 5.- El atributo type es obligatorio para todos los nodos Property.
    * 6.- Añañadir nodo superior (<?xml version="1.0" encoding="UTF-8"?>)
    * 7.- El encoding esperado es "UTF-8".
    * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Post("/publicacion/esquema")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Guarda esquemas XML de configuracion para la publicacion en virtuoso desde archivo o contenido XML.",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\EsquemaPoolType",
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\Esquema",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function postEsquemaAction(Request $request)
	{
        //calculo la ruta de destino
        $this->getTrazas()->LineaInfo("postEsquemaAction","llamada a Función"); 
        $this->getTrazas()->LineaInfo("postEsquemaAction","Inicio proceso API publicacion");
        $this->getTrazas()->LineaInfo("postEsquemaAction","Creo un objeto entidad");
        $esquemaXML = new Esquema();
        $this->getTrazas()->LineaInfo("postEsquemaAction","Creo el formulario de validación");
        $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\EsquemaPoolType', $esquemaXML);
        $directoryPath = str_replace("app","src/ApiRest/WorkerBundle/Resources/Files/Isonomias/",$this->appPath);
        //Gestiono el request
        $form->handleRequest($request);
        if ($form->isValid()) {
            $errorFormulario ="";
            $fileSystem = new Filesystem();
            //Primero si viene desde archivo
            if (empty($esquemaXML->getNombre())) {
                $errorFormulario = $errorFormulario . " El nombre del esquema es requerido";
                $this->getTrazas()->LineaError("postEsquemaAction","El nombre del esquema es requerido"); 
            } 
            if (empty($errorFormulario)) {
                $ficheroEsquema = $esquemaXML->getNombre() . ".xml";
                if (count($request->files)>0) {
                    if ($_FILES['xml']['error'] > 0) {
                        $errorArchivo = $this->DameErrorUpload($_FILES['xml']['error']);
                        $errorFormulario = $errorFormulario .$errorArchivo ;
                        $this->getTrazas()->LineaError("postInsertAction",$errorFormulario );     
                    }  else {
                        $file = $request->files->get('xml');
                        $this->getTrazas()->LineaInfo("postEsquemaAction","Recojo el archivo XML"); 
                        
                        if (!isset($file)) {
                            $errorFormulario =  $errorFormulario . " No se ha informado el archivo XML.";
                            $this->getTrazas()->LineaError("postEsquemaAction","No se ha informado el archivo Xml."); 
                        }  else  {
                            $original_filename =  $file->getClientOriginalName();
                            $ext = pathinfo($original_filename, PATHINFO_EXTENSION);
                            if ($ext!='xml') {
                                $errorFormulario = $errorFormulario ." El Archivo no es xml.";
                                $this->getTrazas()->LineaError("postEsquemaAction","El Archivo no es xml."); 
                            }
                          // $errorFormulario = $errorFormulario  . $this->ComprueboXMLBienformado($file);
                            if (empty($errorFormulario)) {
                                $comprubaISOCSV = new Isonomia("", $this->trazas->getLogger(), $this->appPath, $this->trazas->getEscribeTrazasDebug());
                                $errorFormulario = $errorFormulario . $comprubaISOCSV->CompruebaEntityCarga($file);
                            }
                            if (empty($errorFormulario)) {
                                //Muevo el archivo csv a la carpeta del proceso
                                $this->getTrazas()->LineaInfo("postEsquemaAction","Muevo el archivo xml a la carpeta:" . $directoryPath); 
                                $fileDestino = $directoryPath . $ficheroEsquema;
                                if ($fileSystem->exists($fileDestino)) {
                                $fileSystem->remove($fileDestino);
                                }
                                $file->move($directoryPath, $ficheroEsquema);
                                chmod($fileDestino, 0744); 
                            }     
                        }
                    }
                } else {
                    //Segundo si viene desde texto 
                    //recojo el texto si lo ha enviado via textArea
                    $fileTxt =  $esquemaXML->getXml();
                    //valido que el csv stá bien formado separado por  ;
                    $this->getTrazas()->LineaInfo("postEsquemaAction","Validación del texto introducido como XML");     
                    if (!empty($fileTxt)) 
                    {   
                        //Muevo el archivo csv a la carpeta del proceso     
                        $this->getTrazas()->LineaInfo("postInsertAction","Creo el archivo XML a la carpeta:" . $directoryPath);
                        $fileDestino = $directoryPath . $ficheroEsquema;
                        if ($fileSystem ->exists($fileDestino)) {
                            $fileSystem->remove($fileDestino);
                        }
                        $fileSystem->dumpFile($fileDestino, $fileTxt);
                        chmod($fileDestino, 0744); 
                        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo XML bien formado"); 

                       // $errorFormulario = $errorFormulario . $this->ComprueboXMLBienformado($fileDestino);   
                       if (empty($errorFormulario)) {
                            $comprubaISOCSV = new Isonomia("", $this->trazas->getLogger(), $this->appPath, $this->trazas->getEscribeTrazasDebug()); 
                            $errorFormulario = $errorFormulario . $comprubaISOCSV->CompruebaEntityCarga($fileDestino);
                        }           
                        if (!empty($errorFormulario)) {
                            $this->getTrazas()->LineaInfo("postInsertAction","Borro el Archivo" . $fileDestino);  
                            $fileSystem->remove($fileDestino);
                        }
                    } else {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                    } 
                }
            }
            if (empty($errorFormulario)) {
                $this->getTrazas()->LineaInfo("postEsquemaAction","Archivo XML isonómico guardado con éxito");        
                $this->getTrazas()->LineaInfo("postEsquemaAction","Fin proceso rest");    
                return array("esquema" =>  $esquemaXML);
            } else {     
                $ex = new BadRequestHttpException($errorFormulario);
                $this->getTrazas()->LineaInfo("postEsquemaAction","Fin proceso rest");
                throw $ex;
                return array('Isonomía' => "Proceso con errores",);
            }
        } else {
            $ex = new BadRequestHttpException("Sin Parámetros",null ,400);
            $this->getTrazas()->LineaInfo("postEsquemaAction","Fin proceso rest");
            throw $ex;
        }
        $this->getTrazas()->LineaInfo("postEsquemaAction","Fin proceso rest");
	    return array(
            //devuelvo el error
		    'form' => $form,
        );  
    }
    
    /**
    * Servicio de publicación de triples en servidor Virtuoso, desde: archivo, o contenido Csv separado por ';' y identificador de isonomía. <br>
    * El servicio es asíncrono,es decir: registra la entrada y lanza la tarea de carga de las triples en un subproceso. <br>
    * El mensaje de confirmación del servicio, es inmediato y solo indica la recepción de la solicitud. El proceso de carga triples tarda mas tiempo. <br>
    * Al termino del subproceso se envía un email, informando al administrador de lo ocurrido.  <br>
    * <h4>Notas a la carga de datos:</h4></br>
    * 0.- El CSV ha de estar limitado por ";". </br>
    * 1.- Si se crea el CSV con excel Todos los campos en el CSV ha de ser de formato texto. </br>
    * 2.- Los capos con tipo booleano y el atributo ‘condition’ han de ser valores [1/0] y [true/false] (con minúsculas) <font color="red">Cuidado con Excel que pone valores booleanos  "VERDADERO/FALSO" y "TRUE/FALSE" y darían error.</font><br>
    * 3.- Los datos float y decimal deben de estar con separado decimal . y sin marcador de millares. <br/>
    * 4.- Los datos time y datetime tienen que tener el formato indicado: time: 21:14:07.851-02:00  dateTime:2012-03-26T21:14:07.851-05:00
    * 5.- Todos los campos reflejados en el Esquema han de existir en el CSV.
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Post("/publicacion/insert")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Publica triples desde Csv",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\PublicacionPoolType",
    *    "name" = ""
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\Publicacion",
    *  statusCodes = {
    *     200 = "Petición recibida correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },

    * )   
    *
    */
	public function postInsertAction(Request $request)
	{
        //calculo la ruta de destino
        $this->getTrazas()->LineaInfo("postInsertAction","Inicio proceso API publicacion");
        $webPath = realpath($this->appPath. '/../web');
        $path_publicacion = $webPath . "/publicacion";
        $path_publicacion_noprocesados = $webPath . "/publicacion/NoProcesados";
        $path_publicacion_error = $webPath . "/publicacion/Error";
        $path_publicacion_procesados = $webPath . "/publicacion/Procesados";

        //creo el nombre de la carpeta donde irá el proceso y almacenará el csv, log y nt
        $carpeta =date("Ymd_His");
        //creo la ruta de carpeta destino 
        $directorio =  sprintf("%s/%s/",$path_publicacion_noprocesados,$carpeta,false); 
        $this->getTrazas()->LineaInfo("postInsertAction","Creo un objeto entidad");
        //creo un objeto entidad
        $publica = new Publicacion();
        //creo el formulario de validación
        $this->getTrazas()->LineaInfo("postInsertAction","Creo el formulario de validación");
        $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\PublicacionPoolType', $publica);
        //Gestiono el request
        $form->handleRequest($request);
        $fileSystem = new Filesystem();
        //compruebo la carpeta publicacion
        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo la carpeta publicacion");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion);
        //compruebo la carpeta publicacion/NoProcesados
        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo la carpeta publicacion/NoProcesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_noprocesados);
        //compruebo la carpeta publicacion/Error
        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo la carpeta publicacion/Error");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_error);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo la carpeta publicacion/Procesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_procesados);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postInsertAction", "Compruebo la carpeta publicacion/NoProcesados/" . $carpeta);
        $this->ComprueboCarpeta($fileSystem,$directorio);

         //si la entidad mandada es validada por el formulario
	    if ($form->isValid()) {
            $errorFormulario ="";
            //compruebo el id isonomia
            $this->getTrazas()->LineaInfo("postInsertAction","Compruebo que existe la isonomia");
            $comprubaISOCSV = new Isonomia($publica->getIdesquema(), $this->trazas->getLogger(), $this->appPath, $this->trazas->getEscribeTrazasDebug()); 

            if (empty($publica->getIdesquema())) {
                $errorFormulario = $errorFormulario . " El id de isonomía es requerido";
                $this->getTrazas()->LineaError("postInsertAction","El id de isonomía es requerido"); 
                 
            } else if (!$comprubaISOCSV->ExiteIsonomia()) {
                $errorFormulario = $errorFormulario . "No existe la isonomia: " . $publica->getIdesquema();
                $this->getTrazas()->LineaError("postInsertAction","No existe la isonomia: " . $publica->getIdesquema()); 
            }   
            //compruebo el Csv
            if (empty($errorFormulario)) {
                $this->getTrazas()->LineaInfo("postInsertAction","Si existe la isonomia: " . $publica->getIdesquema()); 
                //Primero si viene desde archivo
                if (count($request->files)>0) {
                    //recojo el archivo
                    $file = $request->files->get('csv');
                    $this->getTrazas()->LineaInfo("postInsertAction","Recojo el archivo Csv");    
                    if (!isset($file))
                    {
                         $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                         $this->getTrazas()->LineaError("postInsertAction","No se ha informado el archivo Csv."); 
                    }  else if ($_FILES['csv']['error'] > 0) {
                        $errorArchivo = $this->DameErrorUpload($_FILES['csv']['error']);
                        $errorFormulario = $errorFormulario .$errorArchivo ;
                        $this->getTrazas()->LineaError("postInsertAction",$errorFormulario );     
                    }
                    else 
                    {
                        $original_filename =  $file->getClientOriginalName();
                        $ext = pathinfo($original_filename, PATHINFO_EXTENSION);
                        if ($ext!='csv') {
                            $errorFormulario = $errorFormulario ." El Archivo no es Csv.";
                            $this->getTrazas()->LineaError("postInsertAction","El Archivo no es Csv."); 
                        }
                        if (empty($errorFormulario)) {
                            $headCSV = $this->DameEncabezdosCSV($file); 
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos";
                            } else {
                                $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                            }
                        }
                        if (empty($errorFormulario)) {
                            //Muevo el archivo csv a la carpeta del proceso
                            $this->getTrazas()->LineaInfo("postInsertAction","Muevo el archivo csv a la carpeta:" . $directorio); 
                            $file->move($directorio,'datos.csv');
                            chmod($directorio . "datos.csv", 0744); 
                        }
                    }
                }
                else 
                {
                    //Segundo si viene desde texto 
                    //recojo el texto si lo ha enviado via textArea
                    $fileTxt =  $publica->getCsv();
                    //valido que el csv stá bien formado separado por  ;
                    $this->getTrazas()->LineaInfo("postInsertAction","Validación del texto introducido como Csv");     
                    if (!empty($fileTxt)) 
                    {   
                        //Muevo el archivo csv a la carpeta del proceso     
                        $this->getTrazas()->LineaInfo("postInsertAction","Creo el archivo csv a la carpeta:" . $directorio); 
                        $fileSystem->dumpFile($directorio. 'datos.csv', $fileTxt);
                        chmod($directorio . "datos.csv", 0744); 
                        $file = $directorio . "datos.csv";

                        $this->getTrazas()->LineaInfo("postInsertAction","Compruebo Csv bien formado por ;");  
                        $errorFormulario = $errorFormulario . $this->ComprueboCsvBienFormado($file); 

                        if (empty($errorFormulario)) {
                            $this->getTrazas()->LineaInfo("postInsertAction","Archivo Csv bien formado por el texto");  
                            //compruebo que el Csv y la Isonomia se corresponden
                            
                            $headCSV = $this->DameEncabezdosCSV($file);
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos.";
                            } else {
                                $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                            }          
                        }
                    } else {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                    } 
                }
            }
    
            if (empty($errorFormulario)) {
                $urlweb = $this->container->getParameter('api_publicacion')['server_worker'];  
              /*  if ($_SERVER['SERVER_PORT']!="80"){
                    $urlweb =  sprintf("%s://localhost:%s", $_SERVER['REQUEST_SCHEME'], $_SERVER['SERVER_PORT']);
                } else {
                    $urlweb =  sprintf("%s://localhost",$_SERVER['REQUEST_SCHEME']);
                }*/
                
                $this->getTrazas()->LineaInfo("postInsertAction","La entidad mandada es validada por el formulario");                
                //lanzo el timespan de seguridad
                $nowtime = time();
                $isonomiaNombre = base64_encode($publica->getIdesquema()); 
                //$param = sprintf("%s_%s%s",$isonomiaNombre,str_replace("_","",$carpeta),$nowtime);
                $valorDcType = base64_encode("false");
                $actualizarItems = "false";

                $param = sprintf("%s_%s%s_%s_%s",$isonomiaNombre,str_replace("_","",$carpeta),$nowtime, $valorDcType, $actualizarItems);
                $procesCMD = sprintf("curl %s/worker/%s",$urlweb, $param);        
                $this->getTrazas()->LineaInfo("execute", "Lanzo comando: ". $procesCMD);
                exec($procesCMD . " > /dev/null 2>&1 &"); 

                $this->getTrazas()->LineaInfo("postInsertAction","Fin proceso rest");  
                return array("publicacion" =>  "Carga Csv registrada con éxito");

            } else {       
                if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                  $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
                }
                if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                  $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
                }
				rename($path_publicacion_noprocesados ,$path_publicacion_error);
                $ex = new BadRequestHttpException($errorFormulario);
                $this->getTrazas()->LineaInfo("postInsertAction","Fin proceso rest");
                return array('Publicacion' => "Proceso con errores",);
                throw $ex;

            }
        } else {
            if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
              }
              if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
            }
            rename($path_publicacion_noprocesados,$path_publicacion_error);
            $ex = new BadRequestHttpException("Sin Parámetros",null ,400);
            $this->getTrazas()->LineaInfo("postInsertAction","Fin proceso rest");
            throw $ex;
        }
        $this->getTrazas()->LineaInfo("postInsertAction","Fin proceso rest");
	    return array(
            //devuelvo el error
		    'form' => $form,
        );
    }


	/**
    * Servicio de actualizar de triples en servidor Virtuoso, desde: archivo, o contenido Csv separado por ';' y identificador de isonomía. </br>
	* Este servicio actualiza solo los triples que modifica los datos obtenidos del csv de actualización </br>
    * El servicio es asíncrono,es decir: registra la entrada y lanza la tarea de carga de las triples en un subproceso. </br>
    * El mensaje de confirmación del servicio, es inmediato y solo indica la recepción de la solicitud. El proceso de carga triples tarda mas tiempo. </br>
    * Al termino del subproceso se envía un email, informando al administrador de lo ocurrido.  <br>
    * <h4>Notas a la carga de datos:</h4></br>
    * 0.- El CSV ha de estar limitado por ";". </br>
    * 1.- Si se crea el CSV con excel Todos los campos en el CSV ha de ser de formato texto. </br>
	* 2.- El CSV tiene que contener un campo "URI", en la primera posición, donde se le especifique la uir de los elementos que se quiera modificar. 
    * 3.- Los capos con tipo booleano y el atributo ‘condition’ han de ser valores [1/0] y [true/false] (con minúsculas) <font color="red">Cuidado con Excel que pone valores booleanos  "VERDADERO/FALSO" y "TRUE/FALSE" y darían error.</font></br>
    * 4.- Los datos float y decimal deben de estar con separado decimal . y sin marcador de millares. <br/>
    * 5.- Los datos time y datetime tienen que tener el formato indicado: time: 21:14:07.851-02:00  dateTime:2012-03-26T21:14:07.851-05:00 </br>
    * 6.- Todos los campos reflejados en el Esquema han de existir en el CSV.
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Post("/publicacion/update/Entities")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Actualiza parte de los triples desde Csv",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\UpdateItemsPoolType",
    *    "name" = ""
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\UpdateItems",
    *  statusCodes = {
    *     200 = "Petición recibida correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },

    * )   
    *
    */
	public function postEntitiesAction(Request $request)
	{
      
        $this->getTrazas()->LineaInfo("postEntitiesAction","Inicio proceso API publicacion");
        //calculo la ruta de destino
        $webPath = realpath($this->appPath . '/../web');
        $path_publicacion = $webPath . "/publicacion";
        $path_publicacion_noprocesados = $webPath . "/publicacion/NoProcesados";
        $path_publicacion_error = $webPath . "/publicacion/Error";
        $path_publicacion_procesados = $webPath . "/publicacion/Procesados";

        //creo el nombre de la carpeta donde irá el proceso y almacenará el csv, log y nt
        $carpeta =date("Ymd_His");
        //creo la ruta de carpeta destino 
        $directorio =  sprintf("%s/%s/",$path_publicacion_noprocesados,$carpeta,false);
        $this->getTrazas()->LineaInfo("postEntitiesAction","Inicio proceso API publicacion");
        $this->getTrazas()->LineaInfo("postEntitiesAction","Creo un objeto entidad");
        //creo un objeto entidad
        $update = new UpdateItems();
        //creo el formulario de validación
        $this->getTrazas()->LineaInfo("postEntitiesAction","Creo el formulario de validación");
        $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\UpdateItemsPoolType', $update);
        //Gestiono el request
        $form->handleRequest($request);
        $fileSystem = new Filesystem();
			
		 //compruebo la carpeta publicacion
        $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo la carpeta publicacion");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion);
        //compruebo la carpeta publicacion/NoProcesados
        $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo la carpeta publicacion/NoProcesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_noprocesados);
        //compruebo la carpeta publicacion/Error
        $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo la carpeta publicacion/Error");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_error);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo la carpeta publicacion/Procesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_procesados);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postEntitiesAction", "Compruebo la carpeta publicacion/NoProcesados/" . $carpeta);
        $this->ComprueboCarpeta($fileSystem,$directorio);
		
         //si la entidad mandada es validada por el formulario
	    if ($form->isValid()) {
            $errorFormulario ="";
            $comprubaISOCSV = new Isonomia($update->getIdesquema(), $this->trazas->getLogger(), $this->appPath, $this->trazas->getEscribeTrazasDebug());
          
            //compruebo el id isonomia
            $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo que existe la isonomia");
            if (empty($update->getIdesquema())) {
                $errorFormulario = $errorFormulario . " El id de isonomía es requerido";
                $this->getTrazas()->LineaError("postEntitiesAction","El id de isonomía es requerido"); 
            } else if (!$comprubaISOCSV->ExiteIsonomia()) {
                $errorFormulario = $errorFormulario . "No existe la isonomia: " . $update->getIdesquema();
                $this->getTrazas()->LineaError( "postEntitiesAction","No existe la isonomia: " . $update->getIdesquema()); 
            }
            //Compruebo el csv	
            if (empty($errorFormulario)) {
                $this->getTrazas()->LineaInfo("postEntitiesAction","Si existe la isonomia: " . $update->getIdesquema()); 
                //Primero si viene desde archivo
                if (count($request->files)>0) {
                    //recojo el archivo
                    $file = $request->files->get('csv');
                    $this->getTrazas()->LineaInfo("postEntitiesAction","Recojo el archivo Csv");    
                    if (!isset($file))
                    {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                        $this->getTrazas()->LineaError("postEntitiesAction","No se ha informado el archivo Csv."); 
                    }  else if ($_FILES['csv']['error'] > 0) {
                        $errorArchivo = $this->DameErrorUpload($_FILES['csv']['error']);
                        $errorFormulario = $errorFormulario .$errorArchivo ;
                        $this->getTrazas()->LineaError("postEntitiesAction",$errorFormulario );     
                    }
                    else 
                    {
                        $original_filename =  $file->getClientOriginalName();
                        $ext = pathinfo($original_filename, PATHINFO_EXTENSION);
                        if ($ext!='csv') {
                            $errorFormulario = $errorFormulario ." El Archivo no es Csv.";
                            $this->getTrazas()->LineaError("postEntitiesAction","El Archivo no es Csv."); 
                        }
                        if (empty($errorFormulario)) {
                            $headCSV = $this->DameEncabezdosCSV($file); 
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos";
                            } else {
                                $this->getTrazas()->LineaInfo("postEntitiesAction","Compurebo si el campo URI esta en la primera posición");
                                if ($headCSV[0] == 'URI') {
                                    $this->getTrazas()->LineaInfo("postEntitiesAction","El campo URI se encuentra en la primera posición");
                                    if (in_array('URI', $headCSV)) {
                                        $this->getTrazas()->LineaInfo("postEntitiesAction","Se encontro el campo URI");
                                        $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                                    }
                                    else {
                                        $this->getTrazas()->LineaError("postEntitiesAction","El Archivo csv no tiene el campo URI");
                                        $errorFormulario = $errorFormulario . " El Archivo csv no tiene el campo URI";
                                    }
                                }
                                else {
                                    $this->getTrazas()->LineaError("postEntitiesAction","El campo URI no esta en la primera posición");
                                    $errorFormulario =  $errorFormulario . " El campo URI no esta en la primera posición";
                                }
                            }
                        }
                        if (empty($errorFormulario)) {
                            //Muevo el archivo csv a la carpeta del proceso
                            $this->getTrazas()->LineaInfo("postEntitiesAction","Muevo el archivo csv a la carpeta:" . $directorio); 
                            $file->move($directorio,'datos.csv');
                            chmod($directorio . "datos.csv", 0744); 
                        }
                    }
                }
                else 
                {
                    //Segundo si viene desde texto 
                    //recojo el texto si lo ha enviado via textArea
                    $fileTxt =  $update->getCsv();
                    //valido que el csv stá bien formado separado por  ;
                    $this->getTrazas()->LineaInfo("postEntitiesAction","Validación del texto introducido como Csv");     
                    if (!empty($fileTxt)) 
                    {   
                        //Muevo el archivo csv a la carpeta del proceso     
                        $this->getTrazas()->LineaInfo("postEntitiesAction","Creo el archivo csv a la carpeta:" . $directorio); 
                        $fileSystem->dumpFile($directorio. 'datos.csv', $fileTxt);
                        chmod($directorio . "datos.csv", 0744); 
                        $file = $directorio . "datos.csv";
    
                        $this->getTrazas()->LineaInfo("postEntitiesAction","Compruebo Csv bien formado por ;");  
                        $errorFormulario = $errorFormulario . $this->ComprueboCsvBienFormado($file); 
    
                        if (empty($errorFormulario)) {
                            $this->getTrazas()->LineaInfo("postEntitiesAction","Archivo Csv bien formado por el texto");  
                            //compruebo que el Csv y la Isonomia se corresponden
                                
                            $headCSV = $this->DameEncabezdosCSV($file);
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos.";
                            } else {
                                $this->getTrazas()->LineaInfo("postEntitiesAction","Compurebo si el campo URI esta en la primera posición");
                                if ($headCSV[0] == 'URI') {
                                    $this->getTrazas()->LineaInfo("postEntitiesAction","El campo URI se encuentra en la primera posición");
                                    if (in_array('URI', $headCSV)) {
                                        $this->getTrazas()->LineaInfo("postEntitiesAction","Se encontro el campo URI");
                                        $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                                    }
                                    else {
                                        $this->getTrazas()->LineaError("postEntitiesAction","El Archivo csv no tiene el campo URI");
                                        $errorFormulario = $errorFormulario . " El Archivo csv no tiene el campo URI";
                                    }
                                }
                                else {
                                    $this->getTrazas()->LineaError("postEntitiesAction","El campo URI no esta en la primera posición");
                                    $errorFormulario =  $errorFormulario . " El campo URI no esta en la primera posición";
                                }
                            }      
                        }
                    } else {
                        $this->getTrazas()->LineaError("postEntitiesAction","No se ha informado el archivo Csv.");
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                    } 
                }
            }
            if (empty($errorFormulario)) {		
                 $urlweb = $this->container->getParameter('api_publicacion')['server_worker'];  
           
                 $this->getTrazas()->LineaInfo("postEntitiesAction","La entidad mandada es validada por el formulario");                
                  //lanzo el timespan de seguridad
                 $nowtime = time();
                 $isonomiaNombre = base64_encode($update->getIdesquema()); 
                 //$param = sprintf("%s_%s%s",$isonomiaNombre,str_replace("_","",$carpeta),$nowtime);
                 $valorDcType = base64_encode("false");
                 $actualizarItems = "true";
   
                 $param = sprintf("%s_%s%s_%s_%s",$isonomiaNombre,str_replace("_","",$carpeta),$nowtime, $valorDcType, $actualizarItems);
                 $procesCMD = sprintf("curl %s/worker/%s",$urlweb, $param);        
                 $this->getTrazas()->LineaInfo("execute", "Lanzo comando: ". $procesCMD);
                 exec($procesCMD . " > /dev/null 2>&1 &"); 
  
                 $this->getTrazas()->LineaInfo("postEntitiesAction","Fin proceso rest");  
                 return array("publicacion" =>  "Carga Csv registrada con éxito");
             } else {       
                 if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                    $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
                 }
                 if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                    $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
                 }
                 rename($path_publicacion_noprocesados ,$path_publicacion_error);
                 $ex = new BadRequestHttpException($errorFormulario);
                 $this->getTrazas()->LineaInfo("postEntitiesAction","Fin proceso rest");
                 return array('Publicacion' => "Proceso con errores",);
                 throw $ex;
            }
        
        } else {
            if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
              }
              if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
            }
            rename($path_publicacion_noprocesados,$path_publicacion_error);
            $ex = new BadRequestHttpException("Sin Parámetros",null ,400);
            $this->getTrazas()->LineaInfo("postEntitiesAction","Fin proceso rest");
            throw $ex;
        }
        $this->getTrazas()->LineaInfo("postEntitiesAction","Fin proceso rest");
	    return array(
            //devuelvo el error
		    'form' => $form,
        );
    }
    
    /** 
    * Servicio de lectura de los dc:types existentes en el servidor. Devuelve todos los dctype exitentes en servidor.
    * El servicio es síncrono     * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/publicacion/update/viewdctype")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Devuelve todos los dctype exitentes en servidor. Util para utilizar el servicio /publicacion/update/view donde se solicita dicho valor",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    */
	public function getViewDcTypeAction(Request $request)
	{
        $solucion = array();
        $errorFormulario = "";
        $this->getTrazas()->LineaDebug("getListadoDcTypeAction","llamada a Función");
        $from = $this->container->getParameter('api_publicacion')['isql_db'];
        $url = $this->container->getParameter('api_publicacion')['isql_host'];

        $query ="select distinct ?dctype from <$from>  where {?s dc:type ?dctype .} order by ?dctype ";
        $dctypypes = $this->LanzaConsultaRespuesta($url,$query); 
        $dctypypes = $dctypypes->{"results"};		
        //Genero los triples
        $elementos = $dctypypes->{"result"}->count();
        for ($i = 0; $i < $elementos; $i ++) {
            $result = $dctypypes->result[$i];
            for ($x = 0; $x < $result->{"binding"}->count(); $x++) {
                $blindig = $result->binding [$x];
                $dctype = $blindig->{'uri'}->__toString(); 
                $dctype  = str_replace("http://opendata.aragon.es/def/ei2a#","iea2:",$dctype);
                $solucion[] = $dctype;
            }
        }
        if (count($dctypypes)==0) {
            $errorFormulario = $errorFormulario . " No existe ninguna configuración" ;
            $this->getTrazas()->LineaInfo("getListadoDcTypeAction","No existe ninguna configuración");
        }
        if (empty($errorFormulario)) {
            $this->getTrazas()->LineaError("getListadoDcTypeAction","Fin proceso rest");  
            return $solucion;   
        } else {
            $ex = new BadRequestHttpException($errorFormulario);
            $this->getTrazas()->LineaError("getListadoDcTypeAction","Fin proceso rest");  
            throw $ex;
        }   
    }


	/**
    * Servicio de actualizar de triples en servidor Virtuoso, desde: archivo, o contenido Csv separado por ';' y identificador de isonomía. </br>
	* Este servicio modifica todos los triples de la vista indicada con la ayuda del dc:type de la vista. </br>
    * El servicio es asíncrono,es decir: registra la entrada y lanza la tarea de carga de las triples en un subproceso. </br>
    * El mensaje de confirmación del servicio, es inmediato y solo indica la recepción de la solicitud. El proceso de carga triples tarda mas tiempo. </br>
    * Al termino del subproceso se envía un email, informando al administrador de lo ocurrido.  <br>
    * <h4>Notas a la carga de datos:</h4></br>
    * 0.- El CSV ha de estar limitado por ";". </br>
    * 1.- Si se crea el CSV con excel Todos los campos en el CSV ha de ser de formato texto. </br>
    * 2.- Los capos con tipo booleano y el atributo ‘condition’ han de ser valores [1/0] y [true/false] (con minúsculas) <font color="red">Cuidado con Excel que pone valores booleanos  "VERDADERO/FALSO" y "TRUE/FALSE" y darían error.</font></br>
    * 3.- Los datos float y decimal deben de estar con separado decimal . y sin marcador de millares. <br/>
    * 4.- Los datos time y datetime tienen que tener el formato indicado: time: 21:14:07.851-02:00  dateTime:2012-03-26T21:14:07.851-05:00 </br>
    * 5.- Todos los campos reflejados en el Esquema han de existir en el CSV.
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Post("/publicacion/update/view")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=false,
    *  description="Actualiza de los triples desde Csv",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\UpdatePoolType",
    *    "name" = ""
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\Update",
    *  statusCodes = {
    *     200 = "Petición recibida correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },

    * )   
    *
    */
    public function postViewAction(Request $request)
	{
        $this->getTrazas()->LineaInfo("postInsertAction","Inicio proceso API publicacion");
        //calculo la ruta de destino

        $webPath = realpath($this->appPath . '/../web');
        $path_publicacion = $webPath . "/publicacion";
        $path_publicacion_noprocesados = $webPath . "/publicacion/NoProcesados";
        $path_publicacion_error = $webPath . "/publicacion/Error";
        $path_publicacion_procesados = $webPath . "/publicacion/Procesados";

        //creo el nombre de la carpeta donde irá el proceso y almacenará el csv, log y nt
        $carpeta =date("Ymd_His");
        //creo la ruta de carpeta destino 
        $directorio =  sprintf("%s/%s/",$path_publicacion_noprocesados,$carpeta,false);
        $this->getTrazas()->LineaInfo("postViewAction","Inicio proceso API publicacion");
        $this->getTrazas()->LineaInfo("postViewAction","Creo un objeto entidad");
        //creo un objeto entidad
        $update = new Update();
        //creo el formulario de validación
        $this->getTrazas()->LineaInfo("postViewAction","Creo el formulario de validación");
        $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\UpdatePoolType', $update);
        //Gestiono el request
        $form->handleRequest($request);
        $fileSystem = new Filesystem();
			
		 //compruebo la carpeta publicacion
        $this->getTrazas()->LineaInfo("postViewAction","Compruebo la carpeta publicacion");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion);
        //compruebo la carpeta publicacion/NoProcesados
        $this->getTrazas()->LineaInfo("postViewAction","Compruebo la carpeta publicacion/NoProcesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_noprocesados);
        //compruebo la carpeta publicacion/Error
        $this->getTrazas()->LineaInfo("postViewAction","Compruebo la carpeta publicacion/Error");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_error);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postViewAction","Compruebo la carpeta publicacion/Procesados");
        $this->ComprueboCarpeta($fileSystem,$path_publicacion_procesados);
        //compruebo la carpeta publicacion/Procesados
        $this->getTrazas()->LineaInfo("postViewAction", "Compruebo la carpeta publicacion/NoProcesados/" . $carpeta);
        $this->ComprueboCarpeta($fileSystem,$directorio);
		
         //si la entidad mandada es validada por el formulario
	    if ($form->isValid()) {
            $errorFormulario ="";
			
            $comprubaISOCSV = new Isonomia($update->getIdesquema(), $this->trazas->getLogger(), $this->appPath, $this->trazas->getEscribeTrazasDebug());
            if (empty($update->getIdesquema())) {
                $errorFormulario = $errorFormulario . " El id de isonomía es requerido";
                $this->getTrazas()->LineaError("postViewAction","El id de isonomía es requerido"); 
                 
            } else if (!$comprubaISOCSV->ExiteIsonomia()) {
                $errorFormulario = $errorFormulario . "No existe la isonomia: " . $update->getIdesquema();
                $this->getTrazas()->LineaError("postViewAction","No existe la isonomia: " . $update->getIdesquema()); 
            }   

            //compruebo el Csv
            if (empty($errorFormulario)) {
                $this->getTrazas()->LineaInfo("postViewAction","Si existe la isonomia: " . $update->getIdesquema()); 
                //Primero si viene desde archivo
                if (count($request->files)>0) {
                    //recojo el archivo
                    $file = $request->files->get('csv');
                    $this->getTrazas()->LineaInfo("postViewAction","Recojo el archivo Csv");    
                    if (!isset($file))
                    {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                        $this->getTrazas()->LineaError("postViewAction","No se ha informado el archivo Csv."); 
                    }  else if ($_FILES['csv']['error'] > 0) {
                        $errorArchivo = $this->DameErrorUpload($_FILES['csv']['error']);
                        $errorFormulario = $errorFormulario .$errorArchivo ;
                        $this->getTrazas()->LineaError("postViewAction",$errorFormulario );     
                    }
                    else 
                    {
                        $original_filename =  $file->getClientOriginalName();
                        $ext = pathinfo($original_filename, PATHINFO_EXTENSION);
                        if ($ext!='csv') {
                            $errorFormulario = $errorFormulario ." El Archivo no es Csv.";
                            $this->getTrazas()->LineaError("postViewAction","El Archivo no es Csv."); 
                        }
                        if (empty($errorFormulario)) {
                            $headCSV = $this->DameEncabezdosCSV($file); 
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos";
                            } else {
                                $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                            }
                        }
                        if (empty($errorFormulario)) {
                            //Muevo el archivo csv a la carpeta del proceso
                            $this->getTrazas()->LineaInfo("postViewAction","Muevo el archivo csv a la carpeta:" . $directorio); 
                            $file->move($directorio,'datos.csv');
                            chmod($directorio . "datos.csv", 0744); 
                        }
                    }
                }
                else 
                {
                    //Segundo si viene desde texto 
                    //recojo el texto si lo ha enviado via textArea
                    $fileTxt =  $update->getCsv();
                    //valido que el csv stá bien formado separado por  ;
                    $this->getTrazas()->LineaInfo("postViewAction","Validación del texto introducido como Csv");     
                    if (!empty($fileTxt)) 
                    {   
                        //Muevo el archivo csv a la carpeta del proceso     
                        $this->getTrazas()->LineaInfo("postViewAction","Creo el archivo csv a la carpeta:" . $directorio); 
                        $fileSystem->dumpFile($directorio. 'datos.csv', $fileTxt);
                        chmod($directorio . "datos.csv", 0744); 
                        $file = $directorio . "datos.csv";

                        $this->getTrazas()->LineaInfo("postViewAction","Compruebo Csv bien formado por ;");  
                        $errorFormulario = $errorFormulario . $this->ComprueboCsvBienFormado($file); 

                        if (empty($errorFormulario)) {
                            $this->getTrazas()->LineaInfo("postViewAction","Archivo Csv bien formado por el texto");  
                            //compruebo que el Csv y la Isonomia se corresponden
                            
                            $headCSV = $this->DameEncabezdosCSV($file);
                            if (count($headCSV)<=1) {
                                $errorFormulario =  $errorFormulario . " El contenido del archivo Csv no es el esperado. Compruebe la separacion por ';' de los campos.";
                            } else {
                                $errorFormulario = $errorFormulario . $this->CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV);
                            }          
                        }
                    } else {
                        $errorFormulario =  $errorFormulario . " No se ha informado el archivo Csv.";
                    } 
                }
            }
            if (empty($errorFormulario)) {   
                if (empty($update->getDcType())) {
                    $errorFormulario = $errorFormulario . " El dcType es requerido";
                    $this->getTrazas()->LineaError("postViewAction","El dcType es requerido");                  
                } else {	
                    $dcType = $update->getDcType ();			
                    $correcto = $comprubaISOCSV->ComprobarDcType($dcType);
                    $this->getTrazas()->LineaInfo("postViewAction","Compurebo si el dcType es correcto con la isonomia");
                    
                    if (!$correcto) {
                         $errorFormulario = $errorFormulario . " El dcType no coincide con la isonomia";
                         $this->getTrazas()->LineaError("postViewAction","El dcType, $dcType, no coincide con la isonomia");
                    }
                    else {
                        $this->getTrazas()->LineaInfo("postViewAction","El dcType, $dcType, coincide con la isonomia");
                    }
                }
            }  
            if (empty($errorFormulario)) {
             
                if (strpos($dcType, "ei2a:")<0) {
                    $this->getTrazas()->LineaError("postViewAction","El prefijo no es 'ei2a'");
					$errorFormulario = $errorFormulario . "El prefijo del dcType no es 'ei2a'";
                } else {
                    $dcType = str_replace("ei2a:","http://opendata.aragon.es/def/ei2a#", $dcType);
                }
            }
           
            if (empty($errorFormulario)) {
                $this->getTrazas()->LineaInfo("postViewAction","La entidad mandada es validada por el formulario");   
                
                //Preparo la cadena para lanzar el proceso asíncrono llamando al worker por curl a localhost
                $urlweb = $this->container->getParameter('api_publicacion')['server_worker'];  
        
                //lanzo el timespan de seguridad
                $nowtime = time();
                $isonomiaNombre = base64_encode($update->getIdesquema());
                $dcType = base64_encode($dcType);
                $actualizarItems = "false";
                $param = sprintf("%s_%s%s_%s_%s",$isonomiaNombre,str_replace("_","",$carpeta),$nowtime, $dcType, $actualizarItems);
                $procesCMD = sprintf("curl %s/worker/%s",$urlweb, $param);        
                $this->getTrazas()->LineaInfo("execute", "Lanzo comando: ". $procesCMD);
                exec($procesCMD . " > /dev/null 2>&1 &"); 
    
                $this->getTrazas()->LineaInfo("postViewAction","Fin proceso rest");  
                return array("actualización" =>  "Carga Csv con actulización por dc:type registrada con éxito");
            } else {       
                if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                    $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
                }
                if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                    $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
                }
                rename($path_publicacion_noprocesados ,$path_publicacion_error);
                $ex = new BadRequestHttpException($errorFormulario);
                $this->getTrazas()->LineaInfo("postViewAction","Fin proceso rest");
                throw $ex;
                return array('Actualización' => "Proceso con errores",);
            } 
        } else {
            if (strpos($path_publicacion_noprocesados, $carpeta)===FALSE) {
                $path_publicacion_noprocesados = $path_publicacion_noprocesados . "/" . $carpeta;
              }
              if (strpos($path_publicacion_error, $carpeta)===FALSE) {
                $path_publicacion_error = $path_publicacion_error . "/" . $carpeta;
            }
            rename($path_publicacion_noprocesados,$path_publicacion_error);
            $ex = new BadRequestHttpException("Sin Parámetros",null ,400);
            $this->getTrazas()->LineaInfo("postInsertAction","Fin proceso rest");
            throw $ex;           
        }
	    return array(
            //devuelvo el error
		    'form' => $form,
        );
    }


    /**
     * Función que comprueba que el Csv introducido por texto esté bien formado separado por ;
     * La función recibe una ruta de archivo para poder utilizar fgetcsv
     * fgetcsv nos asegura que los valores del Csv estén limitados entre comillas o no indistintamente
     * Si no es valido devuelve el error enn formato texto
     */
    private function ComprueboCsvBienFormado($file) 
    {
        $errorFormulario = "";
        if (file_exists($file)) { 
            try{
                $data = array();
                //abro el archivo
                if (($gestor = fopen($file, "r")) !== FALSE) {
                    $this->getTrazas()->LineaInfo("ComprueboCsvBienFormado","Compruebo fichero CSV bien formado"); 
                     //recojo el header
                    $header = fgetcsv($gestor, 0, ";"); 
                    $line_count = -1; // so loop limit is ignored
                     //recorro todas la filas y creo un array clave => valor (encabezado => valor)
                    while (($row = fgetcsv($gestor, 0, ";")) !== FALSE)
                    {
                        foreach ($header as $i => $heading_i)
                        {
                            $row_new[$heading_i] = $row[$i];
                        }
                        $data[] = $row_new;
                    }
                    fclose($gestor);
                    //si no hay regitros al margen del encabezado (primera linea es que no hay registros)
                    if (count($data)==0){
                        $errortxt = "El Csv ha de estar bien formado separado por ';'";
                        $errortxt = $errortxt . " Puede que haya seleccionado 'String' en lugar de 'TextArea' en el tipo de control web";
                        $this->getTrazas()->LineaError("ComprueboCsvBienFormado", $errortxt); 
                        $errorFormulario = $errorFormulario . $errortxt; 
                    }
                    $this->getTrazas()->LineaInfo("ComprueboCsvBienFormado",'Fichero Csv validado y cerrado'); 
                }
            } catch (Exception $e) {
                $this->getTrazas()->LineaError("ComprueboCsvBienFormado",'Excepción capturada: '.  $e->getMessage()); 
                $errorFormulario = 'Excepción capturada: ' .  $e->getMessage();
                $errorFormulario = $errorFormulario .  "El Csv ha de estar bien formado separado por ';'";
            }

        } else {
            $this->getTrazas()->LineaError("ComprueboCsvBienFormado", $file .": Fichero CSV no encontrado"); 
            $errorFormulario = $file .": Fichero CSV no encontrado";
            $errorFormulario = $errorFormulario .  "El Csv ha de estar bien formado separado por ';'";
        }
        return  $errorFormulario;
    }

    /**
     * Función que comprueba que los encabezados del archivo Csv existen en el esquema Isonomico
     * Si no se corresponden devuelve el error enn formato texto
     */
    private function CompruebaCorrespondenciaCsvIsonomia($comprubaISOCSV, $headCSV)
    {
        $errorFormulario = "";
        $comprubaISOCSV->setHeadCSV($headCSV);
        $this->getTrazas()->LineaInfo("CompruebaCorrespondenciaCsvIsonomia","Compruebo correspondencia Csv isonomia "); 
        if ($comprubaISOCSV->CompruebaEsquema()) {
            $this->getTrazas()->LineaInfo("CompruebaCorrespondenciaCsvIsonomia","Csv e Isonomia se corresponden");  
        } else {
            $errorFormulario = " La isonomia seleccionada, no coincide con el Csv cargado";
            $this->getTrazas()->LineaError("CompruebaCorrespondenciaCsvIsonomia","La isonomia seleccionada, no coincide con el Csv cargado"); 
        }
        return $errorFormulario;
    }

    /**
     * Función que devuelve los encabezados del fichero Csv dado un na ruta
     * Es necesario hacerlo via archivo para poder utilizar la función fgetcsv
     * fgetcsv nos asegura que los valores del Csv estén limitados entre comillas o no indistintamente
     */
    private function DameEncabezdosCSV($file){
        $headCSV  = null;
        if (($gestor = fopen($file, "r")) !== FALSE) {
            $headCSV = fgetcsv($gestor, 0, ";"); 
        }
        fclose($gestor);
        return  $headCSV;
    }

    /**
     * Función que com prueba la existencia de las carpeta y la crea dándole permisos
     */
    private function ComprueboCarpeta($fileSystem, $carpeta)
    {
        if (!file_exists($carpeta)){
            $this->getTrazas()->LineaInfo("ComprueboCarpeta","Creo Carpeta: " . $carpeta); 
            $fileSystem->mkdir($carpeta);
        }
     /*       chmod($carpeta, 0744);
        } else {
            chmod($carpeta, 0744);
        }*/
    }

    /**
    * Función que devuelve el error de sistema al subir un archivo
     */
    private function DameErrorUpload($error){
        $errorSubida ="";
        switch ($error) {
            case 1:
                $errorSubida="El fichero subido excede la directiva upload_max_filesize de php.ini.";
            break;
            case 2:
                $errorSubida="El fichero subido excede la directiva MAX_FILE_SIZE especificada en el formulario HTML.";
            break;
            case 3:
                $errorSubida="El fichero fue sólo parcialmente subido.";
            break;
            case 4:
                $errorSubida="No se subió ningún fichero.";
            break;
            case 5:
                $errorSubida="";$isonomiaNombre = base64_encode($publica->getIdesquema()); 
            break;$isonomiaNombre = base64_encode($publica->getIdesquema()); 
            case 6:$isonomiaNombre = base64_encode($publica->getIdesquema()); 
                $errorSubida="Falta la carpeta temporal. Introducido en$isonomiaNombre = base64_encode($publica->getIdesquema());  PHP 5.0.3.";
            break;$isonomiaNombre = base64_encode($publica->getIdesquema()); 
            case 7:$isonomiaNombre = base64_encode($publica->getIdesquema()); 
                $errorSubida="No se pudo escribir el fichero en el disc$isonomiaNombre = base64_encode($publica->getIdesquema()); o. Introducido en PHP 5.1.0.";
            break;$isonomiaNombre = base64_encode($publica->getIdesquema()); 
            case 8:$isonomiaNombre = base64_encode($publica->getIdesquema()); 
                $errorSubida="Una extensión de PHP detuvo la subida de $isonomiaNombre = base64_encode($publica->getIdesquema()); ficheros. PHP no proporciona una forma de determinar la extensión que causó la parada de la subida de ficheros; el examen de la lista de extensiones cargadas con phpinfo() puede ayudar. Introducido en PHP 5.2.0.";
            break;            
            default:
                # code...
             break;
        }
        return  $errorSubida;
    }

    	/**
	 * Función que lanza la consulta POST sobre VIRTUOSO
	 *  Parámetros:
	 *    url:               url endpoint del servicio web virtuoso (http://localhost:8890/sparql)
	 *    query:             spaql de inserción
	 */
	private function LanzaConsultaRespuesta($url,&$query)
	{
		$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("Inicio: url:%s , query:%s", $url, $query));
	    $resultArray = array();
		$data = array('query' => $query , 
					'timeout' => 0,
					'format' => 'application/sparql-query-results+xml',
					'Content-Type' => 'application/x-www-form-urlencoded');
		// use key 'http' even if you send the request to https://... 
		$options = array(
			    'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded",
				'method'  => 'POST',
				'encoding' => 'UTF8',
				'content' => http_build_query($data)
			)
		);
		$context  = stream_context_create($options);
		$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("SPARQL>>>: %s", $query));
		$result = @file_get_contents($url, false, $context);
		
		//si es error informo del mismo
		if ($result === FALSE) { 
			$this->error400 = "Se a producido un error en la carga:";
			$this->trazas->LineaError("LanzaConsultaRespuesta",trim($this->error400));
			$this->error = true;
		} else {
			//si no es error
			$this->trazas->LineaDebug("LanzaConsultaRespuesta", sprintf("Se ha realizado la consulta correctamente"));
			$resultArray = simplexml_load_string ($result,'SimpleXMLElement', LIBXML_NOCDATA);
		}
		return $resultArray;	
	} 

} 
