<?php // AodPoolWeb/src/ApiRest/AodPoolBundle/Controller/AodPoolController.php

namespace ApiRest\AodPoolBundle\Controller;

use ApiRest\AodPoolBundle\Controller\Virtuoso\Acceso;
use ApiRest\AodPoolBundle\Repository\Topics;
use ApiRest\AodPoolBundle\Repository\Types;


use ApiRest\AodPoolBundle\Entity\Query;
use ApiRest\AodPoolBundle\Form\Type\QueryType;

use ApiRest\AodPoolBundle\Entity\Rdf;
use ApiRest\AodPoolBundle\Form\Type\RdfType;



use ApiRest\AodPoolBundle\Entity\Esquema; 
use ApiRest\AodPoolBundle\Form\Type\EsquemaPoolType;


use FOS\RestBundle\Controller\Annotations\Get; 
use FOS\RestBundle\Controller\Annotations\View; 
use FOS\RestBundle\Controller\Annotations\Post; 
use FOS\RestBundle\Controller\Annotations\Delete; 
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




 
use ApiRest\AodPoolBundle\Controller\Utility\Trazas;


/**
 * Clase que publica los servicios REST
 */
class AodPoolController extends FOSRestController {

    //clase de trazas
    protected $trazas=null;

    public function setTrazas($trazas){
        $this->trazas = $trazas;
    }


    protected $directoryPath;



    public function getTrazas(){
        if (!isset($this->trazas)){
            $appPath = $this->container->getParameter('kernel.root_dir');
            $this->directoryPath = str_replace("app","src/ApiRest/AodPoolBundle/Resources/Files/Logs/",$appPath);
            $trazas = new Trazas($this->directoryPath);
            $trazas->setClase("AodPoolController");
            $this->SetTrazas($trazas);
        }
        return $this->trazas;
    }


    /**
    * Servicio de lectura de los temas del Gobierno de Aragon. Devuelve los Temas existentes.
    * 
    * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/topics")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=true,
    *  description="Devuelve los temas existentes, en el formato  JSON ",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *   },
    * )   
    *
    */
	public function getTopicsAction(Request $request)
	{   
        $this->getTrazas()->LineaInfo("getTopicsAction","llamada a Función");
        $dal = $this->get('Repository_Topics');   
        $topics = $dal->GetFullTopicsRest();         
        /* retornar el arreglo en formato JSON */
        return $topics;   
    }

    /**
    * Servicio de lectura de los tipos de entidades del Gobierno de Aragon. Devuelve los tipos de entidades existentes.
    * 
	* @var Request $request
	* @return View|array
	*
	* @View()
    * @Get("/types")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=true,
    *  description="Devuelve los tipos de entidades existentes, en el formato  JSON ",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *   },
    * )   
    *
    */
	public function getTypesAction(Request $request)
	{   
       
        $this->getTrazas()->LineaInfo("getTypesAction","llamada a Función");
        $dal = $this->get('Repository_Types');   
        $types = $dal->GetFullTypesRest();         
        /* retornar el arreglo en formato JSON */
        return $types;   
    }

    /**
    * Servicio que permite consultar los contenidos del AOD Pool, pasándole los filtros por los
    * que se desean filtrar. El API permitirá traer un número determinado de contenidos,
    * permitiendo paginar los resultados y ordenarlos por un campo. </br>
    * 
	* @var Request $request
	* @return View|array
	*
    * @View()
    * @ParamConverter("query", class="ApiRestAodPoolBundle:Query")
    * @GET("/query")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=true,
    *  description="Servicio que permite consultar los contenidos del AOD Pool.",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\QueryType",
    *  },
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    */
	public function getQueryAction(Request $request)
	{
        $errorFormulario ="";
        //calculo la ruta de destino
        $this->getTrazas()->LineaInfo("getQueryAction","Inicio");
        $this->trazas->LineaInfo("getQueryAction","Creo un objeto entidad");
        $query = new Query();
        $query->setFilters($_GET['filters']); 
        if (!empty($_GET['pageSize'])) {   
           $query->setPage($_GET['page']); 
        } else {
            $query->setPage(0); 
        }
        if (!empty($_GET['pageSize'])) {
            $query->setPageSize($_GET['pageSize']); 
        } else {
            $query->setPageSize(0);
        }
        if (!empty($_GET['orderBy'])) {
           $query->setOrderBy($_GET['orderBy']); 
        }
 
        if (empty($query->getFilters())) {
            $error = " Los filtros son requeridos";
            $this->trazas->LineaError("getQueryAction",trim($error));
            $errorFormulario = $errorFormulario .  $error;
        } 
        if (empty($query->getPage())) {
            $error = " El Nº de página resultados es requerida";
            $this->trazas->LineaError("getQueryAction",trim($error));
            $errorFormulario = $errorFormulario .  $error;
        }
        if (empty($query->getPageSize())) {
            $error = " El tamaño de la página resultados es requerida";
            $this->trazas->LineaError("getQueryAction",trim($error));
            $errorFormulario = $errorFormulario .  $error;
        }

        $param =  $this->container->getParameter('api_consulta');
        $virtuoso = new Acceso(); 
        $virtuoso->Configura($param,$this->directoryPath);    
        $respuesta =  $virtuoso->DameQuery($query->getFilters(),
                                           $query->getPageSize(),
                                           $query->getPage(),
                                           $query->getOrderBy());
        if ($virtuoso->getError()==true) {
            $ex = new BadRequestHttpException($virtuoso->getError400());
            $this->trazas->LineaError("getQueryAction",trim($virtuoso->getError400()));
            $this->trazas->LineaInfo("getQueryAction","Fin proceso rest");
            throw $ex;
            return array('Query' => "Proceso con errores:".  $errorFormulario);
        } else {
            if (isset($respuesta)) {
                $this->trazas->LineaInfo("getQueryAction","Fin proceso rest");
                return $respuesta;
            } else {
                $errorFormulario="Proceso sin repuesta";
            }
        }

        if (empty($errorFormulario)) {       
            $this->trazas->LineaInfo("getQueryAction","Fin proceso rest");
            return array("Query" =>  "resultados");
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->trazas->LineaError("getQueryAction",$errorFormulario);
            $this->trazas->LineaInfo("getQueryAction","Fin proceso rest");
            throw $ex;
            return array('Query' => "Proceso con errores",);
        }

        $this->trazas->LineaInfo("getQueryAction","Fin proceso rest");
	    return array(
            //devuelvo el error
		    'form' => $form,
        );  
    }


    /**
    * Servicio que permite permite obtener el RDF completo de una entidad </br>
    * 
	* @var Request $request
	* @return View|array
	*
    * @View()
    * @ParamConverter("rdf", class="ApiRestAodPoolBundle:Rdf")
    * @GET("/rdf")
    * @throws BadRequestHttpException
    * @return array
    * @param Request $request
    * @ApiDoc(
    *  resource=true,
    *  description="Servicio que permite consultar los contenidos del AOD Pool.",
    *  input= {
    *    "class" = "ApiRest\AodPoolBundle\Form\Type\RdfType",
    *  },
    *  output="ApiRest\AodPoolBundle\Entity\Rdf",
    *  statusCodes = {
    *     200 = "Proceso realizado correctamente",
    *     400 = "Devuelve si error de parámetros introducidos",
    *     500 = "Devuelve error sistema."
    *   },
    * )   
    *
    */
	public function getRdfAction(Request $request)
	{
        $this->getTrazas()->LineaInfo("getRdfAction","Inicio");
        $this->trazas->LineaInfo("getRdfAction","Creo un objeto entidad Rdf");
      /*  $query = new Query();
        $query->setFilters($_GET['filters']);    
        $query->setPage($_GET['page']); 
        $query->setPageSize($_GET['pageSize']); 
        if (!empty($_GET['orderBy'])) {
           $query->setOrderBy($_GET['orderBy']); 
        }*/
       // $this->logger->info($this->DameLineaLog("AodPoolController","getRdfAction","Creo el formulario de validación"));
       // $form = $this->createForm('ApiRest\AodPoolBundle\Form\Type\QueryType', $Rdf);
        //Gestiono el request
        $rdf = new Rdf();
        $rdf->setUri($_GET['uri']);  
        if (empty($rdf->getUri())) {
            $error = " Los filtros son requeridos";
            $this->trazas->LineaError("getQueryAction",trim($error));
            $errorFormulario = $errorFormulario .  $error;
        }
        $param =  $this->container->getParameter('api_consulta');
        $virtuoso = new Acceso(); 
        $virtuoso->Configura($param,$this->directoryPath);  
        $respuesta =  $virtuoso->DameRdf($rdf->getUri());
        if ($virtuoso->getError()==true) {
            $ex = new BadRequestHttpException($virtuoso->getError400());
            $this->trazas->LineaError("getRdfAction",trim($virtuoso->getError400()));
            $this->trazas->LineaInfo("getRdfAction","Fin proceso rest");
            throw $ex;
            return array('Query' => "Proceso con errores",);
        } else {
            if (isset($respuesta)) {
                $this->trazas->LineaInfo("getRdfAction","Fin proceso rest");
                return $respuesta;
            } else {
                $errorFormulario="Proceso sin repuesta";
            }
        }
        if (empty($errorFormulario)) {       
            $this->trazas->LineaInfo("getRdfAction","Fin proceso rest");
            return array("Query" =>  "resultados");
        } else {     
            $ex = new BadRequestHttpException($errorFormulario);
            $this->trazas->LineaError("getRdfAction",trim($errorFormulario));
            $this->trazas->LineaInfo("getRdfAction","Fin proceso rest");
            throw $ex;
            return array('Query' => "Proceso con errores",);
        }
        $this->trazas->LineaInfo("getRdfAction","Fin proceso rest");
	    return array(
            //devuelvo el error
		    'form' => $form,
        );  
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
                $errorSubida="";
            break;
            case 6:
                $errorSubida="Falta la carpeta temporal. Introducido en PHP 5.0.3.";
            break;
            case 7:
                $errorSubida="No se pudo escribir el fichero en el disco. Introducido en PHP 5.1.0.";
            break;
            case 8:
                $errorSubida="Una extensión de PHP detuvo la subida de ficheros. PHP no proporciona una forma de determinar la extensión que causó la parada de la subida de ficheros; el examen de la lista de extensiones cargadas con phpinfo() puede ayudar. Introducido en PHP 5.2.0.";
            break;            
            default:
                # code...
             break;
        }
        return  $errorSubida;
    }
}