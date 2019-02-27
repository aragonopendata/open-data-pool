<?php

namespace ApiRest\AodPoolBundle\Repository;

use Doctrine\ORM\EntityManager;

class Locations 
{
    /**
     * Gestor doctrine
     */
    private $em = null;

    public function __construct($doctrine) {
        $this->em = $doctrine;
    }

    protected function configure()
    {
        $this->setName('Repository_Topics') ;
    }

    public function GetLocations() {
        $todosLugares = array();
        $provincias = array();
        $comarcas = array();
        $municipios = array();

       
        $consulta =  $this->em->createQuery("SELECT l FROM ApiRestAodPoolBundle:Lugares l                                    
                                             ORDER BY l.name ASC"); 
        $lugares = $consulta->getResult();
        foreach ($lugares as $lugar) {
            switch ($lugar->getType()) {
                case 'P':
                    $provincias[$lugar->getCode()] = $lugar->getName(); 
                    break;
                case 'C':
                    $comarcas[$lugar->getCode()] = $lugar->getName(); 
                    break;
               case 'M':
                    $municipios[$lugar->getCode()] = $lugar->getName(); 
                    break;    
            }           
        }
        $todosLugares = array("Provincias" => $provincias, 
                              "Comarcas" => $comarcas, 
                              "Municipios" => $municipios);
        return $todosLugares;
    }


    public function GetNameLocation($codigo) {
 
        $lugar = "";
        $consulta =  $this->em->createQuery("SELECT l FROM ApiRestAodPoolBundle:Lugares l                                    
                                             WHERE l.code = $codigo"); 
        $query = $consulta->getResult();
        if (count($query)>0){
           $lugar = $query[0]->getName(); 
        }
        return $lugar;
    }

    public function GetCodeLocation($name,$type) {
 
        $code = "";
        $consulta =  $this->em->createQuery("SELECT l FROM ApiRestAodPoolBundle:Lugares l                                    
                                             WHERE l.name = '$name' and
                                                   l.type='$type'");   
        $query = $consulta->getResult();
        if (count($query)>0){
           $code = $query[0]->getCode(); 
        }
        return $code;
    }

}