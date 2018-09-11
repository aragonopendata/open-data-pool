<?php
namespace WebBundle\Entity;;

use WebBundle\Entity\Navegacion;
use ApiRest\AodPoolBundle\Entity\Facetas;

use WebBundle\Controller\Utility\Trazas;

//defino las url para realizar las consultas del paso1 (obtener los rftypes y cada cantador del los mismos)
//define("FILTROMUNICIPIO","ei2a:location <http://opendata.aragon.es/pool/municipio/%s> . ");
define("FILTROMUNICIPIO","?s wgs84_pos:location ?location . ?location dc:identifier '%s' . ");
define("FILTROCOMARCA","?s wgs84_pos:location ?location . ?location dc:identifier '%s' . ");                       
define("FILTROPROVINCIA","?s wgs84_pos:location ?location. ?location org:subOrganizationOf ?provincia. ?provincia rdfs:label '%s' . ");

define("FILTROENTIDAD","?s rdf:type <%s> . ");
define("FILTROSUBENTIDAD","?s rdf:type <%s> . ?s dc:type <%s> .");
define("FILTROTEMA","?s dc:type ?t0 . ?t0 rdf:type <%s> . ");
define("FILTROSUBTEMA","?s dc:type ?t0 . ?t0 rdf:type <%s> . ?s dc:type <%s> . ");
define("FILTRODFTYPE","?s dc:type <%s> . ");
define("PREFIJOSDEFECTO","PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#>  PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX dc:<http://purl.org/dc/elements/1.1/> PREFIX wgs84_pos:<http://www.w3.org/2003/01/geo/wgs84_pos#>");

define("QUERYRDFCUANTOSFACETAS","%s select ?type count(?s) as ?contador from <%s> where { ?s rdf:type ?type . %s } group by ?type");

define("QUERYFACETA","%s select ?nombre count(?s) as ?contador from <%s> where { %s } group by ?nombre order by ?nombre");
define("QUERYRDFCUANTOSRESULADOS","%s select ?s ?type from <%s> where { ?s rdf:type ?type . %s } group by ?type");
define("QUERYRDFCUANTOSRESULADOSHTML","%s select count(distinct ?s) as ?contador  from <%s> where { ?s rdf:type ?type . %s %s }");
define("QUERYRESULTADOS2","%s select distinct ?s max(?type) as ?type ?date ?name ?scoreText ?dctype from <%s> where { ?s rdf:type ?type. %s %s . ?s dc:type ?dctype .  } order by %s(%s) LIMIT 10 OFFSET %s "); 
define("QUERYRESULTADOS2FILTRORDFTYPE","?s rdf:type <%s> .");
define("QUERYRESULTADOS2FILTROUNIONSINBUSQUEDA","{ optional {%s}  %s %s } UNION ");
define("QUERYRESULTADOS2FILTROUNIONCONBUSQUEDA","{ optional {%s}  %s %s %s } UNION ");
define("QUERYBUSQUEDALIBRE", "?s %s ?y . filter(regex(?y, %s, 'i')) .");
define("QUERYBUSQUEDALIBRESCORE", "?name bif:contains '%s' OPTION ( SCORE ?scoreText ) .");
define("QUERYBUSQUEDALIBRESCORE2", '?name bif:contains "%s" OPTION ( SCORE ?scoreText ) .');


define("CAMPO_FACETA_NOMBRE","?nombre");
/*
define("CAMPO_RESULTADO_NOMBRE","?descripcion ");
define("CAMPO_RESULTADO_FECHA","?fecha");
*/

define("FACETA_TEMA","Temas");
define("FACETA_ENTIDAD","Tipos");
define("FACETA_PROVINCIA","Provincias");
define("FACETA_COMARCA","Comarcas");
define("FACETA_MUNICIPIO","Municipios");


class Filtros{
    
/**
 * Filtros
 * Clase para: 
 *      La gestión de facetas hacia virtuoso desde los parámetros get de entrada .
 *      La gestion de los resultados 
 */
    
    //objeto de navegacion con los parámetros de entrada
    protected $navegacion;
    
    //objeto que lanzalas consultas sobre virtuoso
    protected $virtuoso;

    //objeto que lanzalas consultas sobre la tabla facetas en progress
    protected $facetasDB;

    //objeto que lanzalas consultas sobre la tabla campos resultado en progress
    protected $camposResultadoDB;

    //conjunto de facetas de salida
    protected $facetasResultado;

    //conjunto de resultados de salida
    protected $elementosResultado;

     //objeto que lanzalas consultas sobre la tabla temas en progress
    protected $temasDB;
   
     //objeto que lanzalas consultas sobre la tabla entidades en progress
    protected $entidadesDB;

    //objeto que lanzalas consultas sobre la tabla localidades en progress
    protected $localidadesDB;

    //total de resultados de salida
    protected $totalResultados;

    //clase de trazas
    protected $trazas=null;

    public function __construct($navegacion, $virtuoso, $facetasDB, $camposResultadoDB, $temasDB, $entidadesDB, $directoryPath) {
        $this->navegacion = $navegacion;
        $this->virtuoso = $virtuoso;
        $this->facetasDB = $facetasDB;
        $this->temasDB = $temasDB;
        $this->entidadesDB = $entidadesDB;
       // $this->localidadesDB = $localidadesDB;
        $this->camposResultadoDB = $camposResultadoDB;

        $this->trazas = new Trazas($directoryPath);
        $this->trazas->setClase("Filtros");
        $this->trazas->LineaDebug("__construct","Entro función");
     
    }
    
    public function getFacetasResultado(){ 
        return $this->facetasResultado;
    }
    
    public function getElementosResultado(){

        return $this->elementosResultado;
    }

    public function getTotalResultados(){

        return $this->totalResultados;
    }


    //  Función que procesa las facetas a mostrar desde los parámetros de entrada
    //  Realiza dos pasos:
    //  Primero pregunta por cuantos rftypes 
    //  Segundo, dependiendo de cuantos si es mayor que 1 saca las facetas por defecto , si es 1 saca las del tipo
    public function ProcesaFacetas($campoSearch){
        $this->trazas->LineaDebug("ProcesaFacetas","Entro función");
        $this->trazas->LineaDebug("ProcesaFacetas","Pregunto por cuantos rdftypes tengo con los campos seccionados");
        //primer paso pregunto por cuantos rdftypes tengo con los campos seccionados
        $rdfTypes = $this->DameConsulta(QUERYRDFCUANTOSFACETAS);
        //inicilizo las facetas
        $this->facetasResultado= array();
        $count = count($rdfTypes);
        if ($count > 0) { 
            //si hay rdftypes 
            $this->trazas->LineaDebug("ProcesaFacetas","Si hay rdftypes cuenta:" . $count );
            if (count($rdfTypes)>1) {
                //si hay mas de uno saco las facetas por defecto de progrees
                $this->trazas->LineaDebug("ProcesaFacetas","Hay más de uno saco las facetas por defecto de progrees");
                $facetasporrdftype = $this->facetasDB->GetFacetasbyDefault();
            } else {
                //si es uno saco las facetas de su tipo de progrees
                $this->trazas->LineaDebug("ProcesaFacetas","Hay uno, saco las facetas de su tipo de progrees");
                $facetasporrdftype = $this->facetasDB->GetFacetasbyRdfType($rdfTypes[0]['type']);
            }
            //ya tengo las facetas 
            $this->trazas->LineaDebug("ProcesaFacetas","Por cada una de las facetas encontradas en progrees");
           
            foreach ($facetasporrdftype  as $facetaRdf) { 
                //por cada una de las facetas encontradas en progrees
                //primero voy por las facetas sin dctype (la vacias y comunes) que son 
                //las primeras que hay que sacar (primer acceso de facetación)      
                if (empty($facetaRdf['DcType'])){
                    //consulto a virtuoso por la faceta con los datos de progress
                    $this->trazas->LineaDebug("ProcesaFacetas","Consulto a virtuoso por la faceta con los datos de progress:" . $facetaRdf['RdfType']);
                    $facetavirtuoso = $this->DameFaceta($facetaRdf,$campoSearch);
                    if (count($facetavirtuoso)>0) {
                        $this->trazas->LineaDebug("ProcesaFacetas Nombre:",$facetavirtuoso[0]['nombre'] . " Contador:" . $facetavirtuoso[0]['contador']);
                        //con los datos de virtuoso y de progrees diseño el array que se parsea en Swig
                        $facetaweb = $this->DameFacetaWeb($facetavirtuoso,$facetaRdf);
                        $cuenta = count($facetavirtuoso);
                        for($i=0;$i<$cuenta;$i++) {
                            if(isset($facetavirtuoso[$i]['subFacetas'])) {
                                foreach ($facetavirtuoso[$i]['subFacetas'] as $subfaceta) {
                                    $subfacetas = array();
                                    $subfacetas[] = $subfaceta;
                                    $facetaweb['facetaArray'][$i]['subFacetas'][] = $this->DameFacetaWeb($subfacetas, $facetaRdf);
                                }
                            }
                        }
                        $this->trazas->LineaDebug("ProcesaFacetas","Con los datos de virtuoso y de progrees diseño el array que se parsea en Swig");
                        //publico la faceta a parsear
                        $this->facetasResultado[] = $facetaweb;
                        $this->trazas->LineaDebug("ProcesaFacetas","Publico la faceta a parsear");
                    }
                }
            }
            //ahora voy por las facetas que viene del filtro (parámetro del http get())
            //El usuario ha seleccionado una faceta que viene del filtro 
            //recojo el  filtro de la navegacion. 
            $this->trazas->LineaDebug("ProcesaFacetas","Poceso las facetas que viene del filtro");
            $arrayFilters  = $this->navegacion->getFiltersArray();
            foreach ($facetasporrdftype  as $facetaRdf) {
                //si  el dctype no está vacio (el parametro viene de http get)
                if (!empty($facetaRdf['DcType'])){
                    $this->trazas->LineaDebug("ProcesaFacetas","El dftype no está vacío:" . $facetaRdf['DcType']);         
                    //recorro las facetas del rdftype buscado alguna que tenga el dctype
                    $this->trazas->LineaDebug("ProcesaFacetas","Recorro las facetas del rdftype buscado alguna que tenga el dctype");
                    foreach ($arrayFilters as $filter) {          
                        //recojo el valor
                        //$busca = $this->navegacion->getUrlPrefijo()
                        $dctype = $this->entidadesDB->GetDcTypeByName($filter['Valor']);
                        $this->trazas->LineaDebug("ProcesaFacetas","Recojo el valor dctype: ". $filter['Valor']);
                        //si el valor (dctype del get) coincide con el dctype de progrees la faceta es la que tengo que mostrar
                        if ($facetaRdf['DcType']==$dctype){
                            $this->trazas->LineaDebug("ProcesaFacetas","El valor (dctype del get) coincide con el dctype de progrees");
                            //consulto a virtuoso por la faceta con los datos de progress
                            $facetavirtuoso = $this->DameFaceta($facetaRdf,$campoSearch);
                            $this->trazas->LineaDebug("ProcesaFacetas","Consulto a virtuoso por la faceta con los datos de progress");
                            //con los datos de virtuoso y de progrees diseño el array que se parsea en Swig
                            $facetaweb = $this->DameFacetaWeb($facetavirtuoso,$facetaRdf);
                            $this->trazas->LineaDebug("ProcesaFacetas","Con los datos de virtuoso y de progrees diseño el array que se parsea en Swig");
                            //publico la faceta a parsear
                            $this->facetasResultado[] = $facetaweb;
                            $this->trazas->LineaDebug("ProcesaFacetas","Publico la faceta a parsear");
                        }
                    }
                }
            }
        } 
        $this->trazas->LineaDebug("ProcesaFacetas","Salgo función");   
    }

    //  Función que procesa los parámetros a mostrar desde los parámetros de entrada
    //  Realiza dos pasos:
    //  Primero pregunta por cuantos rftypes 
    //  Segundo, consulta a progress por los campos fecha, titulo, búsqueda porque son distintos en cada rdftype
    //  Tambien hace las laboras de ordenación y paginación
    public function ProcesaResultados($paginacion,$order,$campoOrder,$campoSearch){
        if ($paginacion==1) {
            $paginacion=0;
        }
        $this->trazas->LineaDebug("ProcesaResultados","Entro función");
       //inicilizo el array de resultados
        $resultadosWeb = array();
        $this->trazas->LineaDebug("ProcesaResultados","Inicializo el array de resultados");
        //pregunto por los rdftype cuantos hay
        $this->trazas->LineaDebug("ProcesaResultados","Pregunto por los rdftype cuantos hay");
        $rdfTypes = $this->DameConsulta(QUERYRDFCUANTOSFACETAS);   
        if (count($rdfTypes)>0) {
         /*   if (count($rdfTypes)>100){
                $rdfTypes = array_slice($rdfTypes, 0,100);
            }*/
            //ya tengo los rdftypes y ahora voy por los campos particulares de cada uno de ellos a progress 
            $filtros ="";
            $cuenta = 0;
            //Inicializo los prefijos porque en el mismo forech consulto por los campos particulares y
            //monto la consulta a virtuoso con Union. SI algún campo particular tiene un prefijo especifico se añade al 
            //inicilizado

            $this->trazas->LineaDebug("ProcesaResultados","Inicializo los prefijos por defecto");
            $prefijos= PREFIJOSDEFECTO;
            //de la mima clase de acceso a virtuoso obtengo el esquema a poner en el form
            $this->trazas->LineaDebug("ProcesaResultados","Obtengo el esquema a poner en el form");
            $from = $this->virtuoso->getIsqlDb();
            //por cada rdftype
            $this->trazas->LineaDebug("ProcesaResultados","Por cada rdftype");

            $filtrosArray = $this->DameFiltrosDeNavegacion($prefijos);
            //voy a por los filtros de la navegacion
            $this->trazas->LineaDebug("DameConsulta","Por cada filtro encontrado");
            $filtrosNavegacion = "";
            foreach ($filtrosArray as $filtro) {
                $this->trazas->LineaDebug("DameConsulta","Añado el filtro al la cadena de filtros");
                //añado el filtro al la cadena de filtros 
                //la cada faceta debe filtrase con todo el demás contexto
                foreach ($filtro as $key => $value) {
                    //quito los tipos porque ya esta en el rdftype del $rdfTypes 
                    //if (strpos($value,"rdf:type")===false) {
                        $this->trazas->LineaDebug("DameConsulta","Filtro: " .  $value);
                        $filtrosNavegacion .= $value . " ";
                    //}
                } 
            }
            //por cada filtro encontrado
            foreach ($rdfTypes as $rdfType) {
                $this->trazas->LineaDebug("ProcesaResultados","Pregunto a progrees por sus campos particulares");
                //pregunto a progrees por sus campos particulares e fecha, titulo, campo búsqueda , etc..
                $parametrosResultados = $this->camposResultadoDB->GetCamposbyRdfType($rdfType['type']);
                //si el prefijo del campo fecha no está vacío lo informo
                if (!empty($parametrosResultados[0]['PrefijoFieldDate'])){
                    if (strpos($prefijos,$parametrosResultados[0]['PrefijoFieldDate'])===false){
                        $prefijos = $prefijos . " " . $parametrosResultados[0]['PrefijoFieldDate'];
                        $this->trazas->LineaDebug("ProcesaResultados","Prefijo del campo fecha no está vacío:".$parametrosResultados[0]['PrefijoFieldDate']);
                    }
                }
                //si el prefijo del campo nombre (titulo) no está vacío lo informo
                if (!empty($parametrosResultados[0]['PrefijoFieldName'])){
                    if (strpos($prefijos,$parametrosResultados[0]['PrefijoFieldName'])===false){
                        $prefijos = $prefijos . " " . $parametrosResultados[0]['PrefijoFieldName'];
                        $this->trazas->LineaDebug("ProcesaResultados","Prefijo del campo nombre no está vacío:".$parametrosResultados[0]['PrefijoFieldName']);
                    }
                }
                //si hay busqueda abierta
                if (!empty($campoSearch)){
                    //si el prefijo del campo buequeda (titulo) no está vacío lo informo
                    if (!empty( $resultadosFaceta)){
                        if (strpos($prefijos,$parametrosResultados[0]['PrefijoFieldSearch'])===false){
                            $prefijos = $prefijos . " " . $parametrosResultados[0]['PrefijoFieldSearch'];
                            $this->trazas->LineaDebug("ProcesaResultados","Prefijo del campo búsqueda abierta no está vacío:".$parametrosResultados[0]['PrefijoFieldSearch']);
                        }
                    }  
                }
                $CampoFecha ="";
                if (!empty($parametrosResultados[0]['FieldDate'])){
                    $CampoFecha = $parametrosResultados[0]['FieldDate'];
                    $this->trazas->LineaDebug("ProcesaResultados","Informo los campo fecha:".  $CampoFecha);
                }
    
                //si el campo fecha no esta vacío añado su filtro
                if (!empty($CampoFecha )){
                    $CampoFecha = $this->DameFiltro($CampoFecha,"",'?date');
                    $this->trazas->LineaDebug("ProcesaResultados","Filtro Fecha;" .  $CampoFecha);
                }

                $CampoNombre="";
                if (!empty($parametrosResultados[0]['FieldName'])){
                    $CampoNombre = $parametrosResultados[0]['FieldName'];
                    $this->trazas->LineaDebug("ProcesaResultados","Informo los campo nombre:". $parametrosResultados[0]['FieldName']);
                }
                //si el campo nombre no esta vacío añado su filtro
                if (!empty($CampoNombre)){
                    $CampoNombre = $this->DameFiltro($CampoNombre,"",'?name');
                    $this->trazas->LineaDebug("ProcesaResultados","Filtro Nombre;" . $CampoNombre);

                }
                //si hay búsqueda abierta informo la búsqueda abierta
                $filtroBusqueda="";
                $filtroBusquedaScore="";
                if (!empty($campoSearch)){
                    $CampoBuequeda = $parametrosResultados[0]['FieldSearch'];
                    $this->trazas->LineaDebug("ProcesaResultados","Informo los campo buequeda:". $parametrosResultados[0]['FieldSearch']);
                    //si el campo buequeda no esta vacío añado su filtro
                    if (!empty($CampoBuequeda)){
                        //primero el filtro de la propia expresion
                        $valor = sprintf('"%s"',$campoSearch);            
                        $filtroBusqueda = sprintf(QUERYBUSQUEDALIBRE ,$CampoBuequeda, $valor);    
                        $this->trazas->LineaDebug("ProcesaResultados","Filtro Buequeda;" .  $filtroBusqueda);
                        //despues el filtro del score
                        $valor="";
                        //primero creo el conjunto de AND para cada espacio entre palabras
                        $campoSearch = trim($campoSearch);
                        if (strpos($campoSearch, " ")=== FALSE){
                            $filtroBusquedaScore =  sprintf(QUERYBUSQUEDALIBRESCORE , $campoSearch);
                        } else {
                            $valoresScore = explode(" ",$campoSearch);
                            foreach ($valoresScore as $value) {
                                $valor = $valor . sprintf(" '%s' AND",$value);
                            }
                            //quito el ultiomo AND
                            $valor = substr($valor, 0, strlen($valor) - 3);
                            $valor = trim( $valor);
                            $filtroBusquedaScore =  sprintf(QUERYBUSQUEDALIBRESCORE2 , $valor);
                        }
                        if (strlen($filtroBusquedaScore)>0) {           
                            $this->trazas->LineaDebug("ProcesaResultados","Filtro Buequeda SCORE: " .  $filtroBusquedaScore);
                            //junto los dos filtros en uno para lanzar la consulta
                            $filtroBusqueda = sprintf("%s %s",$filtroBusqueda,$filtroBusquedaScore);
                        } 
                    }
                }
                //cada rdftype se filtra el SPARQL con una expresión     del tipo filter(?s in (valor))
                $filtroSujetos= sprintf(QUERYRESULTADOS2FILTRORDFTYPE,$rdfType['type']);
                $this->trazas->LineaDebug("ProcesaResultados","Filtro por sujetos filter(?s in (valor)" .$filtroSujetos );
                // informo la parte union del rdftype 
                $filtroUnion ="";
                //if ((!empty($CampoNombre) &&  !empty($filtroSujetos))) {
                if (empty($filtroBusqueda)){ 
                    $filtroUnion = sprintf(QUERYRESULTADOS2FILTROUNIONSINBUSQUEDA, $CampoFecha , $CampoNombre, $filtroSujetos);
                } else{
                    $filtroUnion = sprintf(QUERYRESULTADOS2FILTROUNIONCONBUSQUEDA, $CampoFecha , $CampoNombre, $filtroSujetos, $filtroBusqueda);
                }
                $this->trazas->LineaDebug("ProcesaResultados","Filtro Union: " . $filtroUnion);
                //añado el segmento union a la consulta total
                $filtros.= $filtroUnion;
              // }
            }
            //quito el ultimo " UNION"
            $filtros = substr($filtros, 0, strlen($filtros) - 6);
            $this->trazas->LineaDebug("ProcesaResultados","Filtro completo " . $filtros  );
            //calculo la paginación por el parámetro de entrada  
     
            $this->trazas->LineaDebug("ProcesaResultados","Paginacion:" . $paginacion);
            //si el parámetro informa de un campo order by  lo añado
            if (empty($campoOrder)){
                $campoOrder = "?name";
            }
            $this->trazas->LineaDebug("ProcesaResultados","Campo Order:" . $campoOrder);
            if ($filtros!==false) {
                //voy por los filtros de la navegacion
                //pregunto por los resulrados el nº con todo los filtros
                $query = sprintf(QUERYRDFCUANTOSRESULADOSHTML, $prefijos,$from,$filtrosNavegacion, $filtros);
                $this->trazas->LineaDebug("ProcesaResultados","pregunto por los resulrados el nº con todo los filtros");
                $resultados = $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                //pongo un primer nº de resultados sin facetar 
                if (count($resultados)==1) {
                    $this->totalResultados =  $resultados[0]['contador'];
                } else{
                    $this->totalResultados = 0;
                }
                $this->trazas->LineaDebug("ProcesaResultados","Total resultados a mostrar nº: " .  $this->totalResultados);
                //Monto la query final con todo
                $query = sprintf(QUERYRESULTADOS2, $prefijos,$from, $filtrosNavegacion, $filtros, $order,$campoOrder,$paginacion);      
                //pregunto por los resultados
                $this->trazas->LineaDebug("ProcesaResultados","Pregunto por los resultados a virtuoso");
                $resultados = $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                //preparo el array de slida para parsear con twig
                $this->trazas->LineaDebug("ProcesaResultados","Preparo el array de slida para parsear con twig");
                $Resutadoweb = $this->DameResultadosWeb($resultados);
                $this->elementosResultado = $Resutadoweb; 
            } else {
               $this->totalResultados = 0; 
            }
        } else {
            $this->totalResultados = 0; 
        }
        $this->trazas->LineaDebug("ProcesaResultados","Salgo función");   
    }

    //Función que dada una plantilla a parsear, devuelve el array de valores
    //convertidos de las triples de virtuoso 
    private function DameConsulta($plantilla){
       $this->trazas->LineaDebug("DameConsulta","Entro función");
       // inicializo los encabezados por defecto 
       $this->trazas->LineaDebug("DameConsulta","Inicializo los encabezados por defecto ");
       $prefijos = PREFIJOSDEFECTO;
        ///recojo el from
       $from = $this->virtuoso->getIsqlDb();
       $this->trazas->LineaDebug("DameConsulta","Obtengo el esquema a poner en el form");
       $filtros = ""; 
        //recojo el array de los filtros de la navegacion htttp 
       $this->trazas->LineaDebug("DameConsulta","Recojo el array de los filtros de la navegacion htttp ");
       $filtrosArray = $this->DameFiltrosDeNavegacion($prefijos);
       //por cada filtro encontrado
       $this->trazas->LineaDebug("DameConsulta","Por cada filtro encontrado");
       foreach ($filtrosArray as $filtro) {
            $this->trazas->LineaDebug("DameConsulta","Añado el filtro al la cadena de filtros");
            //añado el filtro al la cadena de filtros 
            //la cada faceta debe filtrase con todo el demás contexto
            foreach ($filtro as $key => $value) {
                $this->trazas->LineaDebug("DameConsulta","Filtro: " .  $value);
                $filtros.= $value;
            } 
       }
       $this->trazas->LineaDebug("DameConsulta","Filtro completo: ".  $filtros);
       //Creo la query con la plantilla
       $this->trazas->LineaDebug("DameConsulta","Creo la query con la plantilla");
       $query = sprintf($plantilla,$prefijos,$from,$filtros);
       $this->trazas->LineaDebug("DameConsulta","Pregunto por los resultados a virtuoso"); 
       $rdftypes = $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
       $this->trazas->LineaDebug("DameConsulta","Salgo función");
       return $rdftypes;
    }

    //funcion que devuelve las facetas de virtuoso dado el rdftype que vienen de progress
    //Es decir 
    private function DameFaceta($facetaRdf,$campoSearch){
        $this->trazas->LineaDebug("DameFaceta","Entro función");
        //inicilalizo el array de salida
        $facetas = array();   
        //GetNameByRftype //GetNameByDcType   
        //inicializo los encabezados por defecto  
        $this->trazas->LineaDebug("DameFaceta","Inicializo los encabezados por defecto");
        $prefijos = PREFIJOSDEFECTO;
        //si la faceta tiene prefijos particulares los añado a los prefijos por defecto
        if (!empty($facetaRdf['PrefijoFaceta'])){
            $this->trazas->LineaDebug("DameFaceta","Añado prefijo:" .$facetaRdf['PrefijoFaceta']);
            $prefijos =  $prefijos ." " . trim($facetaRdf['PrefijoFaceta']);
        }
        //recojo el from
        $from = $this->virtuoso->getIsqlDb();
        $this->trazas->LineaDebug("DameFaceta","Obtengo el esquema a poner en el form");
        //inicilizo la cadena de los filtros
        $filtros = "";
        //recojo el array de los filtros de la navegacion htttp
        $this->trazas->LineaDebug("DameFaceta","Recojo el array de los filtros del caplo filter get del http");
        $filtrosarray = $this->DameFiltrosDeNavegacion($prefijos);
        //por cada filtro encontrado en el campo value vien el filto en cuestion
        $filtroEncontrado = false;
        foreach ($filtrosarray as $filtro) {
            $this->trazas->LineaDebug("DameFaceta","Por cada filtro");
            //añado el filtro al la cadena de filtros 
            //la cada faceta debe filtrase con todo el demás contexto
            foreach ($filtro as $key => $value) {
                $this->trazas->LineaDebug("DameFaceta","Añado el filtro al la cadena de filtros " . $value);
                $filtros.= $value;
            }
        }

        if (!empty($campoSearch)) {
            //ahora añado el campo busquedalibre si lo tienene y se ha solicitado
            $this->trazas->LineaDebug("ProcesaResultados","Pregunto a progrees por sus campos particulares");
            //pregunto a progrees por sus campos particulares e fecha, titulo, campo búsqueda , etc..
            $parametrosResultados = $this->camposResultadoDB->GetCamposbyRdfType($facetaRdf['RdfType']);         
            if (!empty($parametrosResultados['PrefijoFieldSearch'])){
                //si hay busqueda abierta
                $prefijos = $prefijos . " " . $parametrosResultados[0]['PrefijoFieldSearch'];
                $this->trazas->LineaDebug("ProcesaResultados","Prefijo del campo búsqueda abierta no está vacío:".$parametrosResultados[0]['PrefijoFieldSearch']);
            }
            //si hay búsqueda abierta informo la búsqueda abierta
            $filtroBusqueda="";
            $CampoBuequeda = $parametrosResultados[0]['FieldSearch'];
            $this->trazas->LineaDebug("ProcesaResultados","Informo los campo buequeda:". $parametrosResultados[0]['FieldSearch']);
            //si el campo buequeda no esta vacío añado su filtro
            if (!empty($CampoBuequeda )){
                $valor = sprintf('"%s"',$campoSearch);            
                $filtroBusqueda = sprintf(QUERYBUSQUEDALIBRE ,$CampoBuequeda, $valor);
                $filtros.= $filtroBusqueda;
                $this->trazas->LineaDebug("ProcesaResultados","Filtro Buequeda;" .  $filtroBusqueda);
            }
        }
        //ahora pregunto por los filtros del rdftype en cuestion, añado ?nombre, ya que se agrupa la faceta
        //por ese parametro ?nombre en SPARQL
        $this->trazas->LineaDebug("DameFaceta", "Pregunto por los filtros del rdftype en cuestion");
        $query = sprintf(QUERYFACETA,$prefijos,$from,$filtros);
        $filtros.= $this->DameFiltro($facetaRdf['Faceta'],$facetaRdf['Condition'],CAMPO_FACETA_NOMBRE);
        $this->trazas->LineaDebug("DameFaceta","Creo la query con la plantilla");
        //Creo la query con la plantilla
        $this->trazas->LineaDebug("DameFaceta","Filtro completo: " .  $filtros);
        $query = sprintf(QUERYFACETA,$prefijos,$from,$filtros);
        //llamo a virtuoso
        $this->trazas->LineaDebug("DameFaceta","Pregunto por los resultados a virtuoso");
        $facetas = $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
        //dependiendo de NameHead de la faceta que nos indica el tipo al que se refiere 
        //hay que traducir el codigo que nos devuelven al decriptivo que aparcerá en la web 
        $this->trazas->LineaDebug("DameFaceta","Dependiendo de Namehead de la faceta que nos indica el tipo");   
        switch ($facetaRdf['NameHead']) {
            case FACETA_TEMA:
                $this->trazas->LineaDebug("DameFaceta","NameHead: " . FACETA_TEMA);
                $todasFacetas = Array();
                //por cada valor de la faceta Nombre(contador)
                //en el caso de los temas la traduccion viene por el rdftype y estan los padres y los hijos

                //recojo todos en un array 
                foreach ($facetas as $faceta) {
                    # code...
                    $rdftype = $faceta['nombre'];
                    $this->trazas->LineaDebug("DameFaceta","valor entrada: ",  $rdftype);
                    if(!empty($rdftype)) {
                        $faceta['valor']= $rdftype;
                        $faceta['nombre'] = $this->temasDB->GetNameByRftype($rdftype);
                        $faceta['padre'] = $this->temasDB->GetParentType($rdftype);
                    }    
                    $todasFacetas[] = $faceta; 
                } 
                $facetasTemporales = array();
                //ahora pongo los hisjos debajo de sus padres
                foreach ($todasFacetas as $facetaHija) {
                    $puesta=false;
                    //si no es padre
                    if ( $facetaHija['padre']!=0) {
                        //recoco rdftype del padre
                        $rdftypeHija = $this->temasDB->GetRdfTopic($facetaHija['padre']);
                        foreach ($todasFacetas as $facetaPadre) {
                            if ( $facetaPadre['padre']==0) {
                                //si el rdftype del padre es igual al rdftype de la facetapadre
                                if($facetaPadre['valor']==$rdftypeHija) {
                                    $facetaPadre['subFacetas'][] = $facetaHija;
                                    //si no hay facetas padre acumuladas la publico
                                    if (count($facetasTemporales)==0) {
                                        $facetaPadre['valor']="#";
                                        $facetasTemporales[] = $facetaPadre;
                                        $puesta=true;
                                    //si no bueco la que corresponde
                                    } else {
                                        $cuenta = count($facetasTemporales);
                                        for($i=0;$i< $cuenta;$i++) {
                                            if ($facetasTemporales[$i]['nombre']==$facetaPadre['nombre']) {
                                                $facetasTemporales[$i]['subFacetas'][] = $facetaHija;
                                                $puesta=true;
                                            }     
                                        } 
                                        if (!$puesta) {
                                            $facetaPadre['valor']="#";
                                            $facetasTemporales[] = $facetaPadre;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $facetas = $facetasTemporales;              
            break;
            case FACETA_ENTIDAD:
                $this->trazas->LineaDebug("DameFaceta","NameHead: " . FACETA_ENTIDAD);
                $facetasTemporales = Array();
                //por cada valor de la faceta Nombre(contador)
                //en el caso de los temas la traducción viene por el dctype
                $this->trazas->LineaDebug("DameFaceta","Por cada valor de la faceta he de sacar Nombre(contador)");
                foreach ($facetas as $faceta) {
                    # code...
                    $dctype = $faceta['nombre'];
                    $this->trazas->LineaDebug("DameFaceta","valor entrada: ",  $dctype);
                    
                    //voy por la faceta con jerarquia (con sus subfacetas) y la almaceno en facetaTemporal
                    $facetaTemporal = $this->DameFacetaJerarquiaTipoEntidad($dctype, $faceta, $query);
                    $this->trazas->LineaDebug("DameFaceta","Voy por la faceta con jerarquia (con sus subfacetas) y la almaceno en facetaTemporal");
                    //si existe la feceta con jerarquia 
                    if (count($facetaTemporal)>0) {
                        $this->trazas->LineaDebug("DameFaceta","Faceta con jerarquia existe");
                        $cuenta=0;
                        $key=-1;
                        $this->trazas->LineaDebug("DameFaceta","Pregunto por el nombre de las facetas guardadas y la actual apara agrupar padres");
                        //Pregunto por el nombre de las facetas guardadas y la actual apara agrupar padres
                        foreach ($facetasTemporales as $facetasTemporal) {
                            $this->trazas->LineaDebug("DameFaceta","Compara nombres Guradada:" . $facetasTemporal['nombre'] . " Actual:" . $facetaTemporal['nombre']);
                            if ($facetasTemporal['nombre'] ==  $facetaTemporal['nombre']) {
                                $this->trazas->LineaDebug("DameFaceta","Como el nombre es el mismo pregunto si tiene hijos, es decir: si ha faceta padre");
                               //Pregunto por el nombre de las facetas guardadas y la actual apara agrupar padres
                                if (isset($facetaTemporal['subFacetas'])) {
                                    //Como tiene hijos: hay padre. Añado la faceta a los hijos del padre que ya existe en guardadas y sumo el contador
                                    $this->trazas->LineaDebug("DameFaceta","Como tiene hijos: hay padre. Añado la faceta a los hijos del padre que ya existe en guardadas");
                                    $facetasTemporal['subFacetas'][] = $facetaTemporal['subFacetas'][0];
                                    $facetasTemporal['contador']=0;
                                    foreach ($facetasTemporal['subFacetas'] as $subFacerta) {
                                        $facetasTemporal['contador'] +=  $subFacerta['contador'];
                                    }
                                    $facetaTemporal['subFacetas'] =  $facetasTemporal['subFacetas']; 
                                    $facetaTemporal['contador']  =  $facetasTemporal['contador'] ;
                                }
                                $key = $cuenta;
                                $cuenta++;
                            } 
                        }
                        //si la $key es mayor que -1 esque hay dato
                        if ($key>=0) {        
                            $this->trazas->LineaDebug("DameFaceta",sprintf("Faceta Padre: %s en posicion (%s) Añade faceta %s .",  $facetasTemporales[$key]['nombre'], $key , $facetaTemporal['nombre']));
                            foreach ($facetasTemporales as $key=>$faceta) {
                                if ($faceta['nombre']=== $facetaTemporal['nombre']){
                                    $facetasTemporales[$key]=$facetaTemporal;
                                }
                            }
                        } else {
                            $this->trazas->LineaDebug("DameFaceta",sprintf("Faceta: %s . Añade faceta nueva." , $facetaTemporal['nombre']));
                            $facetasTemporales[] = $facetaTemporal;
                        } 
                    }
                } 
                $facetas = $facetasTemporales;
            break;
            default:
                $this->trazas->LineaDebug("DameFaceta","NameHead: " . "default");
                $facetasTemporales = Array();
                //por cada nombre le asigno un nuevo  elemnto con valor
                foreach ($facetas as $faceta){
                    $faceta['valor'] = $faceta['nombre'];
                    $nombre = $this->entidadesDB->GetNameByDcType($faceta['nombre']);
                    if (!empty($nombre)){
                        $faceta['nombre']= $nombre;
                    } else {
                        $faceta['nombre'] = str_replace($this->navegacion->getUrlPrefijo(),"",$faceta['nombre']);
                    }
                    $facetasTemporales[] = $faceta;
                }
                $facetas = $facetasTemporales;
            break;
            //FACETA_COMARCA FACETA_MUNICIPIO FACETA_PROVINCIA            
        }
        $this->trazas->LineaDebug("DameFaceta","Salgo función");
        return $facetas;   
    }
 
    //funcion que calcula el slag campo unico en la base de datos progres para las localidades
    //quita todo lo que no seaan carateres de  a-z includos acentos ñ dieresis y lo pone en miusculas
    private function DameSlugLocalidad($texto){
        $this->trazas->LineaDebug("DameSlugLocalidad","Entro función");
        setlocale(LC_ALL, 'en_US.UTF8');
        $slug= preg_replace("/[^A-Za-z0-9 ]/", '', iconv('UTF-8', 'ASCII//TRANSLIT', $texto));
        $slug  = str_replace(" ","",$slug);
        $slug = strtolower($slug);
        $this->trazas->LineaDebug("DameSlugLocalidad","Salgo función"); 
        return $slug;
    }

    //funcion que dado un tipo por dctype devuelve el conjunto de facetas jerarquizadas
    //incluyendo los padres y los hijos de su contexto parametros:
    //$dctype: el  dctype 
    //$facetaActual: la feceta actual sin hijos ni padres
    //$query: la consulta sparq que ha dado como solucion la faceta actual, ultima consulta de la llamada
    private function DameFacetaJerarquiaTipoEntidad($dctype,$facetaActual, $query){
        $facetasTemporal = array();
        $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Entro función");
        $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad",sprintf("Parametros dctype: %s, facetaactual: %s, query: %s ",$dctype,$facetaActual['nombre'],$query));
        //busco si tiene padre
        $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","busco si tiene padre");
        //busco si tiene padre
        $padre = $this->entidadesDB->GetParentTypeByDctype($dctype);
        //$hijos = $this->entidadesDB->GetChildTypeByDctype($dctype);
        if (count($padre)==0) {
            //como tiene no padre 
            $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","No Tiene Padre");
            $nombre  = $this->entidadesDB->GetNameByDcType($dctype);
            $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Nombre de la faceta pòr dcType:" . $dctype . "->" .   $nombre );
            //voy por el nombre de la faceta (el nombre literal de presentacion)
            if(!empty($dctype)) {
                //informo l valor en el array de publicación
                $facetaActual['valor']= $dctype;
                $facetaActual['nombre']= $nombre;
                $facetasTemporal = $facetaActual;
            } 
        } else {
           /* if (count($hijos)>0) {
                $facetasHijos = array();
                foreach ($hijos as $hijo) {
                  $hijoaaray = $hijo->getArray();
                  $querydc = printf("?s dc:type '%s'", $hijoaaray['dcType']);
                  $querydc = str_replace("?s dc:type ?nombre", $querydc,$query);
                  $subfaceta = $this->virtuoso->DameConsultaWeb($querydc,"SUJETOS");
                  $cuantos = 1;
                  if ($cuantos>0) {    
                    $facetasHijos[] = array('nombre' => $hijo['NameEs'], 'contador'=> $cuantos);  
                  }
                }
                $facetaActual['subEntidades'][] = $facetasHijos;
            }*/
            $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Tiene Padre");
            if (count($padre)>0) {
                $nombre  = $this->entidadesDB->GetNameByDcType($dctype);
                $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Nombre de la faceta pòr dcType:" . $dctype . "->" .   $nombre );
                //voy por el nombre de la faceta (el nombre literal de presentacion)
                if(!empty($dctype)) {
                       //informo l valor en el array de publicación
                    $facetaActual['valor']= $dctype;
                    $facetaActual['nombre']= $nombre;
                }
                //Creo la consulta denuevo cambiando el dctype (dc:type ) , por (rdf:type) padre 
                $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Creo la consulta de nuevo cambiando el dctype (dc:type ) , por (rdf:type) padre");
                $querydc = str_replace("select ?nombre", "select ?nombre  ?rdftype", $query);
                $querydc = str_replace("group by ?nombre", "group by ?nombre ?rdftype", $querydc);
                $querydc = str_replace("?s dc:type ?nombre .", "?s dc:type ?nombre . ?s rdf:type ?rdftype .", $querydc);
                 
                $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad", "query resultante:" . $query);
                //pregunto por el padre a virtuoso
                $subfaceta = $this->virtuoso->DameConsultaWeb($querydc,"SUJETOS");
                $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad", "pregunto por el padre a virtuoso");
                if (count($subfaceta)>0) { 
                    //de momento si hay mas de 1 busco la que coincide con entidades
                    if (count($subfaceta)>1) 
                    {
                        $subfaceta =  $this->entidadesDB->GetDcTypeByRdfTypes($subfaceta,$dctype); 
                    }
                    //si hay respuesta creo una faceta padre y le añado como hiko la actual
                    $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad", "Si hay respuesta. Creo una faceta padre y le añado como hiko la actual");
                    $facetaPadre = array(); 
                    if (count($subfaceta)>0) {
                        $facetaPadre['valor'] =  "#";
                        $facetaPadre['nombre'] = $this->entidadesDB->GetNameByRdfType($subfaceta[0]['rdftype']); 
                        $facetaPadre['contador']= $subfaceta[0]['contador'];
                    } else{
                        $facetaPadre['valor'] =  "#"; 
                        $facetaPadre['nombre'] = "Sin nombre";
                        $facetaPadre['contador'] = 0; 
                    }
                    $facetaPadre['subFacetas'][] = $facetaActual;
                    $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad", sprintf("Faceta padre: %s, faceta Hija %s", $facetaPadre['nombre'], $facetaActual['nombre']));
                }       
            } 
            //asigna la faceta construida a devolver 
            $facetasTemporal =  $facetaPadre;
        }
        return  $facetasTemporal;
        $this->trazas->LineaDebug("DameFacetaJerarquiaTipoEntidad","Salgo función");
    }


    /**
	 * Función que dada una cadena de texto devuelve el filtro o filtros con formato sparql
	 * Los filtos pueden estar anidados por @ y condicionados con $ para el reverso
     * Tambien admite un campo condition que es otro filtro anidado con el mismo origen que $filter por lo que no hay que repetirlo
	 */
	public function DameFiltro($filter,$condition,$valor){
        $this->trazas->LineaDebug("DameFiltro","Entro función");
  
		$filtro = "";
        //compruebo que existe operador '@' (filtros anidados)
        $pos = strpos($filter, "@");
        $this->trazas->LineaDebug("DameFiltro","Compruebo que existe operador '@'");
        //si no hay es una condicion simple 
        if ( $pos === FALSE) {
            $this->trazas->LineaDebug("DameFiltro","No exite");
            $filtro  = sprintf("?s %s %s .",$filter, $valor);
        } else {
            $this->trazas->LineaDebug("DameFiltro","Exite");
            //en caso contrario miro si existe operador $ (condicion reverso para la primara condición)
            $condolar = (boolean)(strpos($filter, "$")===0);
            $this->trazas->LineaDebug("DameFiltro","Miro si existe operador $ (condicion reverso para la primara condición):".  $condolar );
            //separo los anidamientos por '@'
            $filterConditionPart = explode("@",$filter);
            $this->trazas->LineaDebug("DameFiltro","separo los anidamientos por '@'");
            $count = 0;
            //por cada uno de ellos creo la condicicón anidada
            foreach ($filterConditionPart as $filterCondition) {
                //en caso que sea la primara condicion y tenga reverso cruzo las condiciones
                if ($count==0){
                    if ($condolar) {
                        $filtro .=  sprintf("?s%s %s ?s . ",$count, $filterCondition);
                        $this->trazas->LineaDebug("DameFiltro","Cruzo las condiciones");
                    } else {
                        //si no creo el anidamiento normalmente
                        $filtro .=  sprintf("?s %s ?s%s . ", $filterCondition, $count);
                        $this->trazas->LineaDebug("DameFiltro","creo el anidamiento normalmente");
                    }
                } else {
                    $filtro .=  sprintf("?s%s %s ?s%s . ",$count-1, $filterCondition, $count);		
                }
                $this->trazas->LineaDebug("DameFiltro","Filtro". $filtro);
                $count++;
            }
            //remplazo la ultima variable con el valor a buscar
            $ultimo = sprintf("?s%s",$count-1);
            $filtro = str_replace($ultimo,$valor,$filtro);
            $this->trazas->LineaDebug("DameFiltro","Filtro:" . $filtro);
            //si hay filtro condicion
            if (!empty($condition)) {
                $this->trazas->LineaDebug("DameFiltro","Si hay filtro condicion");
                //recojo las partes
                $filterConditionPart = explode("@",$condition);
                $count = 0;
                $filtroCondicion ="";
                //por cada uno de ellos creo la condicicón anidada
                foreach ($filterConditionPart as $filterCondition) {
                    $this->trazas->LineaDebug("DameFiltro","Por cada uno de ellos creo la condicicón anidada");
                    //en caso que sea la primara condicion en el campo condition hay que ponerla ya que ya
                    //se ha incluido en el filtro
                    if ($count>0){
                        //separo el campo del valor por '='
                        $campoValor = explode("=",$filterCondition);
                        $this->trazas->LineaDebug("DameFiltro","separo el campo del valor por '='");
                        if (count($campoValor)==2) {
                            $filtroCondicion =  sprintf(" ?s%s %s %s . ",$count-1, $campoValor[0], $campoValor[1]);
                            $this->trazas->LineaDebug("DameFiltro","Filtro Condición:", $filtroCondicion);
                        }		
                    }
                    $count++;
                }
                $filtro = $filtro . $filtroCondicion;
                $this->trazas->LineaDebug("DameFiltro","Filtro:" . $filtro);
            }
        }
        $this->trazas->LineaDebug("DameFiltro","Salgo función");
        return $filtro;
    }
    
    //función que devuelve un array con los filtros formato virtuoso con todos los parámetros
    //recogidos en el objeto navegacion (obtien los datos de los parámetros de la url (get)
    private function DameFiltrosDeNavegacion(&$prefijos){
        $this->trazas->LineaDebug("DameFiltrosDeNavegacion","Entro función");
        //inicilizo el array de respuesta
        $filtros=array();
        $this->trazas->LineaDebug("DameFiltrosDeNavegacion","Inicilizo el array de respuesta");
        //por cada uno delos parametros pregunto si exite 
        if (!(empty($this->navegacion->getProvinciaCode()))) {
            //si existe parseo el filtro (formato virtuoso), con su plantilla correspondiente
            $filtro = sprintf(FILTROPROVINCIA, $this->navegacion->getProvinciaNombre());
            //añado el filtro al array con su clave correspondiente
            $filtros[PROVINCIA] = array(FACETA_PROVINCIA=>$filtro);
            $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_PROVINCIA . ":" .$filtro);
        } 
        if (!(empty($this->navegacion->getComarcaCode()))) {
            $filtro = sprintf(FILTROCOMARCA,$this->navegacion->getComarcaCode());
            $filtros[COMARCA] = array(FACETA_COMARCA=>$filtro);
            $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_COMARCA . ":" .$filtro);
        } 
        if (!(empty($this->navegacion->getMunicipioCode()))) {
            $filtro = sprintf(FILTROMUNICIPIO,$this->navegacion->getMunicipioCode());
            $filtros[MUNICIPIO] = array(FACETA_MUNICIPIO=>$filtro);
            $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_MUNICIPIO . ":" .$filtro);
        } 

        if (!(empty($this->navegacion->getSubTemaCode()))) {
               
            $filtro = sprintf(FILTROSUBTEMA,$this->navegacion->getRdfTypeTema());
            $filtros[SUBTEMA] = array(FACETA_TEMA=>$filtro); 
            $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_TEMA . ":" .$filtro);
        } 

        if ((empty($this->navegacion->getSubTemaCode()))) {
            if (!(empty($this->navegacion->getTemaCode()))) {
                $filtro = sprintf(FILTROTEMA,$this->navegacion->getRdfTypeTema());
                $filtros[TEMA] = array(FACETA_TEMA=>$filtro);
                $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_TEMA . ":" .$filtro);
            } 
        }
        if (!(empty($this->navegacion->getSubEntidadCode()))) {
            $filtro = sprintf(FILTROSUBENTIDAD,$this->navegacion->getRdfTypeEntidad(), $this->navegacion->getDcTypeEntidad());
            $filtros[SUBENTIDAD] = array(FACETA_ENTIDAD=>$filtro);
            $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_ENTIDAD . ":" .$filtro);
        }  

        if ((empty($this->navegacion->getSubEntidadCode()))) {
            if (!(empty($this->navegacion->getEntidadCode()))) {
                $filtro = sprintf(FILTROENTIDAD,$this->navegacion->getRdfTypeEntidad());
                $filtros[ENTIDAD] = array(FACETA_ENTIDAD=>$filtro);
                $this->trazas->LineaDebug("DameFiltrosDeNavegacion", FACETA_ENTIDAD . ":" .$filtro);
            } 
        }  
        // En el caso de los filtros el parametro puede venir con más de uno y se anidan en un array que hay que recorrer

        if (count($this->navegacion->getFiltersArray()>0)) {
           $this->trazas->LineaDebug("DameFiltrosDeNavegacion","En el caso de los filtros el parametro puede venir con más de uno");
           $stringFiltres="";
           $arrayFilters  = $this->navegacion->getFiltersArray();
           //por cada filtro encontrado
           foreach ($arrayFilters as $filter) {
                if (!empty($filter['Prefijo'])) {
                    $prefijos .= " " . $filter['Prefijo'];
                }
                //recojo el valor de la faceta por el filtro 
                $valor = $this->DameValorFaceta($filter['NameHead'],$filter['Valor'],$filter['Faceta']);
                //calculo y añado el filtro a la cadena de filtros
                $stringFiltres .= $this->DameFiltro($filter['Faceta'],"", $valor) . " ";

           }
           $this->trazas->LineaDebug("DameFiltrosDeNavegacion","Facetas de Filtros" .$stringFiltres);
           //pulico los filtros como añadidos
           $filtros[FILTERS] = array("AÑADIDOS"=>$stringFiltres); 
           $this->trazas->LineaDebug("DameFiltrosDeNavegacion","pulico los filtros como añadidos");
        } 
        $this->trazas->LineaDebug("DameFiltrosDeNavegacion","Salgo función");
        return  $filtros;
    }
    
    //Función que rehace el filtro ya que el valor recogido en la segunda pasada es descriptivo y el filtro
    // valor sparql tambien cambia
    private function DameValorFaceta($namehead,$valor,$faceta){
        $this->trazas->LineaDebug("DameValorFaceta","Entro función");
        $nuevovalor = "";
        switch ($namehead) {
            case 'Tipos':
               // $nuevovalor = $this->entidadesDB->GetDcTypeByName($valor);
                $nuevovalor = $valor;
                break;
            case 'Temas':
                $nuevovalor = $valor;
                break;
            case 'Comarcas':
                $nuevovalor = $valor;
                break;
            case 'Provincias':
                 $nuevovalor = $valor;                 
                //$nuevovalor = $this->entidadesDB->GetDcTypeByName($valor);
                break;
            case 'Municipios':
                $nuevovalor = $valor;
                break;
            default:
                $nuevovalor = $valor;
                break;
        }
        $traza = sprintf("Tipo:%s Valor:%s NuevoValor:%s",$namehead,$valor,$nuevovalor);
        $this->trazas->LineaDebug("DameValorFaceta", $traza );
        //si el valor es uri viene enmarcado por "<http//>" 
        $protocolo = (isset($_SERVER['HTTPS'])) ? "https" : "http";
        if (strpos($valor,$protocolo) === False) {       
            //si no hay que ponerlo entre comillas
            $nuevovalor = sprintf("'%s'",$nuevovalor);
            $this->trazas->LineaDebug("DameValorFaceta","El valor es no es uri:".$valor );
        } else {
            if (strpos($valor,"<")===False) {
                $nuevovalor = sprintf("<%s>",$nuevovalor);
            }
            $this->trazas->LineaDebug("DameValorFaceta","El valor es  uri:".$valor );
        }
        $this->trazas->LineaDebug("DameValorFaceta","Salgo función");
        return $nuevovalor;
    }

    //funcion que compone el array de salida para la web de la faceta recive el conjunto de facetas
    //provienetes de virtuso y la facetaRdf los campos recogidos desee progress
    private function DameFacetaWeb($facetaVirtuoso,$facetaRdf){
        $this->trazas->LineaDebug("DameFacetaWeb","Entro función");
        $actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $filtro = (isset($_GET["filt"])) ? $_GET["filt"] : "";
        $this->trazas->LineaDebug("DameFacetaWeb","Filtro get del http: .", $filtro);
        //le pongo & dependiendo de donde este ella url
        $pos = strpos($actual_link,"filt=");
        if ($pos) {
            $actual_link = substr($actual_link,0, $pos);
        } else {
            $actual_link = $actual_link . "&";
        }
        $facetaWeb = array();
        $count = count($facetaVirtuoso);
        if ($count >0) {
            $this->trazas->LineaDebug("DameFacetaWeb","Hay mas de una faceta de virtuso:" . $count );
            $facetaArray = array();
            $this->trazas->LineaDebug("DameFacetaWeb","Por cada faceta de virtuoso"); 
            $resultadosFaceta=0;
            foreach ($facetaVirtuoso as $faceta) {
                    //si hay parametro get filt y no esta vacio
                    $filtro = (isset($_GET["filt"])) ? $_GET["filt"] : "";
                    $this->trazas->LineaDebug("DameFacetaWeb","hay parametro get filt y no está vacío"); 
                    $filtroUrl = $this->DameUrlFacetaFiltroWeb($faceta['nombre'], $faceta['valor'],$facetaRdf,$filtro);  
                    $this->trazas->LineaDebug("DameFacetaWeb","Faceta web de este" . $filtroUrl); 
                    $url = $actual_link .  $filtroUrl;
                    $this->trazas->LineaDebug("DameFacetaWeb","Faceta url de la faceta: " . $url);
                    if ($faceta['contador']>0 or isset($faceta['subFacetas'])) {
                        $traza = sprintf("NameHead:%s nombre:%s contador:%s url:%s",$facetaRdf['NameHead'], $faceta['nombre'],$faceta['contador'],$url);
                        $this->trazas->LineaDebug("DameFacetaWeb","Creo faceta" . $traza  );
                        $facetaArray[] = array("href"=>$url, "name"=>$facetaRdf['NameHead'],"title"=>$faceta['nombre'], "count"=>$faceta['contador']);
                    }
            }   
            $id = "id". $facetaRdf['NameHead'];
            $boxid = "idfaceta_". $facetaRdf['NameHead'] . "_boxid";
            $this->trazas->LineaDebug("DameFacetaWeb","Creo faceta web" .  $id .  " " .  $boxid);
            $facetaWeb = array("id"=>  $id , "boxid"=>$boxid, "title"=>$facetaRdf['NameHead'], "facetaArray" => $facetaArray);
        }
        $this->trazas->LineaDebug("DameFacetaWeb","Salgo función");
        return  $facetaWeb;
    }

    //funcion que prepara el campo web filtros para motar la url de salida
    //parametros:
    //valor: el valor de la faceta (el nombre que sale junto al contador)
    //facetaRdf: los campos recogidos desee progress
    //filt: el filtro actual para quitar duplicados
    private function DameUrlFacetaFiltroWeb($nombre,$valor,$facetaRdf,$filt)
    {   
        $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","Entro función");
        $filtro ="";
        $filtroFinal="";
        //si el valor es una url ya le pongo el enmarcado <>
        $protocolo = (isset($_SERVER['HTTPS'])) ? "https" : "http";
        if (strpos($valor,$protocolo) === 0) {
            if (strpos($valor,"<")===False) {
                $valor = sprintf("<%s>",$valor);
            }
        }
        $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","valor:". $valor);
        //creo el filtro encuention. pero puede haber varios y pude estar ya estaren el filtro altual
        $filtroComp = sprintf("%s__%s__%s__%s",$facetaRdf['NameHead'],$facetaRdf['Faceta'],$valor,$facetaRdf['PrefijoFaceta']);
        $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","Filtro Comparación" . $filtroComp );
        //busco si el filtro ya existe
        $ponfiltro = true;
        if (!empty($filt)) {
            $ponfiltro = (strpos($filt,$filtroComp)===FALSE);
            $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","Pon filtro" . $ponfiltro );
        }
        if ($ponfiltro) {
            //si no existe en el filtro actual 
            $filtro = sprintf("%s__%s__%s__%s__%s",$facetaRdf['NameHead'],$facetaRdf['Faceta'],$valor,$facetaRdf['PrefijoFaceta'],$nombre);

            if (!empty($filt) ) {  
                //si ya existe el parametro lo continuo
                $filtroFinal .= "filt=" . urlencode($filt. "|" . $filtro);           
            } else {
                //si no hay filtro actual comienzo el parametro    
                $filtroFinal= "filt=" .  urlencode($filtro);
            }
            $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","Filtro:" . $filtro);

        } else {
            //si ya está el parametro no hago nada
            $filtroFinal= "filt=" . urlencode($filt);
        }

        $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","FiltroFinal:" . $filtroFinal);
        $this->trazas->LineaDebug("DameUrlFacetaFiltroWeb","Salgo función");
        //devuelvo el filtro final.
        return  $filtroFinal ;
    }


    //funcion que compone el array de salida para la web de los resultados
    private function DameResultadosWeb($resultadosVirtuoso){
        $this->trazas->LineaDebug("DameResultadosWeb","Entro función");
        //inicializo el array de salida
        $resources = array();
        $this->trazas->LineaDebug("DameResultadosWeb","Inicializo el array de salida");
        //calculo la url para el link
        $actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $urlcompose = explode("?",$actual_link);
        $this->trazas->LineaDebug("DameResultadosWeb","actual_link",  $actual_link);
        //por cada elemento de resultado  
        $this->trazas->LineaDebug("DameResultadosWeb","Por cada elemento de resultados");
        foreach ($resultadosVirtuoso as $resultado) {
            //Iniclaizo el tipo la fecha y el nombre
            $tipo =  $this->entidadesDB->GetNameByRdfType($resultado['type']);
            $subtipo = $this->entidadesDB->GetNameByDcType($resultado['dctype']); 
            $tipo = sprintf("%s - %s", $tipo, $subtipo);
            
            $date = "";
            $name = "Sin Nombre";
            $this->trazas->LineaDebug("DameResultadosWeb","Iniclaizo el tipo la fecha y el nombre");
            //pongo la fecha
            if (isset($resultado['date'])) {
                if (!empty($resultado['date'])) {
                    $date = $resultado['date'];
                    $this->trazas->LineaDebug("DameResultadosWeb","Pongo la fecha:" .  $date );
    
                }     
            }
            //pongo el nombre
            if (isset($resultado['name'])){
                if (!empty($resultado['name'])) {
                    $name =  $resultado['name'];
                    $this->trazas->LineaDebug("DameResultadosWeb","Pongo el nombre:". $name);
                }
            }
            //calculo la ruta link al elemento detalle
            $ruta = str_replace("filtros","detalles",$urlcompose[0]);
            $ruta = str_replace("resultados","detalles", $ruta);
            $s = str_replace($this->navegacion->getUrlPrefijo(),"",$resultado['s']);
            $s = urlencode($s);
            $url = sprintf("%s?url=%s&%s",$ruta, $s,$urlcompose[1]);
            $this->trazas->LineaDebug("DameResultadosWeb","Calculo la ruta link al elemento detalle: " . $url);
            //añado publico el elemento a parsear en twing
            $traza = sprintf("tipo:%s fecha:%s descripcion:%s url:%s",$tipo, $date,$name,$url);
            $this->trazas->LineaDebug("DameResultadosWeb","Añado resultado", $traza );
            $resources[] = array("tipo"=>$tipo,"fecha"=>$date,"descripcion"=>$name,"url"=>$url);
        }
        $this->trazas->LineaDebug("DameResultadosWeb","Salgo función");
        //devuelvo la los resources
        return  $resources;
    }

    public function DameGraficas($facetas){
        $naranja='#ff6600';
        $azul='#0066ff';
        $verde='#cccc00';
        $rojo='#ff0000';
        $amarillo='#ffff00';
        $colores = array($naranja, $azul, $verde,$amarillo);

        $style=array();
        $style['fontSize']= '15px';
        $style['fontWeight']= 'bold';
        $dataLabels = array('enabled' =>'true','align'=>'center','verticalAlign'=>'top', 'style'=>$style);

        $levels = array();
        $levels[] = array('level'=>1,'layoutAlgorithm'=>'sliceAndDice', 'dataLabels'=>$dataLabels);

        $gaficas =  array();
        $cuantacolor =0;
        foreach ($facetas as  $faceta) {
            $data = array();
            foreach ($faceta['facetaArray'] as $facetaCotador) {
                if (isset($facetaCotador['subFacetas'])){
                    $id =$facetaCotador['title'];
                    $id= str_replace(" ", "_",$id);
                    $data[] = array('name'=>$facetaCotador['title'], 'id'=>$id, 'color'=> $colores[$cuantacolor]);
                    foreach ($facetaCotador['subFacetas'] as $subfacetas) {
                        foreach ($subfacetas['facetaArray'] as $subfacetaCotador) {
                            $data[] = array('name'=>$subfacetaCotador['title'], 'value'=>intval($subfacetaCotador['count']), 'parent'=> $id);
                        }
                    }
                } else  {
                     $data[] = array('name'=>$facetaCotador['title'], 'value'=>intval($facetaCotador['count']), 'color'=> $colores[$cuantacolor]);
                }
            }
            if ($cuantacolor==3){
                $cuantacolor=0; 
            } else {
                $cuantacolor++;
            }
            $series = array();
            $series[]= array('type'=> 'treemap','layoutAlgorithm' =>'stripes','alternateStartingDirection'=> true,'levels'=> $levels,'data'=>$data);
            $title = array('text'=>$faceta['title']);
            $script = array('series'=>$series, 'title'=>$title );
            $id = "grafico" . $faceta['title'];
            $id= str_replace(" ", "_",$id);
            $gaficas[] = array('titulo' => $faceta['title'], "id" =>$id,'script'=> $script );
        }
       return $gaficas;
    }

}
