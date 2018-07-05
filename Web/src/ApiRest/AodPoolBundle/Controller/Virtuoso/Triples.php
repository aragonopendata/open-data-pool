<?php

namespace ApiRest\AodPoolBundle\Controller\Virtuoso;

use ApiRest\AodPoolBundle\Controller\Utility\Trazas;
/**
* Conversor de array de tripes desde cadena de texto.
* Virtuoso de vuelve òr htttp como una cadena de texto separada por saltos de linea
* La clase tiene las funcionalidades: 
*  1 -Convierte de estring a array de triples
*  2.-Gestuon de errores
*/
class Triples
{

	/**
    * predicado de la triple
	*/
    protected $logger;

    	/**
     * Flag de error para sacar en 400
     */
	protected $error = false;

	/**
     * Cadena de error para sacar en 400
     */
	protected $error400 = "";


	public function getError(){
		return $this->error;
	}

	public function getError400(){
		return $this->error400;
    }
    
    	//clase de trazas
	protected $trazas=null;

	public function setTrazas($trazas){
        $this->trazas = $trazas;
    }

    public function getTrazas(){
        return $this->trazas;
	}
    
    
    /**
	* Constructor con objeto traza como parámetro
	*/
	public function __construct($directoryPath, $trazasdebug) {
        $trazas = new Trazas($directoryPath);
        $trazas->setEscribeTrazasDebug($trazasdebug);
        $trazas->setClase("Triples");
        $this->setTrazas($trazas);	
        $this->trazas->LineaInfo("__construct","Llamada a Función");
        $this->error= false;
        $this->error400="";

    }

    /** 
     * Función que se le pasa la cadena de texto recogida por http de virtuoso
     * y devuelve el array de triples correspondiente, parseando  la la misma
    */
    public function DameTriples($respuesta) {
        $this->trazas->LineaDebug("DameTriples", "Entro en función");
        $ArrayRespuestas = array();
        //hago el primer array seperando por retorno carro
        $lineasRespuesta = explode("\n",$respuesta);
        $header = array();
        //La primera linea coresponde a los encabezados
        if (count($lineasRespuesta)>0) {
            $this->trazas->LineaDebug("DameTriples", "Parámetro entrada correcto");
            //quito las comillas que viene del http
            $lineasRespuesta[0] = str_replace("\"","", $lineasRespuesta[0]);
            //recojo el array de encabezados
            $header = explode(",",$lineasRespuesta[0]);
            $this->trazas->LineaDebug("DameTriples",  sprintf("Recojo header: S:%s, V:%s, P:%s ",$header[0],$header[1],$header[2]));
            $cuenta=0;
            //ahora recojo los datos 
            foreach ($lineasRespuesta as $linea) {
                //si 0 es el encabezado
                if ($cuenta>0) {
                    if (!empty($linea)) {
                        $this->trazas->LineaDebug("DameTriples", sprintf("Proceso Linea: %s",$linea));
                        $linea = str_replace("\"","", $linea);
                        //llamo a dame triple pasandole la linea y elencabezado
                        $ArrayRespuestas[] = $this->DameTripe($linea, $header);
                    }
                }
                $cuenta++;
            }
        } else {
            $this->error = true;
            $this->error400 = "La cedena parametro no contiene saltos de linea";
            $this->trazas->LineaError("DameTriples",trim($this->error400)); 
        }  
        return $ArrayRespuestas;
    }
    
    /**
    * Función que dado una linea de texto y una array de encabezados devuelve el array 
    * Clave => valor de la triple correspondiente a la linea de texto
    **/
    private function DameTripe($linea,$header) {
        $sujeto ="";
        $verbo ="";
        $predicado ="";
        $tem = explode(",",$linea);
        if (isset($tem[0])) {
            $this->trazas->LineaDebug("DameTripe", sprintf("Proceso Sujeto: %s",$tem[0]));
            $sujeto= sprintf("%s", $tem[0]);
        }
        if (isset($tem[1])) {
            $this->trazas->LineaDebug("DameTripe", sprintf("Proceso Verbo: %s",$tem[1]));
            $verbo=sprintf("%s", $tem[1]);
        }
        if (isset($tem[2])) {
           $this->trazas->LineaDebug("DameTripe", sprintf("Proceso Predicado: %s",$tem[2]));
           $predicado= sprintf("%s", $tem[2]);
        }
        $arrayLinea = array($header[0] => $sujeto, $header[1]=>$verbo, $header[2]=> $predicado);
        return  $arrayLinea ;
    }

     /** 
     * Función que se le pasa la cadena de texto recogida por http de virtuoso
     * y devuelve el array de sujetos correspondiente, parseando la la misma
    */
    public function DameSujetos($respuesta) {
        $this->trazas->LineaDebug("DameTriples", "Entro en función");
        $ArrayRespuestas = array();
        //hago el primer array seperando por retorno carro
        $lineasRespuesta = explode("\n",$respuesta);
        $header = array();
        //La primera linea coresponde a los encabezados
        if (count($lineasRespuesta)>0) {
            $this->trazas->LineaDebug("DameTriples", "Parámetro entrada correcto");
            //quito las comillas que viene del http
            $lineasRespuesta[0] = str_replace("\"","", $lineasRespuesta[0]);
            //recojo el array de encabezados
            $header = explode(",",$lineasRespuesta[0]);
            $this->trazas->LineaDebug("DameTriples",  sprintf("Recojo header: S:%s ",$header[0]));
            $cuenta=0;
            //ahora recojo los datos 
            foreach ($lineasRespuesta as $linea) {
                //si 0 es el encabezado
                if ($cuenta>0) {
                    if (!empty($linea)) {
                        $this->trazas->LineaDebug("DameTriples", sprintf("Proceso Linea: %s",$linea));
                        $campos = $this->explodeAvanzado($linea, count($header));
                        //llamo a dame triple pasandole la linea y elencabezado
                        $i=0;
                        $cuantos = count($header);
                        $regitro = array();
                        foreach ($campos as $campo) {
                            if ($cuantos>$i) {
                                $campo = str_replace("\"","", $campo);
                                $key=$header[$i];
                                $regitro[$key] = $campo;
                            }
                            $i++;
                        }
                        $ArrayRespuestas[] = $regitro ;
                    }
                }
                $cuenta++;
            }
        } else {
            $this->error = true;
            $this->error400 = "La cedena parametro no contiene saltos de linea";
            $this->trazas->LineaError("DameTriples",trim($this->error400)); 
        }  
        return $ArrayRespuestas;
    }


    /**
     * Función que realiza un explode de una cadena del tipo ("valor1", "valor2,2",,,, ) 
     * La complicaion está en separar las comas de dentro de los valores y diferenciar
     * Los valores vacíos
     * Los parámetros son: 
     *   $cadena: la cadena a tratar
     *   $cuantos: numero de elementos que se deben extraer (proveniente del encabezado)
     */
    private function explodeAvanzado($linea, $cuantos)
    {
        //priemero hago un explode normal por si no hace falta otra cosa
        $campos = explode(",",$linea);
        //si el nº de elementos no es el mismo que el de los encabezados algo va mal hay comas conflictivas
        if (count($campos)!=$cuantos)
        {
            //extraigo toso los valore entre comillas
            preg_match_all('/"(.*?)\"/s', $linea, $match);
            //array para recuperar las comas después de hacer el explode sin comas conflictivas
            $cadenasconcoma = array();
            //cadena que va a ir sin comas para hacer el explode
            $lineasincoma=$linea;
            if (count($match)>0) {
                foreach ($match[0] as $value) {
                    //busco las comas conflictivas
                    if (strpos($value,",")!=false){
                        //creo el va,or sin coma conflictiva
                        $valorsincoma = str_replace(",","",$value);
                        //lo sustituyo en la linea 
                        $lineasincoma = str_replace($value,$valorsincoma,$lineasincoma);
                        //guardo el valor para recupera la coma despues
                        $cadenasconcoma[] = array('concoma' => $value,'sincoma'=> $valorsincoma);
                    }
                }
                //hago el explode ahora sin comas conflictivas
                $campos = explode(",",$lineasincoma);
                if (count($campos)==$cuantos) 
                {
                    //Ahora recupero las comas en los elementos del array
                    $count=0;
                    foreach ($campos as $campo) {
                       foreach ($cadenasconcoma as $value) {
                           //si el valor sin coma del array donde guardamos las valores con comas 
                           //es igual que el del explode sin comas conflictivas recupero la coma en el elemento
                           if($value['sincoma']===$campo){
                             $campos[$count] = $value['concoma'];
                           }
                           $count++;
                       }          
                    }
                }
            }
        }
        return  $campos;
    }

}

