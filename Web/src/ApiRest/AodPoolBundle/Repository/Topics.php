<?php

namespace ApiRest\AodPoolBundle\Repository;

use Doctrine\ORM\EntityManager;

class Topics 
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

   function GetTopicsWeb() {
        $temasSol = array();

        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = 0 
                                      ORDER BY t.nameEs ASC"); 
        $temas = $consulta->getResult();
        foreach ($temas as $tema) { 
           $temasSol[$tema->getCode()] = $tema->getNameEs();
        }
        return $temasSol;
    }

    function GetTopicsRest($code) {
        $temasSol = array();

        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = $code
                                      ORDER BY t.nameEs ASC"); 
        $temas = $consulta->getResult();
        foreach ($temas as $tema) { 
           $temasSol[$tema->getCode()] = $tema;
        }
        return $temasSol;
    }

    function GetNameTopic($code) { 
        $tema= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                            WHERE t.active = '1' and 
                                            t.code = $code"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $tema = $query[0]->getNameEs();
        }
        return $tema;
    }

    function GetSubTopics($temaCode) {
        $subtemas = array();      
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = $temaCode
                                      ORDER BY t.nameEs ASC");
        $temas = $consulta->getResult();
        foreach ($temas as $tema) { 
            $subtemas[$tema->getCode()] = $tema->getNameEs();
        }
        return $subtemas;
    }


    function GetParentTopic($subTemaCode) {
        $tema= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                      JOIN ApiRestAodPoolBundle:Temas s  
                                      WHERE s.parentCode = t.code and
                                      s.code = $subTemaCode");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $tema = $query[0];
        }
        return $tema;
    }

    function GetRdfTopic($code) {
        $tema= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                            WHERE t.active = '1' and 
                                            t.code = $code"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $tema = $query[0]->getRdf_type();
        }
        return $tema;
    }

    function GetNameByRftype($rdftype) {
        $tema= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                            WHERE t.active = '1' and 
                                            t.rdf_type = '$rdftype'"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $tema = $query[0]->getNameEs();
        }
        return $tema;
    }


    function GetCodeByRdfType($rdfType) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                           WHERE t.rdf_type = '$rdfType' and t.parentCode=0");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0]->getCode();
        }
        return $entidad;
    }

    function GetParentType($rdftype) {
        $tema= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Temas t 
                                            WHERE t.active = '1' and 
                                            t.rdf_type = '$rdftype'"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $tema = $query[0]->getParentCode();
        }
        return  $tema ;
    }

    function GetFullTopicsRest(){

        $topics = $this->GetTopicsRest(0);
        $topics = $this->GetFullsubTopicsRest($topics);  
        return $topics;
    }

    function GetFullTopicsWeb(){

        $topics = $this->GetTopicsRest(0);
        $topics = $this->GetFullsubTopicsWeb($topics);  
        return $topics;
    }

    function GetFullsubTopicsRest(&$topics){
        if (count($topics)>0) {
            foreach ($topics as $key => $value ) {
                
                 $subTopics = $this->GetsubTopics($key);  
                 if ((count($subTopics)>0)){
                    $subTopicsTexto ="";
                    foreach ($subTopics as $tema) { 
                        $subTopicsTexto .= $tema . ", ";
                    }
                    $subTopicsTexto = substr($subTopicsTexto, 0, -2);
                    $temp= array('Topic' => $topics[$key],'SubTopics'=> $subTopics, 'SubTopicsTexto'=> $subTopicsTexto );
                    $topics[$key] =  $temp;
                    $topics[$key]['SubTopics'] =  $this->GetTopicsRest($key);
                    $this->GetFullsubTopicsRest($topics[$key]['SubTopics']);
                 }
            }
        }
        return $topics;
    }

    function GetFullSubTopicsWeb(&$topics){
        if (count($topics)>0) {
            foreach ($topics as $key => $value ) {
                
                 $subTopics = $this->GetsubTopics($key);  
                 if ((count($subTopics)>0)){
                    $subTopicsTexto ="";
                    foreach ($subTopics as $tema) { 
                        $subTopicsTexto .= $tema . ", ";
                    }
                    $subTopicsTexto = substr($subTopicsTexto, 0, -2);
                    $temp= array('Topic' => $topics[$key], 
                                 'SubTopicsTexto'=> $subTopicsTexto );
                    $topics[$key] =  $temp;
                 }
            }
        }
        return $topics;
    }
}