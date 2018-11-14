<?php

namespace ApiRest\WorkerBundle\Controller;

use ApiRest\WorkerBundle\Controller\Trazas;
use \Datetime;
use \Math;
/**
* Triple contenedor de triples 
* La clase tiene las funcionalidades: 
*  1 -Almacenar las propiedades de las triples para ser parsedas por los valores
*  2.-Generar las triples parseando por los valores del CSV 
*  3.-Generar las triples sparq para pasarlas a virtuoso
*/
class Triple
{
	/**
	* sujeto de la triple
	*/
	protected $sujeto;

	/**
    * verbo de la triple
	*/
	protected $verbo;

	/**
    * predicado de la triple
	*/
	protected $predicado;

    /**
	* sujeto de la triple
	*/
	protected $sujetoParseo;

	/**
    * verbo de la triple
	*/
	protected $verboParseo;

	/**
    * predicado de la triple
	*/
	protected $predicadoParseo;

	/**
    * predicado tipo de predicado de la triple
	*/
	protected $tipoPredicadoParseo;


    /**
	* valor sujeto de la triple
	*/
	protected $sujetoValor;

	/**
    * valor verbo de la triple
	*/
	protected $verboValor;

	/**
    * valor predicado de la triple
	*/
	protected $predicadoValor;

	/** 
	 * fila del archivo CVS
	*/
	protected $filaCVS; 
	
	/** 
	* tripleValor
	*/
	protected $tripleValor; 

	/** 
	* condition
	*/
	protected $condition; 

	/** 
	* objeto traza
	*/
	protected $trazas; 


	/**
	* Get Traza
	*
	*/
	public function getTrazas()
	{
		return $this->trazas;
	}

	/**
	* Get tripleValor
	*
	*/
	public function getTripleValor()
	{
		return $this->tripleValor;
	}


	/**
	* Get filaCVS
	*
	*/
	public function getFilaCVS()
	{
		return $this->filaCVS;
	}

	/**
    * Set filaCVS
	*/
	public function setFilaCVS($filaCVS)
	{
		$this->filaCVS = $filaCVS;
	}


	/**
	* Get sujeto
	*
	*/
	public function getSujeto()
	{
		return $this->sujeto;
	}


	/**
    * Set sujeto
	*/
	public function setSujeto($sujeto)
	{
		$this->sujeto = $sujeto;
	}


	/**
	* Get sujeto Parseo
	*
	*/
	public function getSujetoParseo()
	{
		return $this->sujetoParseo;
	}

	/**
    * Set sujeto Parseo
	*/
	public function setSujetoParseo($sujetoParseo)
	{
		$this->sujetoParseo = $sujetoParseo;
	}


	/**
	* Get sujeto valor
	*
	*/
	public function getSujetoValor()
	{
		return $this->sujetoValor;
	}

	/**
    * Set sujeto Valor
	*/
	public function setSujetoValor($sujetoValor)
	{
		$this->sujetoValor = $sujetoValor;
	}

    /**
	* Get verbo
	*
	*/
	public function getVerbo()
	{
		return $this->verbo;
	}

	/**
	* Set verbo
	*/
	public function setVerbo($verbo)
	{
		$this->verbo = $verbo;	
    }
	
	
    /**
	* Get verbo Parseo
	*
	*/
	public function getVerboParseo()
	{
		return $this->verboParseo;
	}


	/**
	* Set verbo Parseo
	*/
	public function setVerboParseo($verboParseo)
	{
		$this->verbo = $verboParseo;	
	}
	


	/**
	* Set verbo Valor
	*/
	public function getVerboValor()
	{
		return $this->verboValor;
	}

	/**
	* Set verbo Valor
	*/
	public function setVerboValor($verboValor)
	{
		$this->verboValor = $verboValor;	
	}
	
	/**
	* Get predicado 
	*/
	public function getPredicado()
	{
		return $this->predicado;
	}

	/**
	* Set predicado
	* @param string $predicado
	*/
	public function setPredicado($predicado)
	{
        $this->predicado = $predicado;
    }

	/**
	* Get predicado Parseo
	*/
	public function getPredicadoParseo()
	{
		return $this->predicadoParseo;
	}

	/**
	* Set predicadoParseo
	*/
	public function setPredicadoParseo($predicadoParseo)
	{
        $this->predicadoParseo = $predicadoParseo;
	}
	
	
		
	/**
	* Set predicadoValor
	*/
	public function getPredicadoValor()
	{
        return $this->predicadoValor;
	}


	/**
	* Set predicadoValor
	*/
	public function setPredicadoValor($predicadoValor)
	{
        $this->predicadoValor = $predicadoValor;
	}



	/**
	* Get tipo predicado Parseo
	*/
	public function getTipoPredicadoParseo()
	{
		return $this->tipoPredicadoParseo;
	}

	/**
	* Set tipo predicadoParseo
	*/
	public function setTipoPredicadoParseo($tipoPredicadoParseo)
	{
        $this->tipoPredicadoParseo = $tipoPredicadoParseo;
	}



	/**
	* Get codicion de mostrar no
	*/
	public function getCondition()
	{
		return $this->condition;
	}

	/**
	* Set codicion de mostrar no
	*/
	public function setCondition($condition)
	{
        $this->condition = $condition;
	}

		/**
	* Get donde tipo de nodo
	*/
	public function getTipoNodo()
	{
		return $this->tipoNodo;
	}

	/**
	* Set donde tipo de nodo
	*/
	public function setTipoNodo($tipoNodo)
	{
        $this->tipoNodo = $tipoNodo;
	}

	
	
	/**
	* Constructor con objeto traza como parámetro
	*/
	public function __construct($trazas) {
		$this->trazas = $trazas;
		$this->trazas->setClase("Triple");
		$this->trazas->LineaDebug("__construct", "Inicializa el costructor"); 		 
	}

    /**
     * Función que se utiliza para inicia la estructura de la triple
     * para parsearla posteriormente
	*/
	public function InformaEsquema($sujeto,
	                               $sujetoParseo,
								   $verbo,
								   $verboParseo,
								   $predicado,
								   $predicadoParseo,
								   $tipoPredicadoParseo,
								   $tipoNodo,
								   $condition) {
		$this->trazas->LineaDebug("InformaEsquema", "Informa los datos de la triple");  
		$this->sujeto = $sujeto;
		$this->sujetoParseo = $sujetoParseo;
		$this->verbo = $verbo;
		$this->verboParseo = $verboParseo;
		$this->predicado = $predicado;
		$this->predicadoParseo = $predicadoParseo;
		$this->tipoPredicadoParseo = $tipoPredicadoParseo;
		$this->tipoNodo=$tipoNodo;
		$this->condition = $condition;
	}
	
	public function ProcesaDatos($filaCVS)
	{ 
		$this->sujetoValor ="";
		$this->verboValor ="";
		$this->predicadoValor ="";
		$this->tripleValor = "";

		$this->setFilaCVS($filaCVS);
		//analizo la condicion
        $conditionVerdadera = $this->DameCondicion($this->condition,$filaCVS);
		if ($conditionVerdadera) {
			$this->trazas->LineaDebug("ProcesaDatos", sprintf("Procesa los datos de la triple con la fila CSV: S:%s V:%s P:%s",
																$this->sujeto,$this->verbo,$this->predicado));  
			if (count($this->sujetoParseo)>0) {
				$this->sujetoValor = $this->MultiParseo($this->sujeto,$this->sujetoParseo,"S");
			} else {
				$this->sujetoValor = $this->sujeto;
			}
			if (strlen($this->verboParseo)>0) {
				$this->verboValor = sprintf($this->verbo, trim($filaCVS[$this->verboParseo]));
			} else {
				$this->verboValor = $this->verbo;
			}
			if (count($this->predicadoParseo)>0) {
				$this->predicadoValor = $this->MultiParseo($this->predicado,$this->predicadoParseo,"P");
			} else {
				$this->predicadoValor = $this->predicado;
			}
			if ($this->sujetoValor=="\"\""){
				$this->sujetoValor="";
			}
			if ($this->verboValor=="\"\"") {
				$this->verboValor="";
			}
			if ($this->predicadoValor=="\"\"") {
				$this->predicadoValor="";
			}
			if (!empty($this->sujetoValor) && !empty($this->verboValor) && !empty($this->predicadoValor)) {
				$this->tripleValor = sprintf("%s %s %s .", $this->sujetoValor,$this->verboValor,$this->predicadoValor);
			} else {
				$this->trazas->LineaInfo("ProcesaDatos", sprintf("Alerta: Linea a generado una triple con algún elemento vacío: S:%s V:%s P:%s", 
								$this->sujetoValor,$this->verboValor,$this->predicadoValor));  

			}
	    } else {
			$this->trazas->LineaDebug("ProcesaDatos", sprintf("No Procesa los datos de la triple con la fila CSV: S:%s V:%s P:%s por condition(false)",
																$this->sujeto,$this->verbo,$this->predicado)); 
		}
	}

	private function DameCondicion($condition,$filaCVS){
		$codicion=true;
        //si la expresion condicion no esta vacía
		if (!empty($condition)){
			$valor = $filaCVS[$condition];
			$codicion = filter_var($valor, FILTER_VALIDATE_BOOLEAN);
		}
		return $codicion;
	}

    /**
	 * Función que realiza un parseo multiple, es decir:
	 * dado un "{valo1}-{valor2}", campo1=1 campo2=2 devuelve "1-2"
	 * El parámetro donde se utiliza para:
	 * En el caso del sujeto y verbo donde se quitan espacios y se realiza un urlencode
	 */
	private function MultiParseo($valorIso, $valorParseo, $donde){
		$valor ="";	
		if($this->tipoNodo=="field" &&  $donde=="P") {
			$filaCVS =  $this->DameValorFormato($this->filaCVS,$valorParseo); ;
		} else{
			$filaCVS = $this->DameValorNamespace($this->filaCVS,$valorParseo);
		}	
		$arrayvacio = $this->CompruebaVacio($filaCVS);
		if (!$arrayvacio) {
			$cuantos = count($valorParseo);
			switch ($cuantos) {
				case 1:
					//$valorFormato = DameValorFormato($valorIso,$tipo);
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]));
					break;
				case 2:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]));
					break;
				case 3:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]));
					break;
				case 4:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]));
					break;
				case 5:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]));
					break;
				case 6:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]),
												trim($filaCVS[$valorParseo[5]]));
					break;
				case 7:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]),
												trim($filaCVS[$valorParseo[5]]),
												trim($filaCVS[$valorParseo[6]]));
					break;
				case 8:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]),
												trim($filaCVS[$valorParseo[5]]),
												trim($filaCVS[$valorParseo[6]]),
												trim($filaCVS[$valorParseo[7]]));
					break;
				case 9:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]),
												trim($filaCVS[$valorParseo[5]]),
												trim($filaCVS[$valorParseo[6]]),
												trim($filaCVS[$valorParseo[7]]),
												trim($filaCVS[$valorParseo[8]]));
					break;
				case 10:
					$valor = sprintf($valorIso, trim($filaCVS[$valorParseo[0]]),
												trim($filaCVS[$valorParseo[1]]),
												trim($filaCVS[$valorParseo[2]]),
												trim($filaCVS[$valorParseo[3]]),
												trim($filaCVS[$valorParseo[4]]),
												trim($filaCVS[$valorParseo[5]]),
												trim($filaCVS[$valorParseo[6]]),
												trim($filaCVS[$valorParseo[7]]),
												trim($filaCVS[$valorParseo[8]]),
												trim($filaCVS[$valorParseo[9]]));
					break;
			}
		}
		return $valor;
	}


	//funcion que compruebas si la fila CSV no tiene nada
	function CompruebaVacio($filaCVS){
		$vacio = true;
		foreach ($filaCVS as $value) {
			$vacio &= empty($value);
		}
		return $vacio;
	}

	//funcion que da formato tipo Vistuosdo al dato segun el tiopò del esquema XML indicado
	function DameValorFormato($filaCVS,$valorParseo) {
		$filaCVSNamespace = array();
        foreach ($valorParseo as $value) {
			if (empty($filaCVS[$value])) {
				$filaCVSNamespace[$value] = "";
			} else if (($this->tipoNodo=="field") || ($this->tipoNodo=="value")) {
				$tipo = strtolower($this->tipoPredicadoParseo);
				if (empty($tipo)){
					$valor = $filaCVS[$value];
					$filaCVSNamespace[$value] = $valor;
				} else {
					switch ($tipo) {
						case 'float': 
							$valor = $filaCVS[$value];
							$valor = str_replace(".","",$valor);
							$valor = str_replace(",",".",$valor);
							$filaCVSNamespace[$value] = $valor;
						break;
						case 'decimal':
							$valor = $filaCVS[$value];
							$valor = str_replace(".","",$valor);
							$valor = str_replace(",",".",$valor);
							$filaCVSNamespace[$value] = $valor;
						break;
						case 'boolean':
							$valor = $filaCVS[$value];
							if (filter_var($valor, FILTER_VALIDATE_BOOLEAN)) {
								$filaCVSNamespace[$value] = "true";
							} else {
								$filaCVSNamespace[$value] = "false";
							}
						break;
						case 'datetime':
						    $formatoVirtuoso = 'Y-m-d H:i:s';
							$formato = 'Y-m-d H:i:s';
							$valor="";
							$date = $filaCVS[$value];
							$Esfecha = true;
							if (DateTime::createFromFormat($formato, $date) === false) {
								$formato = 'd-m-Y H:i:s';
								if (DateTime::createFromFormat($formato, $date) === false) {
									$formato = 'Y-m-d';
									if (DateTime::createFromFormat($formato, $date) === false) {
										$formato = 'd-m-Y';
										if (DateTime::createFromFormat($formato, $date) === false) {
											$Esfecha = false;
										}	
									}
								}
							} 
							if ($Esfecha)	{
								$fecha = new DateTime($filaCVS[$value]);
								$valor = date_format($fecha,  $formatoVirtuoso);
								$valor = str_replace(" ", "T", $valor);
							}
							$filaCVSNamespace[$value] = $valor;	
						break;
						case 'time':
							$formato = 'H:i:s';
							$valor="";
							$date = $filaCVS[$value];
							if (DateTime::createFromFormat($formato, $date) !== false) {
								$fecha = new DateTime($filaCVS[$value]);
								$valor = date_format($fecha, $formato);
							} 
							$filaCVSNamespace[$value] = $valor;	
						break;			  
						default:
						$filaCVSNamespace[$value] =  $filaCVS[$value];
						break;
					}
				}
			} else {
				$filaCVSNamespace[$value] = $filaCVS[$value];
			}
		}
		return $filaCVSNamespace;
	}

	function DameValorNamespace($filaCVS,$valorParseo) {
		$filaCVSNamespace = array();
        foreach ($valorParseo as $value) {
			$valor = $filaCVS[$value];
			$valor = str_replace(" ", "_", $valor);
			//se comprueba que si no es url para escaparlo. Hasta ahora los que son url son expresiones completas del tipo {$valor}
			//OJO Purde que eun futuro pueda fallar en expesiones de plantilla tipo http://http://opendata.aragon.es?url={$valor} 
			if(filter_var($valor, FILTER_VALIDATE_URL) === FALSE)
			{
				$valor = urlencode($valor);
			}
			$filaCVSNamespace[$value] = $valor;
		}
		return $filaCVSNamespace;
	}

}


	