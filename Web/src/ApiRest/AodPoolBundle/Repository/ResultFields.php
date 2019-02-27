<?php

namespace ApiRest\AodPoolBundle\Repository;

use Doctrine\ORM\EntityManager;

class ResultFields 
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
        $this->setName('Repository_ResultFields') ;

    }

    public function GetCampos() {
        $todosCampos = array();
        $consulta =  $this->em->createQuery("SELECT c FROM ApiRestAodPoolBundle:CamposResultados c 
                                             WHERE c.active = '1' 
                                             ORDER BY c.orderBy ASC"); 
        $campos = $consulta->getResult();
        foreach ($campos as $campo) { 
                $todosCampos[$campo->getCode()] = $campo->getArrayData(); 
        }           
        return $todosCampos;
    }


    public function GetCamposbyRdfType($rdf_type) {
 
        $rdfCampos = array();
        $consulta =  $this->em->createQuery("SELECT c FROM ApiRestAodPoolBundle:CamposResultados c 
                                             WHERE c.active = '1' and c.rdfType = '$rdf_type' 
                                             ORDER BY c.orderBy ASC"); 
        $campos = $consulta->getResult();
        foreach ($campos as $campo) { 
            $rdfCampos[] = $campo->getArrayData(); 
        }           
        return $rdfCampos;
    }
}