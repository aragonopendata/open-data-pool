<?php

namespace ApiRest\AodPoolBundle\Repository;

use Doctrine\ORM\EntityManager;

class Facets 
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
        $this->setName('Repository_Facets') ;

    }

    public function GetFacetas() {
        $todasFacetas = array();
        $consulta =  $this->em->createQuery("SELECT f FROM ApiRestAodPoolBundle:Facetas f 
                                             WHERE f.active = '1' 
                                             ORDER BY f.orden"); 
        $facetas = $consulta->getResult();
        foreach ($facetas as $faceta) { 
                $todasFacetas[$faceta->getCode()] = $faceta->getArrayData(); 
        }           
        return $todasFacetas;
    }


    public function GetFacetasbyRdfType($rdf_type) {
 
        $rdfFacetas = array();
        $consulta =  $this->em->createQuery("SELECT f FROM ApiRestAodPoolBundle:Facetas f 
                                             WHERE f.active = '1' and f.rdfType = '$rdf_type' 
                                             ORDER BY f.orden"); 
        $facetas = $consulta->getResult();
        foreach ($facetas as $faceta) { 
            $rdfFacetas[$faceta->getCode()] = $faceta->getArrayData(); 
        }           
        return $rdfFacetas;
    }

    public function GetFacetasbyDcType($dc_type) {
 
        $dcFacetas = array();
        $consulta =  $this->em->createQuery("SELECT f FROM ApiRestAodPoolBundle:Facetas f 
                                             WHERE f.active = '1' and f.dcType = '$dc_type' 
                                             ORDER BY f.orden"); 
        $facetas = $consulta->getResult();
        foreach ($facetas as $faceta) { 
            $dcFacetas[$faceta->getCode()] = $faceta->getArrayData(); 
        }           
        return $dcFacetas;

    }

    public function GetFacetasbyDefault() {
 
        $rdfFacetas = array();
        $consulta =  $this->em->createQuery("SELECT f FROM ApiRestAodPoolBundle:Facetas f 
                                             WHERE f.active = '1' and f.rdfType = 'Default' 
                                             ORDER BY f.orden"); 
        $facetas = $consulta->getResult();
        foreach ($facetas as $faceta) { 
            $rdfFacetas[$faceta->getCode()] = $faceta->getArrayData(); 
        }           
        return $rdfFacetas;
    }

}