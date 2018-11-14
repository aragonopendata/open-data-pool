<?php

namespace WebBundle\Controller\Utility;
use Symfony\Component\Yaml\Yaml;
use WebBundle\Controller\Utility\Trazas;
//Clase que se encarga de trasformar los parámetros de entrada get desde el objeto configuración en 
//arrays de datos para la vitas del detalle, condicionada por el archivo yammer, correspondiente al tipo
// que estamos visualizando.
//Es decir: La clase recive la configuración yammer y los valores de virtuoso y devuelve un array con todos los valores a publicar el el proceso
//de parseo a HTML por la plantilla Twig.

class ParseaDetalle{
 
    /**
    * Objeto que accede a virtuoso, también realiza trasformaciones de parámetros a query sparql
    * instacia del la clase acceso
    */
    protected $virtuoso;

    /**
     * sujeto de la triple uri principal 
     */
    protected $url;

     /**
     * Objeto que contiene la configuración yammer almacenada en la BD
     * Intacia de la clese repositorio WebConfig
     */
    protected $configuracion;

    /**
     * Array contodas la triples que devuelve el servicio de consulta Rdf, dado la url.
     */
    protected $triples;

    /**
     * Directorio pricipal relativo
    */
    protected $directoryPath;
  

    /**
    * Objeto de salida Array con todos los valores a mostrar en la ficha
    */
    protected $parametrosWeb;


    //clase de trazas
    protected $trazas=null;

   
    /**
     * 
     *  Constructor que receive:
     *  $virtuoso: objeto de acceso a virtuoso
     *  $url: la url principal sujeto de la entidad a mostrar
     *  $directoryPath: directorio relativo principal
     *  $configuraciones: el objeto con las configuración para el tipo a mostrar (yammer)
    */
    public function __construct($virtuoso, $url, $directoryPath, $configuracion) {
      $this->virtuoso = $virtuoso;
      $this->url = $url;
	  syslog ( LOG_WARNING , 'La url que llega ParseaDetalle es: '.$url );
      $this->directoryPath = $directoryPath;
      foreach ($configuracion as $key => $value) {
        $this->configuracion=$configuracion[$key];
      }
      $this->trazas = new Trazas($directoryPath);
      $this->trazas->setClase("ParseaDetalle");
      $this->trazas->LineaDebug("__construct","Entro función");
    }
    
    /**
     * Función que realiza el proceso principal de la clase:
     * Recoge los datos de la entidad
     * Prepara los Array salida de datos web según la plantilla Yammer. 
     */
    public function Procesa(){
        $this->trazas->LineaDebug("Procesa","Entro función");
        //recopio las triples de la entidad
        $this->trazas->LineaDebug("Procesa","Recopio las triples de la entidad");
        $this->triples = $this->virtuoso->DameRdf($this->url);
        $this->trazas->LineaDebug("Procesa","Busco el valor rdftype en las triples dado verbo y predicado");
        //busco el valor rdftype en las triples dado verbo y predicado
        $rdfType = $this->DameValorPO("http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/org#");
 
        
        $PanelCentral = array();
        //si jay titulo en la configuracion
        $this->trazas->LineaDebug("Procesa","Si jay titulo en la configuracion");
        if (isset($this->configuracion['PanelCentral']['Titulo'])) {
            //recojo el valor    
            $PanelCentral['Titulo'] =  $this->DameValorP($this->configuracion['PanelCentral']['Titulo']);
            $this->trazas->LineaDebug("Procesa","Recojo el valor: ".  $PanelCentral['Titulo'] );
        }
        if (isset($this->configuracion['PanelCentral']['Votos'])) {
            $PanelCentral['Votos'] = "0";
            $campo = $this->configuracion['PanelCentral']['Votos']['Campo'];
            $query=$this->configuracion['PanelCentral']['Votos']['Query'];
            $query= $this->DameQuery($campo, $query);
            $triples = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
            if (count($triples)>0) {
                foreach ($triples[0] as $key => $value) {
                    $PanelCentral['Votos'] = $value;
                }
            } 
        }

        $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel central un mapa");
        //si la configuracion tiene en el panel central un mapa
        if (isset($this->configuracion['PanelCentral']['Mapa'])) {          
            //recojo el tipo de mapa
            $tipo = $this->configuracion['PanelCentral']['Mapa']['Tipo'];
            $this->trazas->LineaDebug("Procesa","Recojo el tipo de mapa:" . $tipo);
            //si es un mapa tipo idearagon
            if ( $tipo =="idearagon") {
                $this->trazas->LineaDebug("Procesa","Si es un mapa tipo idearagon");
                //recojo el identificado
                $identifier = $this->DameValorP($this->configuracion['PanelCentral']['Mapa']['Campo']); 
                $this->trazas->LineaDebug("Procesa","recojo el identificador: ". $identifier); 
                if (!empty($identifier)){
                    if (strlen($identifier)>5) {
                        $identifier = substr($identifier, 0, 5);
                    }
                    //parseo la url extrena     
                    $url = sprintf($this->configuracion['PanelCentral']['Mapa']['Valor'], $identifier );
                    $this->trazas->LineaDebug("Procesa","parseo la url extrena  ".  $url);
                    $textodebajomapa = "";
                    //pongo la url como valor del como mapa 
                    $PanelCentral['Mapa'] = array('url' => $url, "Tipo"=>'idearagon', 'texto'=>$textodebajomapa);
                }
            } else if ( $tipo=="open") { 
                $this->trazas->LineaDebug("Procesa","Si es un mapa open street");                  
                $query = $this->configuracion['PanelCentral']['Mapa']['Marcadores']['Query'];
                $this->trazas->LineaDebug("Procesa","Recojo la query (plantilla) para el mapa Open" . $query);
                $campo = $this->configuracion['PanelCentral']['Mapa']['Marcadores']['Campo'];
                if (!empty($query) && !empty($campo)) {
                    $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla de mapa". $campo);
                    $query= $this->DameQuery($campo, $query);
                    $marcadores = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
                    $markers = array();
                    //Creo el arrayu de marcasdores
                    //$marcadores = array_slice($marcadores,0,1);
                    if (count($marcadores)>0) {
                        foreach($marcadores as $marcador){
                            $lat= $marcador['lat'];
                            $long=$marcador['long'];
                            $texto=$marcador['title'];
                            $texto = str_replace(".", ". </br>",$texto);
                            $markers[] = array("log"=> floatval($long), 'lat'=>floatval($lat), 'texto'=>$texto);
                        }
            
                        $lat=0;
                        $long=0;
                        $cuanta = 0;
                        foreach ($markers as $marker) {
                            $long+= $marker['log'];
                            $lat+= $marker['lat'];
                            $cuanta++;
                        }
                        $long= $long/ $cuanta;
                        $lat= $lat/$cuanta;
                        $markersjoson = json_encode($markers,JSON_FORCE_OBJECT);
                        $icono = $this->configuracion['PanelCentral']['Mapa']['Marker'];
                        if (empty($icono)) {
                            $icono="markerDefault.png";
                        }
                        $zoom = $this->configuracion['PanelCentral']['Mapa']['Zoom'];
                        if (empty($zoom)) {
                            $zoom= "15";
                        }
                        $PanelCentral['Mapa'] = array("Tipo"=>'open', 'Marcadores'=> $markersjoson,"Longitud" => $long, "Latitud" => $lat, 'Marker'=>$icono,"Zoom"=>$zoom);
                    }
                }
            }   
        }
        //si la configuracion tiene en el panel central un texto
        if (isset($this->configuracion['PanelCentral']['Texto'])) {
            $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel central un texto");
            //recojo el tipo de texto
            $tipo =$this->configuracion['PanelCentral']['Texto']['Tipo'];
            $this->trazas->LineaDebug("Procesa","Recojo el tipo de texto:" .  $tipo);
            $PanelCentral['Texto']['Tipo'] = $tipo;
            //si es un texto proveniente de virtuoso
            if ($tipo=="Virtuoso") {
                $this->trazas->LineaDebug("Procesa","Si es un texto proveniente de virtuoso");
                //si tiene la configuracion necesaria y el valor
               if (isset($this->configuracion['PanelCentral']['Texto']['Query']) && 
                    isset($this->configuracion['PanelCentral']['Texto']['Campo'])) {
                    $campo = $this->configuracion['PanelCentral']['Texto']['Campo'];
                    $query=$this->configuracion['PanelCentral']['Texto']['Query'];
                    $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla de mapa". $campo);
                    $query= $this->DameQuery($campo, $query);
                    $this->trazas->LineaDebug("Procesa",  $query);
                    //lanzo consulta a virtuoso
                    $triples = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
                    //pongo el texto como valor a publicar
                    if (count($triples)>0) {
                        foreach ($triples[0] as $key => $value) {
                            $PanelCentral['Texto']['Valor'] = $value;
                        }
                    } else {
                        $PanelCentral['Texto']['Valor'] = "";
                    }
                }    
              //
               // $this->configuracion['PanelCentral']['Texto']['Tipo']
            } else if ($tipo=="HTML") { 
                if (isset($this->configuracion['PanelCentral']['Texto']['Query']) && 
                isset($this->configuracion['PanelCentral']['Texto']['Campo'])) {
                    $campo = $this->configuracion['PanelCentral']['Texto']['Campo'];
                    $query=$this->configuracion['PanelCentral']['Texto']['Query'];
                    $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla de mapa". $campo);
                    $query= $this->DameQuery($campo, $query);
                    $this->trazas->LineaDebug("Procesa",  $query);
                    //lanzo consulta a virtuoso
                    $triples = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
                    //pongo el texto como valor a publicar
                    if (count($triples)>0) {
                        foreach ($triples[0] as $key => $value) {
                            $html =sprintf($this->configuracion['PanelCentral']['Texto']['Html'],$value);
                            $PanelCentral['Texto']['Valor'] = $html;
                        }
                    } else {
                        $PanelCentral['Texto']['Valor'] = "";
                    } 
                }  else {
                    $PanelCentral['Texto']['Valor']=$this->configuracion['PanelCentral']['Texto']['Html'];
                }    
               //
            } else if ($tipo=="Aragopedia") { 
              //
            }
        }
         //si la configuracion tiene en el panel central tiene bloques campo: valor. 
        if (isset($this->configuracion['PanelCentral']['CampoValores'])){
            $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel central tiene bloques campo: valor. ");
            //Recojo todas la configuraciones (bloques campo valor)
            $PanelCentral['CampoValores'] = array();
            $this->trazas->LineaDebug("Procesa","Recojo todas la configuraciones (bloques campo valor)");
            //por cada bloque
            foreach ($this->configuracion['PanelCentral']['CampoValores'] as $campovalor) {
                $this->trazas->LineaDebug("Procesa","Por cada bloque");
                //si es de tipo virtuoso
                if ($campovalor['Tipo']=='Virtuoso') {
                    $campovalorweb = array(); 
                    $campovalorweb['Oculto'] = $campovalor['Oculto'];
                    if ($campovalorweb['Oculto']) {
                        $campovalorweb['OcultoTexto'] = $campovalor['OcultoTexto'];
                    }
                    //recojo la query (plantilla)
                    $query = $campovalor['Query'];
                    $this->trazas->LineaDebug("Procesa","Recojo la query (plantilla)" . $query);
                    if (isset($campovalor['Campo'])) {
                        $campo = $campovalor['Campo'];
                        $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla". $campo);
                        $query= $this->DameQuery($campo, $query);
                    }
                    $this->trazas->LineaDebug("Procesa","Lanzo la consulta a virtusos y guardo las triples");
                    
                    $triples =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                    //si tiene respuesta
                    if (count($triples)>0) {
                        $this->trazas->LineaDebug("Procesa","Si tiene respuesta");
                        //por cada campo formo informo el nombre del campo el valor y la clase css
                        foreach ($campovalor['Campos'] as $campo){  
                            (isset($campo['Url'])) ? $link = $campo['Url'] : $link=""; 
                            (isset($campo['CampoUrl'])) ? $filedlink = $campo['CampoUrl'] : $filedlink="";             
                            (isset($campo['Class'])) ? $class = $campo['Class'] : $class="";
                            $key = $campo['Valor'];
                            (isset($triples[0][$key]))? $valor = $triples[0][$key] : $valor="";

                            //si existe el campo de parseado tomo el valor correspondiente al campo
                            if (!empty($link) && !empty($filedlink)) {
                              $filedlink = $triples[0][$filedlink];
                              $link = sprintf($link,$filedlink);
                            }

                            if (!empty($valor)) {
                                //si existe el link lo informo si no no
                                if (!empty($link)) {
                                    $campoweb = array("Nombre"=> $campo['Nombre'],
                                                    "Valor"=>$valor,
                                                    "Enlace"=>$link, 
                                                    "Class"=>$class);
                                } else {
                                    $campoweb = array("Nombre"=> $campo['Nombre'],
                                                      "Valor"=>$valor,
                                                      "Class"=>$class);
                                }
                                $this->trazas->LineaDebug("Procesa","Añado el campo al bloque");
                                //añado el campo al bloque
                                $campovalorweb['Campos'][] = array("Campos"=>$campoweb);
                            }
                        }
                    } else {
                        $this->trazas->LineaDebug("Procesa","No tiene respuesta");
                        //si no hay respuesta solo pongo la lista de los campos, sin valores
                        foreach ($campovalor['Campos'] as $campo){                       
                            (isset($campo['Class'])) ? $class = $campo['Class'] : $class="";
                            $valor="";
                            if (!empty($valor)) {
                                $campoweb = array("Nombre"=> $campo['Nombre'],
                                                    "Valor"=>$valor, 
                                                    "Class"=>$class);
                                $this->trazas->LineaDebug("Procesa","Añado el campo al bloque");
                                //añado el campo al bloque
                                $campovalorweb['Campos'][] = array("Campos"=>$campoweb);
                            }
                        }                       
                    }
                    $this->trazas->LineaDebug("Procesa","Si el bloque tiene un pie lo pongo");
                    //si el bloque tiene un pie lo pongo
                    if (isset($campovalor['Pie'])) {
                        $pie = array("Texto"=>$campovalor['Pie']['Texto'],"JavaScript"=>$campovalor['Pie']['JavaScript']);
                        $campovalorweb['Pie'] = $pie;
                    }
                    $this->trazas->LineaDebug("Procesa","Si el bloque tiene un texto lo pongo");
                    ///si el bloque tiene un texto lo pongo
                    if (isset($campovalor['Texto'])) {
                        $texto= $campovalor['Texto'];
                        $campovalorweb['Texto'] = $texto;
                    }           
                } else if ($campovalor['Tipo']=='Api') {
                    $this->trazas->LineaDebug("Procesa","En el caso de que el tipo sea API (es una consulta externa que nos devuelve las parejas campo valor)");
                    //en el caso de que el tipo sea API (es una consulta externa que nos devuelve las parejas campo valor)
                    $campovalorweb = array();  
                    $campovalorweb['Oculto'] = $campovalor['Oculto'];
                    if ($campovalorweb['Oculto']) {
                        $campovalorweb['OcultoTexto'] = $campovalor['OcultoTexto'];
                    }
                    $this->trazas->LineaDebug("Procesa","Recojo la query");
                    //recojo la query
                    $query = $campovalor['Query'];
                    $this->trazas->LineaDebug("Procesa","La query pude venir paeseada por un valor");
                    //la query pude venir paeseada por un valor
                    if (isset($campovalor['Campo'])) {
                        $this->trazas->LineaDebug("Procesa","Si exite el valor ");
                        //si exite el valor 
                        $campo = $campovalor['Campo'];
                        $this->trazas->LineaDebug("Procesa","Creo la query el valor a parsear es el sujeto principal");
                        $query= $this->DameQuery($campo, $query);
                    }
                    $this->trazas->LineaDebug("Procesa","Lanzo la consulta a virtusos para preguntar por la url externa");
                    //lanzo la consulta a virtusos para preguntar por la url externa
                    $triples =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                    $valores="";
                    if (count($triples)>0) {
                        foreach ($triples[0] as $key => $value) {
                            //pod cada resultado pregunto por http get
                            $valores = $this->LanzaConsulta($value);
                        } 
                    }
                    $this->trazas->LineaDebug("Procesa","Si hay valores");
                    //si hay valores
                    if (!empty($valores)) {
                        $this->trazas->LineaDebug("Procesa","Trasformo el resultado en un json");
                        //trasformo el resultado en un json
                        $valoreJson =  json_decode($valores, true);
                        if (count($valoreJson)>0){
                            $valoresArray = array();
                            $i=0;
                            $this->trazas->LineaDebug("Procesa","Creo un array ccon los datos");
                            //creo un array ccon los datos
                            foreach ($valoreJson[0] as $key) {
                                $valoresArray[$key] = $valoreJson[1][$i];
                                $i++;
                            }
                            $this->trazas->LineaDebug("Procesa","Por cada campo de la configuracion yammer");
                            //Por cada campo de la configuracion yammer
                            foreach ($campovalor['Campos'] as $campo){  
                                $this->trazas->LineaDebug("Procesa","Informo con el valor que coincide por key "); 
                                //informo con el valor que coincide por key                    
                                (isset($campo['Class'])) ? $class = $campo['Class'] : $class="";
                                $key = $campo['Valor'];
                                (isset($valoresArray[$key]))? $valor = $valoresArray[$key] : $valor="";
                                (isset($campo['Url'])) ? $link = $campo['Url'] : $link=""; 
                                (isset($campo['CampoUrl'])) ? $filedlink = $campo['CampoUrl'] : $filedlink="";

                                //si existe el campo de parseado tomo el valor correspondiente al campo
                                if (!empty($link) && !empty($filedlink)) {
                                   if (count($triples)>0) {
                                      $filedlink = $triples[0][$filedlink];
                                      $link = sprintf($link,$filedlink);
                                   }
                                }

                                $this->trazas->LineaDebug("Procesa","Preparo el capo valor estilo");
                                //preparo el capo valor estilo
                                if (!empty($valor)) {
                                       //si existe el link lo informo si no no
                                        if (!empty($link)) {
                                            $campoweb = array("Nombre"=> $campo['Nombre'],
                                                            "Valor"=>$valor,
                                                            "Enlace"=>$link, 
                                                            "Class"=>$class);
                                        } else {
                                            $campoweb = array("Nombre"=> $campo['Nombre'],
                                                            "Valor"=>$valor,
                                                            "Class"=>$class);
                                        }
                                        $this->trazas->LineaDebug("Procesa","Añado el campo al bloque");
                                        //añado el campo al bloque
                                        $campovalorweb['Campos'][] = array("Campos"=>$campoweb);
                                }
                            }
                        }
                    } else {
                        $this->trazas->LineaDebug("Procesa","Si no hay valores, pogo el bloque solo conlos titulos, sin valores");
                        //si no hay valores, pogo el bloque solo conlos titulos, sin valores
                        foreach ($campovalor['Campos'] as $campo){                       
                            (isset($campo['Class'])) ? $class = $campo['Class'] : $class="";
                            $valor="";
                            $campoweb = array("Nombre"=> $campo['Nombre'],
                                                "Valor"=>$valor, 
                                                "Class"=>$class);
                            $campovalorweb['Campos'][] = array("Campos"=>$campoweb);
                        }        
                    }
                } else if ($campovalor['Tipo']=='ProgresSQL') {

                }
                $this->trazas->LineaDebug("Procesa","Añado el bloque, al panel central");
                //añado el bloque, al panel central
                if (isset($campovalorweb['Campos'])) {
                     $PanelCentral['CampoValores'][] = array("CampoValor"=>$campovalorweb);
                } 
            }
        }
        $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel central tiene bloques tipo tabla");
        //si la configuracion tiene en el panel central tiene bloques tipo tabla
        if (isset($this->configuracion['PanelCentral']['Tablas'])){
            //preparo el array  
            $PanelCentral['Tablas'] = array();
            $this->trazas->LineaDebug("Procesa","Preparo el array");
            //por cada bloque = tabla
            foreach ($this->configuracion['PanelCentral']['Tablas'] as $tabla) {
                $this->trazas->LineaDebug("Procesa","Por cada bloque = tabla");
                //pregunto por el tipo
                if ($tabla['Tipo']=='Virtuoso') {
                    $valorError = "";
                    //recojo la query (plantilla) de la tabla
                    $query = $tabla['Query'];
                    $this->trazas->LineaDebug("Procesa","Recojo la query (plantilla) de la tabla:". $query);
                    //si tiene campo a parsar
                    if (isset($tabla['Campo'])) {
                        //recojo el campo
                        $campo = $tabla['Campo'];
                        $this->trazas->LineaDebug("Procesa","Recojo el campo: " . $campo);
                        $query= $this->DameQuery($campo, $query);
                    }
                    $this->trazas->LineaDebug("Procesa","Pregunto a virtuoso y recojo las triples");
                    //pregunto a virtuoso y recojo las triples
                    $triples =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");                  
                    //si el bloque tiene titulo lo recojo
                    (isset($tabla['Titulo'])) ?  $titulo = $tabla['Titulo'] : $titulo="";
                    $this->trazas->LineaDebug("Procesa","Si el bloque tiene titulo lo recojo:".  $titulo);
                    //si el bloque tiene descripción lo recojo
                    (isset($tabla['Descripcion'])) ?  $descripcion = $tabla['Descripcion'] : $descripcion="";
                    $this->trazas->LineaDebug("Procesa","Si el bloque tiene descripción lo recojo". $descripcion );
                    //publico el titulo y ela descripcion a para la web
                    $tablaweb = array('Titulo' => $titulo , 'Descripcion' => $descripcion);
                    $tablaweb['Columnas'] = array();
                    //ahora voy por la tabla y comienzo por cada columna (encabezados)
                    foreach ($tabla['Columnas'] as $columna) {
                         $this->trazas->LineaDebug("Procesa","Porcada columna");
                         //si la columa tiene estilo css lo recojo
                         (isset($columna['ClassTitulo'])) ? $classTitulo= $columna['ClassTitulo'] : $classTitulo="";
                         $this->trazas->LineaDebug("Procesa","Si la columa tiene estilo css lo recojo:". $classTitulo);
                         //publico las columnas (encabezado), con su sestilos si los tiene
                         $tablaweb['Columnas'][$columna['Nombre']] = array("ClaseTitulo"=>$classTitulo, "Titulo"=>$columna['Nombre']);
                    } 
                    $this->trazas->LineaDebug("Procesa","ahora voy por las filas");
                    //ahora voy por las filas   
                    $tablaweb['Filas'] = array();
                    $this->trazas->LineaDebug("Procesa","");
                    //recorro todas la triples para buscar Cada array triples tiene los campos dentro,e s decir cada tripleS tiene los campos en triple
                    foreach ($triples as $triple) {
                        $fila = array(); 

                        $this->trazas->LineaDebug("Procesa","Recorro todas la triples para buscar Cada array triples tiene los campos dentro,e s decir cada tripleS tiene los campos en triple");
                        //recorro las triples donde la key es el nombre del encabezado
                        foreach ($triple as $key => $value) {
                            $link ="";
                            foreach ($tabla['Columnas'] as $columna) {
                                if ($columna['Valor']===$key) {
                                    //si tiene estilo el valor lo recojo
                                    (isset($columna['ClassValor'])) ? $classvalor= $columna['ClassValor'] : $classvalor="";
                                    $this->trazas->LineaDebug("Procesa","Si tiene estilo el valor lo recojo:" . $classvalor);

                                    (isset($columna['Url'])) ? $link = $columna['Url'] : $link=""; 
                                    $this->trazas->LineaDebug("Procesa","Si tiene enlace el valor lo recojo:" . $link);
                                    (isset($columna['CampoUrl'])) ? $filedlink = $columna['CampoUrl'] : $filedlink="";  
                                    $this->trazas->LineaDebug("Procesa","Si tiene enlace se parsea el valor lo recojo:" . $filedlink);

		                    //si existe el campo de parseado tomo el valor correspondiente al campo
		                     if (!empty($link) && !empty($filedlink)) {
		                        $filedlink = $triple[$filedlink];
		                        $link = sprintf($link,$filedlink);
		                     }
		                     //publico el valor y el estilo
		                     if (!empty($link)) {
		                        $valor = array("Valor"=>$triple[$key],"ClaseValor"=> $classvalor,"Enlace"=> $link);
		                     } else {
		                        $valor = array("Valor"=>$triple[$key],"ClaseValor"=> $classvalor);
		                     }
		                     $this->trazas->LineaDebug("Procesa","publico el valor y el estilo");
		                     //añado a la lista de filas
		                     $fila[] = $valor; 
		                     $this->trazas->LineaDebug("Procesa","Añado a la lista de filas");  
                                }
                            }   
                        }        
                        //añado el conjunto de filas a las filas
                        $this->trazas->LineaDebug("Procesa","Añado el conjunto de filas a las filas"); 
                        $tablaweb['Filas'][] = $fila;
                    }                   
                } else if ($tabla['Tipo']=='Api') {
 
                } else if ($tabla['Tipo']=='ProgresSQL') {
 
                }
                $this->trazas->LineaDebug("Procesa","Añado el bloque al array 'Tablas', un subarray por bloque");
                //añado el bloque al array 'Tablas', un subarray por bloque si hay filas (=datos en la tabla)
                if (count($tablaweb['Filas'])>0) {
                    $PanelCentral['Tablas'][] =  array("Tabla"=> $tablaweb);   
                }
            }
        }
        $this->trazas->LineaDebug("Procesa","Ahora gestiono el panel lateral");
        //Ahora gestiono el panel lateral
        $PanelLateral = array();
        $this->trazas->LineaDebug("Procesa","PanelLateral");
         //si la configuracion tiene en el panel central un texto
         if (isset($this->configuracion['PanelLateral']['Texto'])) {
            $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel central un texto");
            //recojo el tipo de texto
            $tipo =$this->configuracion['PanelLateral']['Texto']['Tipo'];
            $this->trazas->LineaDebug("Procesa","Recojo el tipo de texto:" .  $tipo);
            $PanelLateral['Texto']['Tipo'] = $tipo;
            //si es un texto proveniente de virtuoso
            if ($tipo=="Virtuoso") {
                $this->trazas->LineaDebug("Procesa","Si es un texto proveniente de virtuoso");
                //si tiene la configuracion necesaria y el valor
               if (isset($this->configuracion['PanelLateral']['Texto']['Query']) && 
                    isset($this->configuracion['PanelLateral']['Texto']['Campo'])) {
                    $campo = $this->configuracion['PanelLateral']['Texto']['Campo'];
                    $query=$this->configuracion['PanelLateral']['Texto']['Query'];
                    $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla de mapa". $campo);
                    $query= $this->DameQuery($campo, $query);
                    $this->trazas->LineaDebug("Procesa",  $query);
                    //lanzo consulta a virtuoso
                    $triples = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
                    //pongo el texto como valor a publicar
                    if (count($triples)>0) {
                        foreach ($triples[0] as $key => $value) {
                            $PanelLateral['Texto']['Valor'] = $value;
                        }
                    } else {
                        $PanelLateral['Texto']['Valor'] = "";
                    }
                }    
              //
               // $this->configuracion['PanelLateral']['Texto']['Tipo']
            } else if ($tipo=="HTML") { 
                if (isset($this->configuracion['PanelLateral']['Texto']['Query']) && 
                    isset($this->configuracion['PanelLateral']['Texto']['Campo'])) {
                        $campo = $this->configuracion['PanelLateral']['Texto']['Campo'];
                        $query=$this->configuracion['PanelLateral']['Texto']['Query'];
                        $this->trazas->LineaDebug("Procesa","Recojo el campo para parsear en la plantilla de mapa". $campo);
                        $query= $this->DameQuery($campo, $query);
                        $this->trazas->LineaDebug("Procesa",  $query);
                        //lanzo consulta a virtuoso
                        $triples = $this->virtuoso->DameConsultaWeb($query,"SUJETOS"); 
                        //pongo el texto como valor a publicar
                        if (count($triples)>0) {
                            foreach ($triples[0] as $key => $value) {
                                $html =sprintf($this->configuracion['PanelLateral']['Texto']['Html'],$value);
                                $PanelLateral['Texto']['Valor'] = $html;
                            }
                        } else {
                            $PanelLateral['Texto']['Valor'] = "";
                        }
                }  else {
                    $PanelLateral['Texto']['Valor']=$this->configuracion['PanelLateral']['Texto']['Html'];
                }      
            } else if ($tipo=="Aragopedia") { 
              //
            }
        }
        //si la configuracion tiene en el panel lateral tiene bloques tipo lista de enlaces
        if (isset($this->configuracion['PanelLateral']['ListaEnlaces'])){
            $PanelLateral['ListaEnlaces'] = array();
            $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel lateral tiene bloques tipo lista de enlaces");
            //por cada lista (bloque)
            foreach ($this->configuracion['PanelLateral']['ListaEnlaces'] as $lista) {
                $this->trazas->LineaDebug("Procesa","Por cada Lista (Bloque)");
                //inicializo el bloque con titulo y tipo
                $listaweb  = array('Titulo' => $lista['Titulo'], 'Tipo' => $lista['Tipo']);
                $listaweb['Enlaces'] = array();                
                //busco si se requiere tratamiento de url sin acentos ni 'ñ'
                /*
				$sinAcentosUrl = false;
                if (isset($lista['SinAcentosUrl'])){
                    $sinAcentosUrl=$lista['SinAcentosUrl'];
                }*/
                $this->trazas->LineaDebug("Procesa","Inicializo el bloque con titulo y tipo");
                //por cada enlace
                foreach ($lista['Enlaces'] as $enlace ) {
                    $this->trazas->LineaDebug("Procesa","Porcada Enlace");
                    //recojo el texto
                    (isset($enlace['Texto'])) ?  $texto = $enlace['Texto'] : $texto="";
                    $this->trazas->LineaDebug("Procesa","");
                    //recojo el campo a parsear en el texto
                    (isset($enlace['CampoTexto'])) ?  $campoTexto = $enlace['CampoTexto'] : $campoTexto="";
                    $this->trazas->LineaDebug("Procesa","Recojo el texto:" . $campoTexto );
                    //recojo la url de enlace
                    (isset($enlace['url'])) ?  $url = $enlace['url'] : $url="";
                    $this->trazas->LineaDebug("Procesa","Recojo la url de enlace:" . $url );
                     //recojo el campo a parsear en  la url de enlace
                    (isset($enlace['CampoUrl'])) ? $campoUrl = $enlace['CampoUrl'] : $campoUrl="";
                    $this->trazas->LineaDebug("Procesa","si hay campo a parsear en el texto  lo recojo  y parseo");
					//busco si se requiere tratamiento de url sin acentos ni 'ñ'
					$sinAcentosUrl = null;
					if (isset($enlace['SinAcentosUrl'])){
						$sinAcentosUrl=$enlace['SinAcentosUrl'];
					}
                    //si hay campo a parsear en el texto  lo recojo  y parseo         
                    if(!empty($campoTexto)){
                        $campoTexto = $this->DameValorP($campoTexto);                        
                        $texto = sprintf($texto,$campoTexto);
                    }
                    $this->trazas->LineaDebug("Procesa","Si hay campo a parsear en la url lo recojo y parseo");
                    //si hay campo a parsear en la url lo recojo y parseo
                    if(!empty($campoUrl)){
                        $campoUrl = $this->DameValorP($campoUrl);  
                        if ($sinAcentosUrl) {
                            $campoUrl = $this->DameSinAcentos($campoUrl);
                        }                     
                        $url = sprintf($url,$campoUrl);
                    }
                    $this->trazas->LineaDebug("Procesa","Preparo enlace para web");
                    //preparo enlace para web
                    $enlaceweb = array("Texto"=> $texto, "Url"=>$url);
                    $this->trazas->LineaDebug("Procesa","Lo añado al bloque");
                    //lo añado al bloque
                    $listaweb['Enlaces'][] = $enlaceweb;
                }
                $this->trazas->LineaDebug("Procesa","Si el bloque tiene pie lo añado con su javascrip");
                //si el bloque tiene pie lo añado con su javascrip
                if (isset($lista['Pie'])) {
                    $listaweb['Enlaces']['Pie'] = array('Texto' => $lista['Pie']['Texto'], 'JavaScrip'=> $lista['Pie']['JavaScrip']);
                }
                $this->trazas->LineaDebug("Procesa","Añado la lista de enlaces al bloque");
                //añado la lista de enlaces al bloque
                $PanelLateral['ListaEnlaces'][] = $listaweb;
            }
        } 
        //si la configuracion tiene en el panel lateral tiene bloques tipo lista de Contextos
        if (isset($this->configuracion['PanelLateral']['ListaContextos'])){
            $PanelLateral['ListaContextos'] = array();
            $this->trazas->LineaDebug("Procesa","Si la configuracion tiene en el panel lateral tiene bloques tipo lista de Contextos");
            //por cada lista (bloque)
            foreach ($this->configuracion['PanelLateral']['ListaContextos'] as $lista) {
                $this->trazas->LineaDebug("Procesa","Por cada Lista (Bloque)");
                //inicializo el bloque con titulo y tipo
                //primero recojo el valor del parseo (el nombre)
                $titulo="";
                if (isset($lista['CampoParseo'])){
                    //si tengo que parsear el titulo lo hago
                    $parseo = $this->DameValorP($lista['CampoParseo']['Campo']);
                    $this->trazas->LineaDebug("Procesa",sprintf("Campo parseado: %s -> %s",$lista['CampoParseo']['Campo'],$parseo));
                    $query = sprintf($lista['CampoParseo']['Query'], $parseo); 
                    $this->trazas->LineaDebug("Procesa","Pregunto a vistuoso por los resultados dado el parseo");
                    $resultado =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                    if (count($resultado)>0) {        
                        $parseo = $resultado[0]['parseo'];
                        $titulo = sprintf($lista['Titulo'], $parseo); 
                        $this->trazas->LineaDebug("Procesa",sprintf("Hay resultados Titulo: %s ", $titulo));
                    }
                } else {
                    //no tengo que parsear el titulo
                    $titulo = $lista['Titulo'];
                    $this->trazas->LineaDebug("Procesa",sprintf("No tengo que parsear el titulo: %s ", $titulo));
                }
                //creo la lista contexto con su titulo y su tipo he inicilalizo el array de enlaces
                $this->trazas->LineaDebug("Procesa",sprintf("Creo la lista contexto con su titulo %s y su tipo %s he inicilizo el array de enlaces", $titulo,$lista['Tipo']));
                $listaContexto  = array('Titulo' => $titulo, 'Tipo' => $lista['Tipo']);
                $listaContexto['Enlaces'] = array();
                //por cada enlace           
                //recojo la query sparql para recoger los valores de la lista
                $query=$lista['Query'];// select ?ordenanza ?nameDocument where  {?ordenanza <http://opendata.aragon.es/def/ei2a#nameDocument> ?nameDocument . ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. filter(?ordenanzaOriginal = <%s>)}      
                $this->trazas->LineaDebug("Procesa","recojo la query sparql para recoger los valores de la lista: ". $query );
                if ($lista['Campo']=="uri") {
                    //si el valor de campo es uri parseo con sujeto (= query)
                    $query = str_replace("%s",$this->url,$query);
                    $this->trazas->LineaDebug("Procesa","Valor de campo es uri parseo con sujeto: ". $query );
                } else {
                    $this->trazas->LineaDebug("Procesa","Valor de campo no es uri");
                     //si el valor de campo es no es uri parseo con el campo que indica
                    $parseolistado = $this->DameValorP($lista['Campo']);
                    $this->trazas->LineaDebug("Procesa",sprintf("Campo parseado para la lista: %s -> %s",$lista['Campo'],$parseolistado));
                    $query = str_replace("%s",$parseolistado, $query);
                    $this->trazas->LineaDebug("Procesa",sprintf("Query resultante %s", $query ));
                }
                $this->trazas->LineaDebug("Procesa","Pregunro a virtuoso por el listado de enlaces");
                $valoreslistado =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                foreach ($valoreslistado as $valores) {
                    //hay resultados, el primero es el padre y le quito el enlace
                    $url ="#";
                    $urlsp = explode("#",$valores['url']);
                    if (count($urlsp)==2){
                        //prepar los enlaces de los hijos
                        $url = sprintf("detalles?url=%s",$urlsp[1]);
                    }
                    $this->trazas->LineaDebug("Procesa",sprintf("Añado enlace Nombre %s, Link; %s",$valores['name'], $url ));
                    $listaContexto['Enlaces'][] = array('Url' => $url,'Texto' => $valores['name']); 
                }
                //ahora voy por los enlaces de los botones ver vas que también tienen su parseo
                $this->trazas->LineaDebug("Procesa",sprintf("Voy por los enlaces de los botones 'ver más' que también tienen su parseo"));
                $titulo="";
                if (isset($lista['EnlaceVerMas'])){
                    //hay elemeto vermas
                    $urlenlace="";
                    if (isset($lista['EnlaceVerMas']['CampoParseo'])){
                        //hay parseo para ver mas
                        $parseo = $lista['EnlaceVerMas']['CampoParseo']['Campo'];
                        $query =  $lista['EnlaceVerMas']['CampoParseo']['Query'];
                        if ($parseo=="uri") {
                            $query = str_replace("%s",$this->url,$query);
                            $this->trazas->LineaDebug("Procesa","Valor de campo 'ver mas' es uri parseo con sujeto: ". $query );
                        } else {
                            $parseolistado = $this->DameValorP($parseo);
                            $this->trazas->LineaDebug("Procesa",sprintf("Valor de campo 'ver mas' no es uri. Parseo con campo: %s -> %s",$parseo,$parseolistado));
                            $query = str_replace("%s",$parseolistado,$query);
                            $this->trazas->LineaDebug("Procesa",sprintf("Query resultante %s", $query ));
                        }
                        $this->trazas->LineaDebug("Procesa","Pregunro a virtuoso por el enlace ver más");
                        $resultado =  $this->virtuoso->DameConsultaWeb($query,"SUJETOS");
                        if (count($resultado)>0) {
                            $parseo = "=".$resultado[0]['parseo'];
                            //remplazo =%s por expresion ='sujeto a navegar'
                            $urlenlace =  str_replace("=%s",$parseo, $lista['EnlaceVerMas']['url']); 
                            $this->trazas->LineaDebug("Procesa",sprintf("Boton vermas url; %s", $urlenlace));
                        }
                        
                    }
                    $listaContexto['EnlaceVerMas'] = array('Texto' => $lista['EnlaceVerMas']['Texto'], 'Url'=>$urlenlace);
                }
                $PanelLateral['ListaContextos'][] = $listaContexto;
            }
        }
        $this->trazas->LineaDebug("Procesa","Añado el bloque al conjunto de bloques del panel lateral");
        //añado el bloque al conjunto de bloquesdel panel lateral
        $ParametrosWeb = array('PanelCentral' => $PanelCentral,'PanelLateral'=>  $PanelLateral);
        $this->trazas->LineaDebug("Procesa","Salgo función");
        return   $ParametrosWeb;
    }

    /**
     * Funcion que quita los acentos las ñ por n y los espacios por -
     */
    function DameSinAcentos($campoUrl){
        $campoUrlSinAcentos = strtolower($campoUrl);
        $campoUrlSinAcentos = str_replace(" ", "-", $campoUrlSinAcentos );
        $charset='UTF-8'; 
        $campoUrlSinAcentos = iconv($charset, 'ASCII//TRANSLIT', $campoUrlSinAcentos);
        return $campoUrlSinAcentos;
    }

    /**
     * Funcion que dado un nombre de campo y una query a paresear devbuelve la query motada para virtuso
     * La funcion se extrae por repetición 
     * Si el campo en uri, se toma el sujeto de la entiodad , si es ditinyo de uri se busca el valor 
     */
    function DameQuery($campo, $query){
        if ($campo=="uri"){
            $query = str_replace("%s",$this->url, $query);
            $this->trazas->LineaDebug("DameQuery","Creo la query el valor a parsear es el sujeto principal: " . $query );
        } else {
            $campo = $this->DameValorP($campo);
            $this->trazas->LineaDebug("DameQuery","El valor a parsear viene de las triples ya que es un campo en concreto: ".  $campo);
            $this->trazas->LineaDebug("DameQuery","");
            //creo la query
            $query = str_replace("%s",$campo,$query);
            $this->trazas->LineaDebug("DameQuery","Creo la query el valor a parsear es el sujeto principal: " . $query );
        }
        return  $query;
    }
    /**
     * Fucion que devuelve un valor buscado en las triples por predicado quitando una expresion
     * pasada como parametro se utiliza para extraer el $rdfType
     */
    function DameValorPO($p, $o){
        $this->trazas->LineaDebug("DameValorPO","Entro función");
        $valor = "";
        foreach ($this->triples as  $triple) {
            //si el predicado cooincide y la exprsion $o es el comienzo
            if (($triple['p']==$p) &&
                (strpos($triple['o'],$o)==0)) {
                    $valor = str_replace($o,"",$triple['o']);
                    break;
             }
        }
        $this->trazas->LineaDebug("DameValorPO","Salgo función valor:" . $valor);
        return strtolower($valor);
    }

    /**
     * Fucion que devuelve un valor buscado en las triples por predicado 
     */
    function DameValorP($p){
        $this->trazas->LineaDebug("DameValorP","Entro función");
        $valor = "";
        foreach ($this->triples as  $triple) {
            if ($triple['p']==$p) {
               $valor = $triple['o'];
               break;
            }
        }
        $this->trazas->LineaDebug("DameValorP","Salgo función valor:" . $valor);
        return $valor;
    }
    
    
    /**
     * Funcion que lanza una consulta a una url extrena y devuelve en formato texto el resultado
     */
    function LanzaConsulta($url)
    {   $this->trazas->LineaDebug("LanzaConsulta","Entro función");
        $datos="";
		$data = array('timeout' => 0,
					  'format' => 'xml/json');
		// use key 'http' even if you send the request to https://...
		$options = array(
			'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
				'method'  => 'GET',
				'encoding' => 'UTF8',
				'content' => http_build_query($data)
			)
		);
        $context  = stream_context_create($options);
        $this->trazas->LineaDebug("LanzaConsulta", sprintf("SPARQL>>>: %s", $url));
        $result = @file_get_contents($url, false, $context);
        if ($result === FALSE) { 
			$this->error400 = "Se a producido un error en la carga";
			$this->trazas->LineaError("LanzaConsulta",trim($this->error400));
			$this->error = true;
		} else {
            $this->trazas->LineaDebug("LanzaConsulta", sprintf("Se ha realizado la consulta correctamente"));
            $datos= $result;
        } 
        $this->trazas->LineaDebug("LanzaConsulta","Salgo función");
	    return  $datos;
    }
 
}
