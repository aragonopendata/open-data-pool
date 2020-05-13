<?php
namespace ApiRest\WorkerBundle\Controller;

/**
 * Clase que carga los datos de los archivos CSV a memoria
 */
class Csv
{

    /**
     * Carpeta donde se encuentran los archivos del proceso
     */
    protected $carpeta;

    /**
     * Objeto de log
     */
    protected $trazas;

    /**
     * Get Traza
     */
    public function getTrazas()
    {
        return $this->trazas;
    }

    /**
     * Constructor
     * Parámetro: $carpeta: Carpeta donde se encuentran los archivos del proceso
     */
    public function __construct($carpeta, $trazas)
    {
        $this->carpeta = $carpeta;
        // $this->trazas = $trazas;
        // $this->trazas->setClase("Csv");
        // $this->trazas->LineaDebug("__construct", "Inicia el constructor");
    }

    /**
     * Abre el archivo Csv del objeto y devuelve un array múltiple, con cabecera y datos
     * Devuelve: $data
     */
    function DameCsv()
    {
        $data = array();
        if (! empty($this->carpeta)) {
            //$nombreFichero = $this->carpeta . "/view78.csv";
            $nombreFichero = $this->carpeta;
            clearstatcache();
            if (file_exists($nombreFichero)) {
                // $this->trazas->LineaDebug("DameCsv",$nombreFichero .": Fichero CSV encontrado");
                if (($gestor = fopen($nombreFichero, "r")) !== FALSE) {
                    // $this->trazas->LineaDebug("DameCsv","Fichero CSV abierto lectura");
                    $header = fgetcsv($gestor, 0, ";");
                    $line_count = - 1; // so loop limit is ignored
                    while (($row = fgetcsv($gestor, 0, ";")) !== FALSE) {
                        foreach ($header as $i => $heading_i) {
                            $row_new[$heading_i] = addslashes($row[$i]);
                        }
                        $data[] = $row_new;
                    }
                    // $this->trazas->LineaDebug("DameCsv", sprintf("Leídas %d filas", count($data)));
                    fclose($gestor);
                    // $this->trazas->LineaDebug("DameCsv","Fichero CSV leído y cerrado");
                }
            } else {
                // $this->trazas->LineaError("DameCsv",$nombreFichero .": Fichero CSV no encontrado");
            }
        } else {
            // $trazas->LineaError("DameCsv","Carpeta del proceso no encontrada");
        }
        return $data;
    }

    // funcion que se invoca unicamente desde el servicio api de actulizacion por sujeto postEntitiesAction
    // la funcion lee y devuelve toso los sujetos de las triples del archivo datos.csv
    // que son las url a encontrar para el borrado
    function dameUris()
    {
        $uris = array();
        if (! empty($this->carpeta)) {
            $nombreFichero = $this->carpeta . "/datos.csv";
            if (file_exists($nombreFichero)) {
                // $this->trazas->LineaDebug("dameUris",$nombreFichero .": Fichero CSV encontrado");
                if (($gestor = fopen($nombreFichero, "r")) !== FALSE) {
                    // $this->trazas->LineaDebug("dameUris","Fichero CSV abierto lectura");
                    $header = fgetcsv($gestor, 0, ";");
                    $line_count = - 1; // so loop limit is ignored
                    while (($row = fgetcsv($gestor, 0, ";")) !== FALSE) {
                        if (! in_array($row[0], $uris)) {
                            $uris[] = $row[0];
                        }
                    }
                    // $this->trazas->LineaDebug("dameUris", sprintf("Leídas %d uris", count($uris)));
                    fclose($gestor);
                    // $this->trazas->LineaDebug("dameUris","Fichero CSV leído y cerrado");
                }
            } else {
                // $this->trazas->LineaError("dameUris",$nombreFichero .": Fichero CSV no encontrado");
            }
        } else {
            // $trazas->LineaError("dameUris","Carpeta del proceso no encontrada");
        }
        return $uris;
    }
}
  