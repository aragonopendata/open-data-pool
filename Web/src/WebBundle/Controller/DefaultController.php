<?php

namespace WebBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use WebBundle\Entity\Navegacion;
use WebBundle\Entity\Filtros;

use WebBundle\Controller\Utility\ParseaDetalle;
use WebBundle\Controller\Utility\Trazas;


define("QUERYRESULTADOSRDFTYPEDFTYPE","PREFIX dc:<http://purl.org/dc/elements/1.1/> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> select ?dctype ?rdftype from <%s> where { <%s> rdf:type ?rdftype . <%s> dc:type ?dctype .  }");

class DefaultController extends Controller
{
     //clase de trazas a archivo
     protected $trazas=null;

     //clase de trazas a archivo
     protected $modoTrazasDebug=false;

    //ubicacion del directorio de trazas lo uso en varas acciones distintas
     protected $directoryPath=false;
     
    //configuracion para metrizada del archivo ../AodPoolWeb/app/config/config.yml
     protected $param=false;

       
    //configuracion para metrizada del archivo ../AodPoolWeb/app/config/config.yml
    protected $urlPrefijo="";

    /**
     * Controlador unico y principal de toda la aplicación web 
     */


    public function __construct() {

    }
    
    /**
     * @Route("/")
     */
    public function indexAction()
    {
        $this->IncializoTrazas();
       // $_SESSION['from_url'] = $_SERVER['REQUEST_URI'];
       //redirijo el index al la accion portada
        $this->portadaAction(); 
    }

    /** 
     * Funcion que comtrola la accion de la pagina home
    */
    public function portadaAction(Request $request)
    {
        $this->IncializoTrazas();
        // $_SESSION['from_url'] = $_SERVER['REQUEST_URI'];
        $this->trazas->LineaDebug("portadaAction","Entro función");
        //no tiene para metrizacion 
        return $this->render('default/index.html.twig', 
                             array("classBody" => 'homeBloque'));
        
    }

    /**
     * @Route("/temas");
     */ 
    public function temasAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina principal de temas
        $this->trazas->LineaDebug("temasAction","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los códigos y literales que necesito 
        $navegacion = new Navegacion($this->container);
        //informo el prefijo de los sujetos para gestionar los elementos
        $navegacion->setUrlPrefijo($this->urlPrefijo);
        //me cercioro que la llamada sea tipo get  
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {  
             $navegacion->ParamManeger($_GET);  
        } else {
            //retuen error;
        }
        //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("temasAction",$navegacion->getTraza()); 
        }
         //instancia del objeto Topic a la base de datos donde saco el array de los temas y subtemas
        $this->trazas->LineaDebug("temasAction","Recojo los temas de progress"); 
        $dal = $this->get('Repository_Topics'); 
        $temas = $dal->GetFullTopicsWeb();
        $this->trazas->LineaDebug("temasAction","Lanzo default/temas.html.twig");
        //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/temas.html.twig', array(
            'classBody' => 'homeBloque',
            'navegacion' => $navegacion->getArray(),
            'temas' => $temas,
        ));
    }
  
    /**
     * @Route("/entidades")
     */ 
    public function entidadesAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina principal de entidades 
        $this->trazas->LineaDebug("entidadesAction","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los codigos y literales que necesito 
        $navegacion = new Navegacion($this->container);  
        //informo el prefijo de los sujetos para gestionar los elementos
        $navegacion->setUrlPrefijo($this->urlPrefijo);
        //me cercioro que la llamada sea tipo get 
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {                      
            $navegacion->ParamManeger($_GET);           
        } else {
            //retuen error;
        }
         //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("entidadesAction",$navegacion->getTraza()); 
        }
        $this->trazas->LineaDebug("entidadesAction","Recojo las entidades de progress"); 
       //instancia del objeto Types a la base de datos donde saco el array de las entidades y subentidades
        $dal = $this->get('Repository_Types'); 
        $entidades = $dal->GetFullTypesWeb();

        $this->trazas->LineaDebug("entidadesAction","Lanzo default/entidades.html.twig");
        //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/entidades.html.twig', array(
            'classBody' => 'homeBloque homeEntidades',
            'navegacion' => $navegacion->getArray(),
            'entidades' => $entidades,
        ));
    }

    /**
     * @Route("/lugares")
     */ 
    public function lugaresAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina principal de lugares
        $this->trazas->LineaDebug("lugaresAction","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los codigos y literales que necesito 
        $navegacion = new Navegacion($this->container); 
        //informo el prefijo de los sujetos para gestionar los elementos
        $navegacion->setUrlPrefijo($this->urlPrefijo); 
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
             //me cercioro que la llamada sea tipo get       
            $navegacion->ParamManeger($_GET);           
        } else {
            //retuen error;
        }
        //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("lugaresAction",$navegacion->getTraza()); 
        }  
        $this->trazas->LineaDebug("lugaresAction","Recojo las los lugares de progress"); 
         //instancia del objeto locatios a la base de datos donde saco el array de las localidades
        $dal = $this->get('Repository_Locations'); 
        $lugaresArray = $dal->GetLocations();
        $nav = $navegacion->getArray();

        $this->trazas->LineaDebug("lugaresAction","Recojo las los los temas de progress"); 
        //instancia del objeto Topic a la base de datos donde saco el array de los temas y subtemas 
        $subtemas = array();
        $dal = $this->get('Repository_Topics');
        //si hay tema recojo sus subtemas si no pongo los temas principales nivel1 (selección del tema final de pagina)
        if (!empty($navegacion->getTemaCode())) {         
            $subtemas = $dal->GetSubTopics($navegacion->getTemaCode());
        } else {
            $subtemas = $dal->GetSubTopics(0);
        }
        $this->trazas->LineaDebug("lugaresAction","Recojo las los las entidades de progress"); 
       //instancia del objeto Types a la base de datos donde saco el array de los entidades y subentidades
        $dal = $this->get('Repository_Types'); 
        //si hay entidad recojo sus subtemas si no pongo los temas principales nivel1 (selección del tema final de pagina)
        $subTypes = array();
        if (!empty($navegacion->getEntidadCode())) {
            $subTypes = $dal->GetSubTypes($navegacion->getEntidadCode());
        } else {
            $subTypes = $dal->GetSubTypes(0);
        }
        $this->trazas->LineaDebug("lugaresAction","Lanzo default/lugares.html.twig");
        //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/lugares.html.twig', array(
            'classBody' => 'homeSubbloque',
            'navegacion' => $nav,
            'lugaresArray' => $lugaresArray,
            'subTemas'=> $subtemas,
            'subEntidades' => $subTypes
        ));
    }
    
    public function temasentidadesAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina principal de entidades
        $this->trazas->LineaDebug("temasentidadesAction","Entro función");
       //Controlador de la pagina de temas y entidades (segunda navegacion cuando parte de Localidades)
       //instancia del objeto navegación con el los parámetros get de manera que ya tengo
       //todos los codigos y literales que necesito 
        $navegacion = new Navegacion($this->container); 
        //informo el prefijo de los sujetos para gestionar los elementos
        $navegacion->setUrlPrefijo($this->urlPrefijo);
        //me cercioro que la llamada sea tipo get  
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {      
            $navegacion->ParamManeger($_GET);           
        } else {
            //retuen error;
        }
        //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("temasentidadesAction",$navegacion->getTraza()); 
        }  
        $this->trazas->LineaDebug("temasentidadesAction","Recojo la localidad de la navegación"); 
        //recojo la localidad 
        $localidad = $navegacion->getLocalidad();
        $this->trazas->LineaDebug("lugaresAction","Recojo las los los temas de progress"); 
        //instancia del objeto Topic a la base de datos donde saco el array de los temas y subtemas 
        $dal = $this->get('Repository_Topics');
        //Saco los temas Nivel 0
        $temas = $dal->GetSubTopics(0);
        $this->trazas->LineaDebug("lugaresAction","Recojo las los las entidades de progress"); 
        //instancia del objeto Types a la base de datos donde saco el array de los entidades y subentidades
        $dal = $this->get('Repository_Types'); 
        //Saco las entidades Nivel 0
        $entidades = $dal->GetSubTypes(0);
        $this->trazas->LineaDebug("temasentidadesAction","Lanzo default/temasentidades.html.twig");
         //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/temasentidades.html.twig', array(
            'classBody' => 'homeSubbloque',
            'navegacion' => $navegacion->getArray(),
            'temas'=> $temas,
            'entidades' => $entidades,
            'localidad' => $localidad,
        ));
    }
    
    /**
     * @Route("/filtros")
     */ 
    public function filtrosAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina de Filtros o facetas
        $this->trazas->LineaDebug("filtrosAction","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los codigos y literales que necesito 
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            //me cercioro que la llamada sea tipo get 
            $navegacion = new Navegacion($this->container);
            //informo el prefijo de los sujetos para gestionar los elementos
            $navegacion->setUrlPrefijo($this->urlPrefijo);
            $navegacion->ParamManeger($_GET);
        } else {
            //retuen error;
        }
        //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("filtrosAction",$navegacion->getTraza()); 
        } 
        $this->trazas->LineaDebug("filtrosAction","Recojo el acceso a virtuoso"); 
       //instancia del objeto Acceso a virtuoso para hacer las consultas
        $virtuoso = $this->get('Virtuoso_Acceso'); 
        //Inicializo con los parametros y el directorio relativo raiz actual
        $virtuoso->Configura($this->param, $this->directoryPath);  
        $this->trazas->LineaDebug("filtrosAction","Instancia del objeto Filtros para gestionar lo campos de date, titulo y búsqueda libre"); 
         //instancia del objeto Filtros para gestionar lo campos de date, titulo y búsqueda libre
        $dalResultados = $this->get('Repository_ResultFields');
        $this->trazas->LineaDebug("filtrosAction","Instancia del objeto Facets para gestionar las facetas diseñadas por cada rdftype"); 
        //instancia del objeto Facets para gestionar las facetas diseñadas por cada rdftype
        $dalFacetas = $this->get('Repository_Facets');     
        $this->trazas->LineaDebug("filtrosAction","Instancia del objeto Topics para gestionar los temas pot código descripción"); 
        //instancia del objeto Topics para gestionar los temas pot código descripción
        $daltemas = $this->get('Repository_Topics');
        $this->trazas->LineaDebug("filtrosAction","Instancia del objeto Topics para gestionar las entidades pot código descripción"); 
        //instancia del objeto Topics para gestionar las entidades pot código descripción
        $dalentidades = $this->get('Repository_Types');
       // $dalocalodaes = $this->get('Repository_Locations');
        $this->trazas->LineaDebug("filtrosAction","Instancia del objeto Facetacion para calcular las facetas y resultados"); 
        $facetacion = new Filtros($navegacion,$virtuoso,$dalFacetas,$dalResultados, $daltemas, $dalentidades, $this->directoryPath);
        //recojo el valor del campo busqueda Libre
        $campoBusquedaLibre = $navegacion->getCampoBusquedaLibre();
        //primero proceso las facetas
        $this->trazas->LineaDebug("filtrosAction","Porceso Facetas"); 
        $facetacion->ProcesaFacetas($campoBusquedaLibre);
        //recojo el valor de paginacion de la sentencia get
        $paginacion=$navegacion->getPaginacion();
        //recojo el valor de order de la sentencia get ascencnte o descendente
        $order= $navegacion->getOrder();
        //recojo el valor de order de el capo por el que se ordena (date, title, relevancia, etc..)
        $campoOrder= $navegacion->getCampoOrder();
        //Proceso los resultados con estos parametros
        $this->trazas->LineaDebug("filtrosAction","Porceso Resultados"); 
        $facetacion->ProcesaResultados($paginacion,$order,$campoOrder,$campoBusquedaLibre);
        //recojo el array de valores de los resultados para parsear en Twig
        $resources = $facetacion->getElementosResultado();
         //recojo el array de valores de las facetas para parsear en Twig
        $facetas = $facetacion->getFacetasResultado(); 
        
        //recojo el array de las graficas en base a las facetas
        $gaficas  =  $facetacion->DameGraficas($facetas);

        //recojo el nº total de rsultados
         $nuResultados= $facetacion->getTotalResultados();
        //recojo el valor from type para parsear en Twig 
        $fromType = $navegacion->getfromType();
        //recojo el valor from TItle para parsear en Twig 
        $fromTitle = $navegacion->getfromTitle();
        //recojo el array de valores de los filtros marcados  para parsear en Twig
        $filtrosSpain = $navegacion->getfiltrosSpain();


    
        $this->trazas->LineaDebug("filtrosAction","Lanzo default/filtros.html.twig");
         //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/filtros.html.twig', array(
            'classBody' => 'listadoComunidad facetas-mostrar',
            'fromType' =>  $fromType ,
            'fromTitle' =>  $fromTitle ,
            'numeroResultados' => $nuResultados,
            'filtrosSpain'=> $filtrosSpain,
            'facetasArray' => $facetas,
            'resourcesArray' => $resources,
            'graficasArray' => $gaficas,
            'navegacion' => $navegacion->getArray()
        ));
    }

    public function resultadosAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina de Filtros o facetas
        $this->trazas->LineaDebug("resultadosAction","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los codigos y literales que necesito 
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            //me cercioro que la llamada sea tipo get 
            $navegacion = new Navegacion($this->container);
            //informo el prefijo de los sujetos para gestionar los elementos
            $navegacion->setUrlPrefijo($this->urlPrefijo);
            $navegacion->ParamManeger($_GET);
        } else {
            //retuen error;
        }
        //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
            $this->trazas->LineaDebug("resultadosAction",$navegacion->getTraza()); 
        } 
        $this->trazas->LineaDebug("filtrosAction","Recojo el acceso a virtuoso"); 
       //instancia del objeto Acceso a virtuoso para hacer las consultas
        $virtuoso = $this->get('Virtuoso_Acceso'); 
        //Inicializo con los parametros y el directorio relativo raiz actual
        $virtuoso->Configura($this->param, $this->directoryPath);  
        $this->trazas->LineaDebug("resultadosAction","Instancia del objeto Filtros para gestionar lo campos de date, titulo y búsqueda libre"); 
         //instancia del objeto Filtros para gestionar lo campos de date, titulo y búsqueda libre
        $dalResultados = $this->get('Repository_ResultFields');
        $this->trazas->LineaDebug("resultadosAction","Instancia del objeto Facets para gestionar las facetas diseñadas por cada rdftype"); 
        //instancia del objeto Facets para gestionar las facetas diseñadas por cada rdftype
        $dalFacetas = $this->get('Repository_Facets');     
        $this->trazas->LineaDebug("resultadosAction","Instancia del objeto Topics para gestionar los temas pot código descripción"); 
        //instancia del objeto Topics para gestionar los temas pot código descripción
        $daltemas = $this->get('Repository_Topics');
        $this->trazas->LineaDebug("resultadosAction","Instancia del objeto Topics para gestionar las entidades pot código descripción"); 
        //instancia del objeto Topics para gestionar las entidades pot código descripción
        $dalentidades = $this->get('Repository_Types');
       // $dalocalodaes = $this->get('Repository_Locations');
        $this->trazas->LineaDebug("resultadosAction","Instancia del objeto Facetacion para calcular las facetas y resultados"); 
        $facetacion = new Filtros($navegacion,$virtuoso,$dalFacetas,$dalResultados, $daltemas, $dalentidades, $this->directoryPath);
        //recojo el valor del campo busqueda Libre
        $campoBusquedaLibre = $navegacion->getCampoBusquedaLibre();
        //recojo el valor de paginacion de la sentencia get
        $paginacion=$navegacion->getPaginacion();
        //recojo el valor de order de la sentencia get ascencnte o descendente
        $order=$navegacion->getOrder();
        //recojo el valor de order de el capo por el que se ordena (date, title, relevancia, etc..)
        $campoOrder= $navegacion->getCampoOrder();
        //Proceso los resultados con estos parametros
        $this->trazas->LineaDebug("filtrosAction","Porceso Resultados"); 
        $facetacion->ProcesaResultados($paginacion,$order,$campoOrder,$campoBusquedaLibre);
        //recojo el array de lementos resultados
        $resources = $facetacion->getElementosResultado();
        //recojo el array de valores de las facetas para parsear en Twig
        $facetas = $facetacion->getFacetasResultado(); 
        $gaficas = array();
        if (isset( $facetas)) {
            //recojo el array de las graficas en base a las facetas
            $gaficas  =  $facetacion->DameGraficas($facetas);
        }  
        $this->trazas->LineaDebug("filtrosAction","Lanzo default/resultados.html.twig");
         //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/resultados.html.twig', array(
            'resourcesArray' => $resources,
            'graficasArray' => $gaficas,
        ));
    }
    
    /**
     * @Route("/detalles")
     */ 
    public function detallesAction(Request $request)
    {
        $this->IncializoTrazas();
        //Controlador de la pagina de detalles
         $this->trazas->LineaDebug("","Entro función");
        //instancia del objeto navegación con el los parámetros get de manera que ya tengo
        //todos los codigos y literales que necesito 
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {      
            //me cercioro que la llamada sea tipo get 
            $navegacion = new Navegacion($this->container);
            //informo el prefijo de los sujetos para gestionar los elementos
            $navegacion->setUrlPrefijo($this->urlPrefijo);
            $navegacion->ParamManeger($_GET);
        } else {
            //retuen error;
        }
         //pregunto porque si no es debug no voy a por los datos
        if ($this->modoTrazasDebug) {
             $this->trazas->LineaDebug("detallesAction",$navegacion->getTraza()); 
        } 
        $this->trazas->LineaDebug("detallesAction","Recojo el sujeto de la navegación"); 
        $sujeto =  $navegacion->getUrlSujeto();
        $this->trazas->LineaDebug("detallesAction","Recojo el acceso a virtuoso"); 
        //instancia del objeto Acceso a virtuoso para hacer las consultas
        $virtuoso = $this->get('Virtuoso_Acceso');
        $this->trazas->LineaDebug("detallesAction","Recojo el acceso a virtuoso"); 
        //Inicializo con los parametros y el directorio relativo raiz actual
        $virtuoso->Configura($this->param,  $this->directoryPath);  

        $this->trazas->LineaDebug("detallesAction","Recojo la entidad"); 
        $entidadrdf="";
        $entydaddc="";
        //prefunto por el type y el rdftype
        //tengo el sujeto y voy a virtuoso por el rdftype y dftype
        $from = $virtuoso->getIsqlDb();
        $query = sprintf(QUERYRESULTADOSRDFTYPEDFTYPE,$from,$sujeto, $sujeto);
        $this->trazas->LineaDebug("detallesAction","Pregunto por los resultados a virtuoso"); 
        $types = $virtuoso->DameConsultaWeb($query,"SUJETOS");
        if (count($types)>0){
          $entydaddc=$types[0]['dctype'];
          $entidadrdf=$types[0]['rdftype'];
        }
        //instancia del objeto rdf a la base de datos donde saco la configuracion yamer
        $dalWebConfig = $this->get('Repository_WebConfig');   
        //instancia del objeto Types a la base de datos donde saco el array de los entidades y subentidades
        $dalTypes = $this->get('Repository_Types');  
        $configutacion = array();
        $nameType = "";
        if  (!empty($entydaddc)) {
            $configutacion = $dalWebConfig->GetConfiguracionWebbyName($entydaddc);
            //si existe una configuracion para el dctype
            if (count($configutacion)>0){
                $nameType = $dalTypes->GetNameByDcType($entydaddc); 
            } else {
              $configutacion = $dalWebConfig->GetConfiguracionWebbyName($entidadrdf);
              $nameType = $dalTypes->GetNameByRdfType($entidadrdf); 
            }
        } else {         
            $configutacion = $dalWebConfig->GetConfiguracionWebbyName($entidadrdf);
            $nameType = $dalTypes->GetNameByRdfType($entidadrdf); 
        }
     
        //si tengo entidadrdf
        if  (!empty($nameType) &&  !empty($configutacion)  ) {
            $this->trazas->LineaDebug("detallesAction","Recojo el tema"); 
               
            $bodyclass =  array_values($configutacion)[0]['BodyClass'];
             //instancia del parasea detalle que con el acceso a virtuoso, el sujeto, el directorio raiz relativo y el  yamer
             //crea el array de todos los datos que vamos a parsera en la plantilla 
            $this->trazas->LineaDebug("detallesAction","Recojo el objeto que me da los valores a parsear ensegun: el sujeto, el directorio raiz relativo y el  yamer");
            $pareador = new ParseaDetalle($virtuoso,$sujeto, $this->directoryPath, $configutacion);
            //proceso de creacion de los datos de salida
            $detalle = $pareador->Procesa();
            // $bodyclass = $this->DameBodyClass($pareador->getTypreRdf());             
        }
        $this->trazas->LineaDebug("detallesAction","Lanzo default/detalles.html.twig");
        //devuelvo la pagina haciendo un render del twing con los objetos recogidos 
        return $this->render('default/detalles.html.twig', array(
            'classBody' =>$bodyclass,
            'tipo' => $nameType,
            'detalle'=> $detalle,
        ));
    }

    private function IncializoTrazas(){
        if (empty( $this->directoryPath)) {
            //contruyo el objeto trazas
            $appPath = $this->container->getParameter('kernel.root_dir');
            $this->directoryPath = str_replace("app","src/WebBundle/Resources/Files/", $appPath);	
            $this->trazas = new Trazas($this->directoryPath);
            $this->trazas->setClase("DefaultController");
            $this->trazas->LineaDebug("__construct","Entro función");
            //recojo parametros de la pliacopn
            $this->param =  $this->container->getParameter('api_consulta');
            $this->modoTrazasDebug = $this->param['trazas_debug'];
            $this->urlPrefijo = $this->param['url_prefijo'];
            $this->trazas->LineaDebug("indexAction","Entro función");
        }
    }

    
    /*
    public function subtemasAction(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            $tema ="";
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                if (!empty($_GET['stem'])) {
                    $tema = $_GET['stem'];
                }
            }
            $dal = $this->get('Repository_Topics');   
            $subtemas = $dal->GetSubTopics($tema);
            return $this->render('default/subtemas.html.twig', array(
                'subtemas' => $subtemas,
            ));
        } else{
            return; 
        }
    }

    public function subtemaajaxAction(Request $request)
    {
       // if ($request->isXmlHttpRequest()) {
            $tema ="";
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                if (!empty($_GET['stem'])) {
                    $tema = $_GET['stem'];
                }
            }
            $dal = $this->get('Repository_Topics'); 
            $subtemas = $dal->GetSubTopics($tema);
            return $this->render('default/subtemaajax.html.twig', array(
                'subtemas' => $subtemas,
            ));
      //  } else{
            return array(); 
      //  }
    }

    public function subentidadesAction(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            $entidad ="";
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                if (!empty($_GET['sent'])) {
                    $entidad = $_GET['sent'];
                }
            }
            $dal = $this->get('Repository_Types');  
            $subentidades = $dal->GetSubTypes($entidad);
            return $this->render('default/subentidades.html.twig', array(
                'subentidades' => $subentidades,
            ));
        } else{
            return; 
        }
    }
    */
}
