<?php

namespace ApiRest\WorkerBundle\Controller;

use Katzgrau\KLogger\Logger;
use Psr\Log\LogLevel;
/**
* Clase para dar mas soporte a la clase de log, añadiendo el nombre de la clase y la función
* También se utiliza para almacenar el log en memoria y escribirlo se una sola vez al final
* del proceso
 */
class Trazas
{

    /**
     * Booleana que indica si el conjunto de trazas tiene trazas de errores o no
     */
    protected $conError;

    /**
     * Nombre de la clase donde esta el proceso
     */
    protected $clase;


    /** 
     * 
     * Boolena que informa si en la clase escribe o nio as trazas info (DEBUG)
    */
    protected $escribeTrazasDebug;

    /**
     * Nombre de la clase donde esta el proceso
     */
    protected $logger;

    /**
	* Set clase
	*
	*/
	public function setClase($clase)
	{
		return $this->clase = $clase;
    }
    

    public function setEscribeTrazasDebug($escribeTrazasDebug)
	{
		return $this->escribeTrazasDebug = $escribeTrazasDebug;
    }

    /**
     * Constructor inicia los Array
     */
    public function __construct($pathNoporcesados) {
    
        $this->conError = FALSE;
        $this->escribeTrazasDebug = TRUE;
        $this->logger = new Logger($pathNoporcesados);
    }

    /**
     * Añado una fila al contenedor de trazas info
     */
    public function LineaInfo($funcion, $traza) 
    {
        $this->logger->info($this->DameLineaLog($this->clase, $funcion, $traza)); 
    }

    public function LineaDebug($funcion, $traza) 
    {
        if ($this->escribeTrazasDebug) {
            $this->logger->debug($this->DameLineaLog($this->clase, $funcion, $traza)); 
        }
    
    }
    /**
     * Añado una fila al contenedor de trazas error
     */
    public function LineaError($funcion, $traza) 
    {
        $this->logger->error($this->DameLineaLog($this->clase, $funcion, $traza)); 
        $this->conError = TRUE;
    }

    /**
     * Devuelve si  tengo error
     */
    public function SinError() 
    {
        return !($this->conError);
    }

     /**
     * Devuelve la ruta del archivo log
     */

    public Function DamePath(){
        return $this->logger->getLogFilePath();
    }

    /**
     * Da formato a el log
     */
    private function DameLineaLog($clase, $funcion, $traza)
    {
        return sprintf("[%s:%s] %s", $clase,$funcion,$traza);
    }
}
    

