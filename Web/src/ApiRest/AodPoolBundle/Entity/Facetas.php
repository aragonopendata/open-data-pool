<?php


namespace ApiRest\AodPoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Facetas
 *
 * @ORM\Table(name="facetas")
 * @ORM\Entity
 */
class Facetas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="code", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="facetas_code_seq", allocationSize=1, initialValue=1)
     */
    private $code; 

    /**
     * @var string
     *
     * @ORM\Column(name="rdf_type", type="string", length=100, nullable=true)
     */
    private $rdfType;

    /**
     * @var string
     *
     * @ORM\Column(name="dc_type", type="string", length=100, nullable=true)
     */
    private $dcType;

    /**
     * @var string
     *
     * @ORM\Column(name="faceta", type="string", length=100, nullable=true)
     */
    private $faceta;

    /**
     * @var string
     *
     * @ORM\Column(name="prefijo_faceta", type="string", length=200, nullable=true)
     */
    private $prefijoFaceta;


    /**
     * @var string
     *
     * @ORM\Column(name="name_head", type="string", length=50, nullable=true)
     */
    private $nameHead;


    /**
     * @var string
     *
     * @ORM\Column(name="condition", type="string", length=200, nullable=true)
     */
    private $condition;

    /**
     * @var integer
     *
     * @ORM\Column(name="orden", type="integer", nullable=false)
     */
    private $orden;


    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean", nullable=false)
     */
    private $active;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="date", nullable=false)
     */
    private $created = 'now()';


    public function getCode()
	{
		return $this->code;
	}
    
	public function getRdfType()
	{
		return $this->rdfType;
	}

	public function getDcType()
	{
		return $this->dcType;
	}

	public function getFaceta()
	{
		return $this->faceta;
	}

    public function getPrefijoFaceta()
	{
		return $this->prefijoFaceta;
	}

    
    public function getNameHead()
	{
		return $this->nameHead;
    }

    public function getOrden()
	{
		return $this->orden;
    }
    
    public function getCondition()
	{
		return $this->condition;
    }


    public function getActive()
	{
		return $this->active;
	}

    public function getArray()
	{
        $Faceta = array(
            "Code" => $this->code,
            "RdfType" => $this->rdfType,
            "DcType" => $this->dcType,
            "Faceta" => $this->faceta,
            "PrefijoFaceta" => $this->prefijoFaceta,
            "NameHead" => $this->nameHead,
            "Orden" => $this->orden,
            "Condition" => $this->condition,
            "Active" => $this->active);
		return  $Faceta;
    }
    
    public function getArrayData()
	{
        $Faceta = array(
            "RdfType" => $this->rdfType,
            "DcType" => $this->dcType,
            "Faceta" => $this->faceta,
            "PrefijoFaceta" => $this->prefijoFaceta,
            "NameHead" => $this->nameHead,
            "Orden" => $this->orden,
            "Condition" => $this->condition);
		return  $Faceta;
	}

}








