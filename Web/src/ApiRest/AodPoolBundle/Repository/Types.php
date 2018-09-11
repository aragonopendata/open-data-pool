<?php

namespace ApiRest\AodPoolBundle\Repository;

use Doctrine\ORM\EntityManager;

class Types
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
        $this->setName('Repository_Types') ;
    }

    function GetTypesWeb() {
        $entidadSol = array();

        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = 0 
                                      ORDER BY t.code ASC"); 
        $entidases = $consulta->getResult();
        foreach ($entidases as $entidad) { 
           $entidadSol[$entidad->getCode()] = $entidad->getNameEs();
        }
        return $entidadSol;
    }

    function GetTypesRest($code) {
        $entidadSol = array();

        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = $code 
                                      ORDER BY t.code ASC"); 
        $entidases = $consulta->getResult();
        foreach ($entidases as $entidad) { 
           $entidadSol[$entidad->getCode()] = $entidad;
        }
        return $entidadSol;
    }

    function GetNameType($code) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      WHERE t.active = '1' and 
                                            t.code = $code"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $entidad = $query[0]->getNameEs();
        }
        return $entidad;
    }

    function GetRdfType($code) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                            WHERE t.active = '1' and 
                                            t.code = $code"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $entidad = $query[0]->getRdf_type();
        }
        return $entidad;
    }

    function GetDcType($code) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                            WHERE t.active = '1' and 
                                            t.code = $code"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $entidad = $query[0]->getDc_type();
        }
        return $entidad;
    }

    function GetDcTypeByRdfType($rdfType) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                            WHERE t.active = '1' and 
                                            t.rdf_type = '$rdfType' order by t.parentCode"); 
        $query = $consulta->getResult();
        if (count($query)>0){
            $entidad = $query[0]->getDc_type();
        }
        return $entidad;
    }

    function GetDcTypeByRdfTypes($rdfTypes,$dctype) {
        $entidad=array();
        foreach ($rdfTypes as $rdfType) {
            $tipo = $rdfType['nombre'];
            if ($tipo==$dctype) {
                $rdf = $rdfType['rdftype'];
                $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t  
                                                    WHERE t.active = '1' and  
                                                    t.rdf_type = '$rdf'"); 
                $query = $consulta->getResult();
                if (count($query)>0){
                    $entidad[] = $rdfType;
                }
            }
        }
        return $entidad;
    }


    function GetSubTypes($entidadCode) {
        $subentidades = array();      
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      WHERE t.active = '1' and 
                                            t.parentCode = $entidadCode
                                      ORDER BY t.nameEs ASC");
        $entidades = $consulta->getResult();
        foreach ($entidades as $entidad) { 
            $subentidades[$entidad->getCode()] = $entidad->getNameEs();
        }
        return $subentidades;
    }

    function GetParentType($subEntidadCode) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      JOIN ApiRestAodPoolBundle:Entidades s  
                                      WHERE s.parentCode = t.code and
                                      s.code = $subEntidadCode");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0];
        }
        return $entidad;
    }

    function GetParentTypeByDctype($dcType) {
        $entidad= array();
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      JOIN ApiRestAodPoolBundle:Entidades s  
                                      WHERE s.parentCode = t.code and
                                      s.dc_type = '$dcType'");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0];
        }
        return $entidad;
    }

    function GetChildTypeByDctype($dcType) {
        $entidad=array();
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                      JOIN ApiRestAodPoolBundle:Entidades s  
                                      WHERE s.code = t.parentCode and
                                      s.dc_type = '$dcType'");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0];
        }
        return $entidad;
    }

    function GetNameByDcType($dcType) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                           WHERE t.dc_type = '$dcType'");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0]->getNameEs();
        }
        return $entidad;
    }

    function GetDcTypeByName($name) {
        $dcType= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                           WHERE t.nameEs = '$name'");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $dcType = $query[0]->getDc_type();
        }
        return $dcType;
    }

    function GetNameByRdfType($rdfType) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                           WHERE t.rdf_type = '$rdfType' order by t.parentCode");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0]->getNameEs();
        }
        return $entidad;
    }

    function GetCodeByRdfType($rdfType) {
        $entidad= "";
        $consulta = $this->em->createQuery("SELECT t FROM ApiRestAodPoolBundle:Entidades t 
                                           WHERE t.rdf_type = '$rdfType' and t.parentCode=0");                         
        $query = $consulta->getResult();
        if (count($query)>0){
           $entidad = $query[0]->getCode();
        }
        return $entidad;
    }


    function GetFullTypesRest(){

        $types = $this->GetTypesRest(0);
        $types = $this->GetFullSubTypesRest($types);  
        return $types;
    }

    function GetFullTypesWeb(){

        $types = $this->GetTypesRest(0);
        $types = $this->GetFullSubTypesWeb($types);  
        return $types;
    }

    function GetFullSubTypesRest(&$types){
        if (count($types)>0) {
            foreach ($types as $key => $value ) {
                 $subTypes = $this->GetSubTypes($key);  
                 if ((count($subTypes)>0)){
                    $subTypeTexto ="";
                    foreach ($subTypes as $type) { 
                        $subTypeTexto .= $type . ", ";
                    }
                    $subTypeTexto = substr($subTypeTexto, 0, -2);
                    $temp= array('Type' => $types[$key],'SubType'=> $subTypes, 'SubTypeTexto'=> $subTypeTexto );
                    $types[$key] =  $temp;
                    $types[$key]['SubType'] =  $this->GetTypesRest($key);
                    $this->GetFullSubTypesRest($types[$key]['SubType']);
                }
             }
        }
        return $types;
    }
    

    function GetFullSubTypesWeb(&$types){
        if (count($types)>0) {
            foreach ($types as $key => $value ) {
                 $subTypes = $this->GetSubTypes($key);  
                 if ((count($subTypes)>0)){

                    $subTypeTexto ="";
                    foreach ($subTypes as $type) { 
                        $subTypeTexto .= $type . ", ";
                    }
                    $subTypeTexto = substr($subTypeTexto, 0, -2);
                    if (strlen($subTypeTexto)>250) {
                        $subTypeTexto = substr($subTypeTexto,0,249);
                        $pos = strrpos($subTypeTexto,",");
                        $subTypeTexto = substr($subTypeTexto,0, $pos) . " ...";
                    }
                    $temp= array('Type' => $types[$key], 
                                 'SubTypeTexto'=> $subTypeTexto );
                    $types[$key] =  $temp;
                 }
            }
        }
        return $types;
    }
}