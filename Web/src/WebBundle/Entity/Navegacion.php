<?php

namespace WebBundle\Entity;

use WebBundle\Entity\Temas;


/**
 * Navegacion
 * Clase de apoyo a la navegacion entre entida, lugar y tema, eu..
 */

define("TEMA","tem");
define("SUBTEMA","stem");
define("PROVINCIA","pro");
define("COMARCA","com");
define("MUNICIPIO","mun");
define("ENTIDAD","ent");
define("SUBENTIDAD","sent");
define("FROMTYPE","from");
define("FILTERS","filt");
define("PAGINACION","pag");
define("ORDEN","ord");
define("CAMPO_ORDEN","ordc");
define("CAMPO_BUSQUEDA_LIBRE","busq");
define("CAMPO_URL","url");

/**
 * Clase que recibe los parametros get de las llamadas http y los almacena y convierte en literales
 */
class Navegacion
{

    /**
     * Codigo del tema
     */
    protected $temaCode;
    /**
     * Sub codigo del tema
     */
    protected $subTemaCode;

    /**
     * Codigo del Municipios
     */
    protected $municipioCode;

    /**
     * Codigo de la Comarca
     */
    protected $comarcaCode;

    /**
     * Codigo de la Provincia
     */
    protected $provinciaCode;

    /**
     * Codigo de la entidad
     */
    protected $entidadCode;

     /**
     * Codigo de la Sun Entidad
     */
    protected $subEntidadCode;

   
    /**
     * Literal del Tema
     */
    protected $temaLiteral;

    /**
     * Literal del subtema
     */
    protected $subTemaLiteral;

    /**
     * Literal del municipio
     */
    protected $municipioLiteral;

    /**
     * Literal de la comarca
     */
    protected $comarcaLiteral;

    /**
     *Literal de la provincia
     */
    protected $provinciaLiteral;

    /**
     * Literal de la entidad
     */
    protected $entidadLiteral;

     /**
     * Literal de la sun entidad
     */
    protected $subEntidadLiteral;

     /**
     * Array de los Temas
     */
    protected $subTemasArray;

    /**
     *Array de los sunbtemas
     */
    protected $SubEntidadesArray;

    /**
     * desde donde provengo (Localidad, Entida o Tema)
     */
    protected $fromType;

    /**
     * filtros para la pantalla de facetación la cedena get
     */
    protected $filters;


    /**
     * filtros para la pantalla de facetación el aray con los filtros
     */
    protected $filtersArray;

   /**
     * paginación para la pantalla de facetación
     */
    protected  $paginacion;

     /**
     * orden  para la pantalla de facetación
     */
    protected $orden;

   /**
     * Campo Por el que ordeno para la lista sde resultados
     */
    protected $campoorden;


   /**
     * Campo dc:type del tema de la entidad
     */
    protected $dctypeentidad; 


   /**
     *  Campo rdf:type de la entidad
     */
    protected $rdfTypeentidad;

 
   /**
     * Campo rdf:type del tema
     */
    protected $rdfTypetema;

     
     /**
     * Campo url sujero para el detalles
     */
    protected $urlSujeto;

    /**
     * Campo busqueda libre
     */
    protected $campoBusquedaLibre;

    //prefijo que llevan todos lo elementos sujeto de virtuoso
    protected $urlPrefijo="";

    protected $context;

    public function __construct($context) {
        $this->context = $context;
    }
    
    /**
     * Es la función principal, le paso el get entero recogido del http response e informo el objeto
     * Por cada parametro pregunto si esta vacío o no y si tiene valor lo pongo en el objeto
     */
    public function ParamManeger($get){
        //$this->formPage = $formpage;

        if (!empty($get[SUBTEMA])) {
            $this->setSubTemaCode($get[SUBTEMA]);
        } else {
            $this->setSubTemaCode("");
        }

        if (!empty($get[TEMA])) {
            $this->setTemaCode($get[TEMA]);
        } else {
            $this->setTemaCode("");
        }

        if (!empty($get[PROVINCIA])) {
            $this->setProvinciaCode($get[PROVINCIA]);
        } else {
            $this->setProvinciaCode("");
        }

        if (!empty($get[COMARCA])) {
            $this->setComarcaCode($get[COMARCA]);
        } else {
            $this->setComarcaCode("");
        }

        if (!empty($get[MUNICIPIO])) {
            $this->setMunicipioCode($get[MUNICIPIO]);
        } else {
            $this->setMunicipioCode("");
        }


        if (!empty($get[SUBENTIDAD])) {
            $this->setSubEntidadCode($get[SUBENTIDAD]);
        } else {
            $this->setSubEntidadCode("");
        }

        if (!empty($get[ENTIDAD])) {
            $this->setEntidadCode($get[ENTIDAD]);
        } else {
            $this->setEntidadCode("");
        }

        if (!empty($get[FROMTYPE])) {
            $this->setFromType($get[FROMTYPE]);
        } else {
            $this->setFromType("");
        }   

        if (!empty($get[FILTERS])) {
            $this->setFilters(urldecode($get[FILTERS]));
        } else {
            $this->setFilters("");
        }   
        if (!empty($get[PAGINACION])) {
            $this->setpaginacion($get[PAGINACION]);
        } else {
            $this->setpaginacion("1");
        }   

        if (!empty($get[ORDEN])) {
            $this->setorden($get[ORDEN]);
        } else {
            $this->setorden("");
        }   
    
        if (!empty($get[CAMPO_ORDEN])) {
            $this->setCampoOrden($get[CAMPO_ORDEN]);
        } else {
            $this->setCampoOrden("");
        }   

        if (!empty($get[CAMPO_BUSQUEDA_LIBRE])) {
            $this->setCampoBusquedaLibre($get[CAMPO_BUSQUEDA_LIBRE]);
        } else {
            $this->setCampoBusquedaLibre("");
        }   
    
        if (!empty($get[CAMPO_URL])) {
            $sujeto =  $this->urlPrefijo . $get[CAMPO_URL];
            $this->setUrlSujeto($sujeto);
        } else {
            $this->setUrlSujeto("");
        } 
    }


    //informo el codigo del tema y relleno su literal y subtemas
	public function setTemaCode($temaCode)
	{
        $this->temaCode = $temaCode;
        if (is_numeric($this->temaCode)) {
           $dal = $this->context->get('Repository_Topics'); 
           $this->temaLiteral = $dal->GetNameTopic($this->temaCode);
           $this->subTemasArray = $dal->GetSubTopics($this->temaCode);
           $this->rdfTypetema =  $dal->GetRdfTopic($this->temaCode);       
        } else {
           $this->temaLiteral ="";
           $this->subTemasArray = array();
           $this->rdfTypetema =  "";
        }
	}
    //Informo el codigo de subtema y relleno el literal y el codigo y literal del tema al que pertenecen
    public function setSubTemaCode($subTemaCode)
	{
        $this->subTemaCode = $subTemaCode;
        if (is_numeric($this->subTemaCode)) {
            $dal = $this->context->get('Repository_Topics'); 
            $this->subTemaLiteral = $dal->GetNameTopic($this->subTemaCode);
            $tema = $dal->GetParentTopic($this->subTemaCode);
            $this->temaCode = $tema->getCode();
            $this->temaLiteral = $tema->getNameES();
            $this->rdfTypetema =  $dal->GetRdfTopic($this->subTemaCode); 
        } else {
            $this->subTemaLiteral="";
            $this->temaCode = "";
            $this->temaLiteral ="";
            $this->rdfTypetema =  "";
        }
	}

  //informo el codigo de la entidad y relleno su literal y lista de subentidades
    public function setEntidadCode($entidadCode)
	{
        $this->entidadCode = $entidadCode;
        if (is_numeric($this->entidadCode)) {   
           $dal = $this->context->get('Repository_Types'); 
           $this->entidadLiteral = $dal->GetNameType($this->entidadCode);  
           $this->SubEntidadesArray = $dal->GetSubTypes($this->entidadCode);  
           $this->dctypeentidad =  $dal->GetDcType($this->entidadCode); 
           $this->rdfTypeentidad =  $dal->GetRdfType($this->entidadCode); 
        } else {
           $this->entidadLiteral="";
           $this->SubEntidadesArray = array();
           $this->dctypeentidad =  ""; 
           $this->rdfTypeentidad =  ""; 
        }
  
    }
    
   //Informo el codigo de la subentidad y rrelleno el literal y el codigo de la entidad a la que pertenecen
    public function setSubEntidadCode($subEntidadCode)
	{
        $this->subEntidadCode = $subEntidadCode;
        if (is_numeric($this->subEntidadCode)) {   
            $dal = $this->context->get('Repository_Types');
            $this->subEntidadLiteral = $dal->GetNameType($this->subEntidadCode); 
            $entidad = $dal->GetParentType($this->subEntidadCode);
            $this->entidadCode = $entidad->getCode();
            $this->entidadLiteral = $entidad->getNameES();
            $this->dctypeentidad =  $dal->GetDcType($this->subEntidadCode); 
            $this->rdfTypeentidad =  $dal->GetRdfType($this->subEntidadCode); 
        } else {
            $this->subEntidadLiteral="";
            $this->entidadCode = "";
            $this->entidadLiteral = "";
            $this->dctypeentidad =  ""; 
            $this->rdfTypeentidad =  ""; 
        }   
    }
  
     //informo el codigo de la provincia y relleno su literal 
	public function setProvinciaCode($provinciaCode)
	{      
        if (is_numeric($provinciaCode)) {  
            $this->provinciaCode = $provinciaCode; 
            $dal = $this->context->get('Repository_Locations');       
            $this->provinciaLiteral = $dal->GetNameLocation($this->provinciaCode); 
        } else {
            $this->provinciaLiteral ="";
            $this->provinciaCode ="";
        } 
	}

   //informo el codigo de la comarca y relleno su literal 
    public function setComarcaCode($comarcaCode)
	{     
        if (is_numeric($comarcaCode)) { 
            //ojo las comarcas en progress no viene como 1 =01, 2 =02 (hay que añadir el 0)
            $this->comarcaCode = sprintf("%02d", $comarcaCode); 
            $dal = $this->context->get('Repository_Locations');    
            $this->comarcaLiteral = $dal->GetNameLocation($this->comarcaCode);   
        } else {
            $this->comarcaLiteral="";
            $this->comarcaCode ="";
        }    
    }
    
    //informo el codigo del municipio y relleno su literal 
    public function setMunicipioCode($municipioCode)
	{      
        if (is_numeric($municipioCode)) {  
             $this->municipioCode = $municipioCode;
             $dal = $this->context->get('Repository_Locations');  
             $this->municipioLiteral = $dal->GetNameLocation($this->municipioCode);
        } else {
            $this->municipioLiteral="";
            $this->municipioCode ="";
        }
    }

    //inserta prefijo sujeto
    
    public function setUrlPrefijo($urlPrefijo){
        $this->urlPrefijo = $urlPrefijo;
    }
    
    //Inserta la paginación
    public function setpaginacion($paginacion){
        $this->paginacion= $paginacion;
    }

    //Inserta el orden
    public function setorden($orden){
        $this->orden= $orden;
    }

    //Inserta el campo orden
    public function setCampoOrden($campoorden){
        $this->campoorden= $campoorden;
    }

    //informo el from (de donde vengo)
    public function setFromType($fromType){
        $this->fromType = $fromType;
    }
    
    //informo el from (de donde vengo)
    public function setUrlSujeto($urlSujeto){
        $this->urlSujeto = $urlSujeto;
    }

     //informo campo Busqueda Lobre
    public function setCampoBusquedaLibre($campoBusquedaLibre){
        $this->campoBusquedaLibre = $campoBusquedaLibre;
    }

        //Los filtros vienen con estructura "key__NameHead__Faceta__Valor__Prefijo__"
    //Informo los filtros, es decir los valores que el usuario va añadiendo según selecciona facetas
    //Estos fuiltros adicionales se añaden en el parámetro filters
    public function setFilters($filters){
        $this->filters = $filters;
        $filtersArray = array();
        //pegunto si ésta vacio ono
        if (!empty($filters)){
            //divido por caracter "|" los filtros añadidos
            $filtros = explode("|",$filters);
            $cuenta=0;
            foreach ($filtros as $filtro) {
                //por cada filtro el valor valor viene dividido por "__" y se a que se refiere por su posición
                $partesFiltro = explode("__",$filtro);
                if (count($partesFiltro)>0){
                    //cojo los valores del filtro
                    $nameHead = $partesFiltro[0];
                    $faceta = $partesFiltro[1];
                    $valor = $partesFiltro[2];
                    $prefijo = (isset($partesFiltro[3])) ? $partesFiltro[3] : "";
                    $nombre = $partesFiltro[4];
                    //loa añado al array
                    $filtersArray[$cuenta] = array("key" => $cuenta, 
                                                   "NameHead" => $nameHead ,
                                                   "Faceta" => $faceta, 
                                                   "Nombre" => $nombre,
                                                   "Valor" => $valor,
                                                   "Prefijo"=>$prefijo); 
                    $cuenta++;
                }
            }
        }
        //publico el array de filtros
        $this->filtersArray = $filtersArray;
    }


     //Devuelve el prefijo  url del sujeto
    public function getUrlPrefijo(){
       return  $this->urlPrefijo;
    }

    //Devuelve la url del sujeto 
    public function getUrlSujeto(){
        return $this->urlSujeto;
    }

    //Función que devuelve la localidad selecionada que pude ser Provincia, Comarca, o Municipio 
    public function getLocalidad()
    {
        $localidad ="";
        if(!empty($this->municipioLiteral)) {
            $localidad= $this->municipioLiteral;
        } else if(!empty($this->comarcaLiteral)) {
            $localidad= $this->comarcaLiteral;
        } else if(!empty($this->provinciaLiteral)) {
            $localidad= $this->provinciaLiteral;
        }
        $localidad = trim($localidad);
        return $localidad;
    } 

        //Función que devuelve la localidad selecionada que pude ser Provincia, Comarca, o Municipio 
        public function getLocalidadCode()
        {
            $localidadCode ="";
            if(!empty($this->municipioLiteral)) {
                $localidadCode= $this->municipioCode;
            } else if(!empty($this->comarcaLiteral)) {
                $localidadCode= $this->comarcaCode;
            } else if(!empty($this->provinciaLiteral)) {
                $localidadCode= $this->provinciaCode;
            }
            $localidadCode = trim($localidadCode);
            return $localidadCode;
        } 

    //devuelve si tengo una entidad o un tema selecionado de la navegacion
    public function getEntidadoTema(){
       $from = "";
       if (!empty($this->subEntidadCode) or !empty($this->entidadCode)) {
            $from="ENTIDAD";
       } else if (!empty($this->subTemaCode) or !empty($this->temaCode)) {
           $from = "TEMA";
       }
       return $from;
    }
    
    //Devuelve el codigo del tema
    public function getTemaCode()
	{
		return $this->temaCode;
	}

    //Devuelve el codigo del sub tema
    public function getSubTemaCode()
	{
		return $this->subTemaCode;
	}

    //Devuelve el codigo del municipio
    public function getMunicipioCode() 
	{
		return $this->municipioCode;
	}

    //Devuelve el codigo de la comarca
	public function getComarcaCode()
	{
		return $this->comarcaCode;
    }
    
   //Devuelve el codigo de la provincia
	public function getProvinciaCode()
	{
		return $this->provinciaCode;
	}

     //Devuelve el Nombre de la provincia
	public function getProvinciaNombre()
	{
		return trim($this->provinciaLiteral);
    }
     
    //Devuelve el codigo de la entidad
    public function getEntidadCode() 
	{
		return $this->entidadCode;
	}

     //Devuelve el codigo de la subentidad
    public function getSubEntidadCode()
	{
		return $this->subEntidadCode;
    }
    
    //Devuelve el codigo de from
    public function getFromType()
    {
       return $this->fromType;
    }

    //Devuelve el DcType
    public function getDcTypeEntidad() 
    {
        return  $this->rdfTypeentidad;
    }

    //Devuelve el RdfType 
    public function getRdfTypeEntidad()
    {
        return  $this->rdfTypeentidad;
    }


    //Devuelve el RdfType 
    public function getRdfTypeTema()
    {
        return  $this->rdfTypetema;
    }


    //Devuelve los filtros
    public function getFiltersArray()
    {
       return $this->filtersArray;
    }

    //Devuelve los filtros
    public function getFilters()
    {
        return $this->filters;
    }
    //Devuelve la paginacion
    public function getPaginacion(){
        return $this->paginacion;
    }

    //Devuelve el orden
    public function getOrder(){
        return $this->orden;
    }

    //Devuelve el campo orden
    public function getCampoOrder(){
        return $this->campoorden;
    }

        //Devuelve el campo orden
    public function getCampoBusquedaLibre(){
      return $this->campoBusquedaLibre;
    }

    public function getCurrentUrlWithoutFilter(){
        $actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $url = preg_replace('/([?&])filt=[^&]+(&|$)/','$1', $actual_link);
        return  $url;
    }

   //Devuelve el campo Titulo para la miga de pan dependiendo de la navegación realizada
    public function getfromTitle()
    {
       $titulo ="";
       if ($this->fromType=="Lugares") {
          $titulo = $this->getLocalidad();
          if (!empty($this->temaLiteral)) {
            $titulo = $this->temaLiteral . " de " . $this->getLocalidad();
          } else if (!empty($this->entidadLiteral)) {
            $titulo = $this->entidadLiteral . " de " . $this->getLocalidad();
          }
        } else if ($this->fromType=="Temas") {
          $titulo = $this->temaLiteral;
          $localidad = $this->getLocalidad();
          if (!empty($localidad)) {
            $titulo = $this->temaLiteral . " de " . $localidad;
          }
       } else if ($this->fromType=="Entidades") {
          $titulo = $this->entidadLiteral;
          $localidad = $this->getLocalidad();
          if (!empty($localidad)) {
            $titulo = $this->entidadLiteral . " de " . $localidad;
          }
       }
       return $titulo;
    }



    //funcion que devuelve los filtros para los marcadores de filtros añadidos en la pagina de facetacion
    public function getfiltrosSpain(){
        $filtrosSpain = array();
       
        //pregunto si hay filtros porque si los hay ya los tengo cargados
        if (strlen($this->filters)>0){ 
          //por cada uno de ellos hago un array cob clave codigo y literal nombre:valor
          $count=0;
          $filtroaquitar =  $_GET["filt"];
          $requestquitaFiltro = explode("|",$filtroaquitar);
          foreach ($this->filtersArray as  $filtro) {       
            $nuevofiltro="";
            foreach ($requestquitaFiltro as $value) {
                if (strpos($value,$filtro['NameHead'])!==False){
                    $nuevofiltro.= urlencode($value);
                }
            }
            $urlactual = "$_SERVER[REQUEST_URI]";
            $nuevofiltro = str_replace($nuevofiltro,"", $urlactual);
            $nuevofiltro = str_replace("filt=|","filt=", $nuevofiltro);
            $nuevofiltro = str_replace("filt=%7C","filt=", $nuevofiltro);
            $nuevofiltro = str_replace("&&","&", $nuevofiltro);
            $nuevofiltro = str_replace("||","|", $nuevofiltro);
            $nuevofiltro = str_replace("%7C%7C","%7C", $nuevofiltro);
            //quito la busqueda libre
            //$nuevofiltro = preg_replace('/([?&])busq=[^&]+(&|$)/','$1', $nuevofiltro);
            if (substr($nuevofiltro,-1)=="|"){
                $nuevofiltro= substr($nuevofiltro,0,-1);
            }
            if (substr($nuevofiltro,-3)=="%7C"){
                $nuevofiltro= substr($nuevofiltro,0,-3);
            }
            $nuevofiltro = $actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$nuevofiltro";
            $filtrosSpain[$count]= array("Nombre"=>$filtro['Nombre'], "Url"=>$nuevofiltro);
            $count++;
          }     
        }
        return $filtrosSpain;
    }

    //funcion que me devuelve en formato array todo el objeto
    public function getArray()
    {   //prefunto si existe cada variable que se infroma desde la lista de parametros
        //si existe creo una nueva variable y la informo con su valor , sino creo un array vacio
        (!empty($this->temaCode)) ? $tema = array($this->temaCode => $this->temaLiteral) : $tema=array();
        (!empty($this->subTemaCode)) ? $subTema = array($this->subTemaCode => $this->subTemaLiteral): $subTema=array();
        (!empty($this->provinciaCode)) ? $provincia = array($this->provinciaCode => $this->provinciaLiteral) : $provincia=array();
        (!empty($this->comarcaCode)) ? $comarca = array($this->comarcaCode => $this->comarcaLiteral) : $comarca=array();
        (!empty($this->municipioCode)) ? $municipio = array($this->municipioCode => $this->municipioLiteral) : $municipio=array();
        (!empty($this->entidadCode)) ? $entidad = array($this->entidadCode => $this->entidadLiteral) : $entidad=array();
        (!empty($this->subEntidadCode)) ? $subEntidad = array($this->subEntidadCode => $this->subEntidadLiteral) : $subEntidad=array();
        (!empty($this->fromType)) ? $fromType = array($this->fromType => $this->fromType) : $fromType=array();
        (!empty($this->filters)) ? $filters = array(urlencode($this->filters)=> $this->filters) : $filters=array();
        (!empty($this->paginacion)) ? $paginacion = array($this->paginacion => $this->paginacion) : $paginacion=array();
        (!empty($this->campoorden)) ? $campoorden = array($this->campoorden => $this->campoorden) : $campoorden=array();
        (!empty($this->campoBusquedaLibre)) ? $busquedaLibre = array($this->campoBusquedaLibre => $this->campoBusquedaLibre) : $busquedaLibre=array(""=>"");
        (!empty($this->urlSujeto)) ? $urlSujeto = array("UrlSujeto" => $this->urlSujeto) : $urlSujeto=array();

        $ord = $this->getOrder();
        $orden = array($ord  => $ord);

        //recojo los subtemas del tema selecionado
        $subTemaArray = array();
        if (!empty($this->temaCode)) {
            $dal = $this->context->get('Repository_Topics'); 
            $subTemaArray = $dal->GetSubTopics($this->temaCode);
        }
        //recojo las sunentidades de la entidad selecionada
        $subEntidadArray = array();
        if (!empty($this->entidadCode)) {
            $dal = $this->context->get('Repository_Types');
            $subEntidadArray = $dal->GetSubTypes($this->entidadCode);
        }
        $urlborrafiltros = $this->getCurrentUrlWithoutFilter();


        //creo el array con todo 
        $parametros = array(
             "Tema" => $tema,
             "SubTema" => $subTema,
             "SubTemaArray" => $subTemaArray,
             "Provincia" => $provincia,
             "Comarca" => $comarca,
             "Municipio" => $municipio,
             "Entidad" => $entidad,
             "SubEntidad" => $subEntidad,
             "SubEntidadArray" => $subEntidadArray,
             "From" => $fromType,
             "Filters" => $filters,
             "Paginacion" => $paginacion,
             "Orden" => $orden,
             "CampoOrden" => $campoorden,
             "CampoBuquedaLibre" => $busquedaLibre,
             "UrlSujeto" => $urlSujeto,
             "UrlBorraFiltros"=>$urlborrafiltros
        );
       // devuelvo el array con todo
		return  $parametros;
    }

    //funcion que me devuelve en formato json todo el objeto recoje para la traza
    public function getTraza() {
        $filtros = "";
        foreach ($this->filtersArray as $filtro) {
            $filtros .= sprintf("key:%s, NameHead:%s, Faceta:%s, Valor:%s, Prefijo:%s |", $filtro['key'],$filtro['NameHead'],$filtro['Faceta'],$filtro['Valor'],$filtro['Prefijo']);
        }
        $parametros = sprintf("Tema: %s,SubTema: %s,Provincia: %s,Comarca: %s,Municipio: %s,Entidad: %s,From: %s,Filters: %s,Paginacion: %s,Orden: %s,CampoOrden: %s,BusquedaLibre:%s, UrlSujeto: %s",
            $this->temaCode,$this->subTemaCode,$this->provinciaCode,$this->comarcaCode,$this->municipioCode, $this->entidadCode,$this->fromType,
            $filtros,$this->paginacion,$this->orden,$this->campoorden,$this->campoBusquedaLibre,$this->urlSujeto);
       return  $parametros;
    }
}
