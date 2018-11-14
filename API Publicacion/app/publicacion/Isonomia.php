<?php

require_once("Triple.php");
require_once("Trazas.php");

/**
 * Clase que realiza las tareas de procesar el esquema isonomico a una expresion parseble por spritf
 * La clase realiza las siguientes taras:
 *  1- lee y carga el esquema isonomico dado un ID
 *  2 - Trasforma CADA nodo en una triple con sujeto, verbo y preficado, de manera que
 * 		cada variable tine una expresion parseable por sprintf a la espera de los capos del CVS
 *  3.- Realioza una gestion m,anual de los name spaces ya que php solo maneja el primer xmlns
 */
class Isonomia
{
	
	/**
    * Identificador de la triple
	*/
	protected $id;

    /**
	 * Objeto de log
 	 */
	protected $traza;

	/**
	* Get idEsquema
	*
	*/
	public function getId()
	{
		return $this->id;
	}

    /**
	* Get idEsquema
	*/
	 public function setId()
	{
		return $this->id;
	}

	/**
	* Get Traza
	*
	*/
	public function getTrazas()
	{
		return $this->trazas;
	}

	/** 
	 * Costructor con identificador de esquema isonomico e inicilizacion del objeto de trazas
	*/
    public function __construct($id,$trazas) {
		$this->id = $id;
		$this->trazas = $trazas;
		$this->trazas->setClase("Isonomia");
		$this->trazas->LineaInfo("__construct", "Inicializa el costructor");  
    }

	/** 
	 * Funcion principal que carga el esquema y lo procesa
	 * Devuelve unn array de elementos Triple perparado para parsear
	*/
	function ProcesaEsquema()
    {   
		//Inicliza variables
		$pilaTriples = array();
		$sujeto = "";
		$sujetoParseo = "";
		$xml = "";
		//carga esquema TEXTO isonomico por ID
		$isonomia = $this->DameIsonomia($this->id);
		$this->trazas->LineaInfo("ProcesaEsquema",'Isonomia cargada con Identificador:' . $this->id);
		//carga en un DOM xml el texto
		try 
		{
			 $xml = simplexml_load_string($isonomia);
			 $this->trazas->LineaInfo("ProcesaEsquema",'Isonomia validada por simplexml');
		} catch (Exception $e) {
			 $this->trazas->LineaError("ProcesaEsquema",'Excepción capturada: ',  $e->getMessage());
		} 
		if ($this->trazas->SinError()) {
			//carga manual de los namespaces en un array (prefijo=>valor http//...)
			$this->trazas->LineaInfo("ProcesaEsquema",'Carga manual de los namespaces');
			$nameSpaces = $this->DameNameSpaces($xml->asXML());
		}

		if ($this->trazas->SinError()) {
			//llamada a la funcion reursiva por todos los nodos y subnodos
			$this->trazas->LineaInfo("ProcesaEsquema",'Llamada a la funcion reursiva por todos los nodos y subnodos');
			$this->ProcesaEntity($xml, $sujeto, $sujetoParseo, $pilaTriples,$nameSpaces);
		
			//devuelve la pila de triples preparda para parsear con sprintf
			return $pilaTriples;   
		}
	}
	/**
	 * Funcion que dado un Id devielve el texto de la esquema isonimico
	 */
	function DameIsonomia($id){
		$isonomia = "";
		$nombreFichero = "/var/www/AodPool/src/AppBundle/Command/taxonomia.xml";
		if (file_exists($nombreFichero)) {
			 $isonomia = file_get_contents($nombreFichero);
		}
		return $isonomia;
	}
	
	/**
	 * Funcion recursiva que pasa por todos los nodos y subnodos del esquema
	 * Parametros :
	 * $entity: Nodo a tratar
	 * $sujeto, $sujetoParseo: se pasa porque es el mismo para tdos los subnodos primer nivel de un nodo dado
	 * &$PilaTriples: Contenedor de Triples por refrencia para que cargue todas las triples en el la misma pila
	 * &$nameSpaces: Manejador de Namespaces por refencia simple es el mismo
	 */
	function ProcesaEntity($entity, $sujeto, $sujetoParseo, &$PilaTriples, &$nameSpaces){
		//por cada uno de los subnosdos del nodo principal
		$this->trazas->LineaInfo("ProcesaEntity",sprintf('Entra en Entity del nodo %s', $entity->getName()));
		foreach ($entity->children() as $node) {
		    $this->trazas->LineaInfo("ProcesaEntity",sprintf('Entra en sunbnodo %s => %s',$entity->getName(),$node->getName()));
		    //inicializo
		    $verbo="";
		    $verboParseo="";
		    $predicado="";
		    $predicadoParseo=""; 
		    //dependiendo del nombre del elemento manejo de una u otra manera los las tres variables: 
		    //sujeto verbo predicado
			switch((string) $node->getName()) { // Obtener los atributos como índices del elemento
			    case 'Entity':  
				   //cojo el name space del Nodo
				   $ns =  $this->DameNameSpace($node->asXML()); 
				   if ($this->trazas->SinError()) 
				   {
					    //informo el sujeto
						$sujeto = trim($node['URI']);
					    //informo porque valor he de parsear
					    $sujetoParseo = $this->DameParseo($sujeto);
					    //remplazo por %s para dprintf
					    $sujeto=str_replace('{'.$sujetoParseo.'}',"%s",$sujeto);
					    //pongo los tag de nodo
					    $sujeto = sprintf("<%s>",$sujeto);
					    $verbo = array_search($ns[0],$nameSpaces);
					    //pongo los tag de nodo
					    $verbo = sprintf("<%s>",$verbo);
					    //informo el predicado
					    $predicado =array_search($ns[1][0],$nameSpaces) . $ns[1][1];
					    //pongo las comillas al predicado
					    $predicado = sprintf("\"%s\"",$predicado);
				    }
				break;
			    case 'Property':
			        //tres posibilidades field fieldLink y link
					if (isset($node['field']))
					{
					   $this->trazas->LineaInfo("ProcesaEntity",sprintf('Nodo tipo field: %s ',$node['field']->asXML()));
					   //cargo el atributo para coger el nameespace y ponerlo en el verbo
					   $ns= explode(":",$node['attribute']);
					   if (count($ns)==2) 
					   {
						    $verbo = array_search($ns[0],$nameSpaces) . $ns[1];
						    //pongo los tag de nodo dependiendo de si es string o no
						    $verbo = sprintf("<%s>",$verbo);
						    //el predicado vien en el CSV
						    if ($node['type']=="string") 
						    {
						       $predicado = "\"%s\"";
						    } else {
						       $predicado = "%s";
						    }
						    //cargo el campo por el que he de parsear
						    $predicadoParseo = str_replace("\"", "", explode("=",$node['field']->asXML())[1]);
					    } else {
						    $this->trazas->LineaError("ProcesaEntity", "No devueve un array de dos valores:". $node['attribute']->asXML());
					    }
					} else if (isset($node['fieldLink'])) 
					{
						$this->trazas->LineaInfo("ProcesaEntity",sprintf('Nodo tipo fieldLink: %s ',$node['fieldLink']->asXML()));
					    //cargo el namespace para el verbo
					    $ns =  explode(":",$node['attribute']);
					    if (count($ns)==2) 
					    {
						   $verbo =  array_search($ns[0],$nameSpaces) . $ns[1];
						   //pongo los tag de nodo
						   $verbo = sprintf("<%s>",$verbo);
					   } else {
						   $this->trazas->LineaError("ProcesaEntity", "No devueve un array de dos valores:". $node['attribute']->asXML());  
					   }
					   if ($this->trazas->SinError()) 
					   {
					      //cargo el namespace para el predicado
						  
							 $predicado = $node['fieldLink'];
							 $predicadoParseo =  $this->DameParseo($predicado);
							 $predicado=str_replace('{'.$predicadoParseo.'}',"%s",$predicado);
							 //pongo los tag de nodo
							 $predicado = sprintf("<%s>",$predicado);
					   }
				   } else if (isset($node['link'])){ 
					   $this->trazas->LineaInfo("ProcesaEntity",sprintf('Nodo tipo link: %s ',$node['link']->asXML()));
					   //cargo el namespace para el verbo
					   $ns =  explode(":",$node['attribute']);
					   if (count($ns)==2) 
					   {
						   $verbo =  array_search($ns[0],$nameSpaces) . $ns[1];
						    //pongo los tag de nodo
						   $verbo = sprintf("<%s>",$verbo);
						   //cargo el namespace para el predicado
						   $ns =  explode(":",$node['link']);
						   if (count($ns)==2) 
						   {
						       $predicado = array_search($ns[0],$nameSpaces) . $ns[1];
					           //pongo los tag de nodo
							   $predicado = sprintf("<%s>",$predicado);
					       } else {
						       $this->trazas->LineaError("ProcesaEntity", "No devueve un array de dos valores:". $node['attribute']->asXML());  
						   }
					    }
				    } 
			    break;
			}
			if ($this->trazas->SinError()) 
			{
				$this->trazas->LineaInfo("ProcesaEntity",sprintf('Subnodo procesado: S: [%s=>%s] V:[%s=>%s] P:[%s=>%s]',
														$sujeto,$sujetoParseo,$verbo,$verboParseo,$predicado,$predicadoParseo));
				// Creo un objeto Triples iniclizando con las trazas
				$esquemaTriple = new Triple($this->trazas);
				//Informo el objeto triple
				$esquemaTriple->InformaEsquema($sujeto,$sujetoParseo,$verbo,$verboParseo,$predicado,$predicadoParseo);
				//cargo el objeto en la pila de triples
				$PilaTriples[]=$esquemaTriple;
				//llamo recursivamente hasta compoletar todos los subnodos
				$this->ProcesaEntity($node, $sujeto,$sujetoParseo, $PilaTriples,$nameSpaces);
			}
		}
	}

    /**
	 * Dado un literal encuenta todas las expresiones {algo}
	 * Se utiliza para sacar los nombres de los campos por los que he de parsear
	 */
	function DameParseo($literal)
	{
		preg_match('~{(.*?)}~', $literal, $output);
		if (count($output)==2)
		   return $output[1];
		else {
			$this->trazas->LineaError("DameParseo", "No devueve un array de dos valores proviniente de procesaEntity :". $literal);
			return null;
		} 
	}

	 /**
	 * Dado un literal encuenta todas las expresiones de  definicon del nameespaces del XML
	 * Devuelve un array ("prefijo" => namespace)
	 */
	function DameNameSpaces($literal)
	{
		$Items = array();
		try
		{
			preg_match_all('~xmlns:(.*?)="(.*?)"~', $literal, $output);
			if (count($output)>0) {
				$space = $output[0];
				$cuenta = count($space);
				if ($cuenta>0) {
					for($i=0; $i<$cuenta; $i++) {
						$Items[trim($output[2][$i])] =  trim($output[1][$i]);
					}
				}
			} else {
				$this->trazas->LineaError("DameNameSpaces", "No encuentra NameSpaces". $$literal);
			}
	    } catch (Exception $e) {
			$this->trazas->LineaError("DameNameSpaces",'Excepción capturada: ',  $e->getMessage());
	    }
		return  $Items; 
	}

	/**
	 * Convierte algo="prefijo:atributo" en un array(prefijo=>atributo)
	 * Se utuliza para sacar los namespaces de field, fieldloink y link
	 */
	function DameNameSpace($literal)
	{
		$Items = array();
		try
		{
			preg_match_all('~ (.*?):type="(.*?)"~', $literal, $output);
		
			if (count($output)>0) {
				$space = trim($output[0][0]);
				$Items = explode("=",$space);
				if (count($Items)==2) {
					$Items[0]= trim(str_replace(":type","",$Items[0]));
					$Items[1]= trim(str_replace("\"","",$Items[1]));
					$Items[1]= explode(":", $Items[1]);
				}
			} 
		} catch (Exception $e) {
			$this->trazas->LineaError("DameNameSpaces",'Excepción capturada: ',  $e->getMessage());
		}
		return  $Items; 
	}
}