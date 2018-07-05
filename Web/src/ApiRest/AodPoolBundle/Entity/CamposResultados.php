<?php


namespace ApiRest\AodPoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CamposResultados
 *
 * @ORM\Table(name="camposresultados")
 * @ORM\Entity
 */
class CamposResultados
{
    /**
     * @var integer
     *
     * @ORM\Column(name="code", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="camposresultados_code_seq", allocationSize=1, initialValue=1)
     */
    private $code; 

    /**
     * @var string
     *
     * @ORM\Column(name="rdf_type", type="string", length=100, nullable=true)
     */
    private $rdfType;



    /**
     * @var integer
     *
     * @ORM\Column(name="order_by", type="string", length=100, nullable=false)
     */
    private $orderBy;


    /**
     * @var string
     *
     * @ORM\Column(name="field_date", type="string", length=100, nullable=true)
     */
    private $fieldDate;

    /**
     * @var string
     *
     * @ORM\Column(name="prefijo_field_date", type="string", length=200, nullable=true)
     */
    private $prefijoFieldDate;

    /**
     * @var string
     *
     * @ORM\Column(name="field_name", type="string", length=100, nullable=true)
     */
    private $fieldName;

    /**
     * @var string
     *
     * @ORM\Column(name="prefijo_field_name", type="string", length=200, nullable=true)
     */
    private $prefijoFieldName;


    /**
     * @var string
     *
     * @ORM\Column(name="field_search", type="string", length=100, nullable=true)
     */
    private $fieldSearch;

    /**
     * @var string
     *
     * @ORM\Column(name="prefijo_field_search", type="string", length=200, nullable=true)
     */
    private $prefijoFieldSearch;

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


    public function getOrderBy()
	{
		return $this->orderBy;
    }
    
	public function getFieldDate() 
	{
		return $this->fieldDate;
	}

    public function getPrefijoFieldDate()
	{
		return $this->prefijoFieldDate;
    }
    
	public function getFieldName()
	{
		return $this->fieldName;
	}

    public function getPrefijoFieldName()
	{
		return $this->prefijoFieldName;
	}

	public function getFieldSearch()
	{
		return $this->fieldSearch;
	}

    public function getPrefijoFieldSearch()
	{
		return $this->prefijoFieldSearch;
    }
    
    public function getActive()
	{
		return $this->active;
	}

    public function getArray()
	{
        $Campos = array(
            "Code" => $this->code,
            "RdfType" => $this->rdfType,
            "OrderBy" => $this->orderBy,
            "FieldDate" => $this->fieldDate,
            "PrefijoFieldDate" => $this->prefijoFieldDate,
            "FieldName" => $this->fieldName,
            "PrefijoFieldName" => $this->prefijoFieldName,
            "FieldSearch" => $this->fieldSearch,
            "PrefijoFieldSearch" => $this->prefijoFieldSearch,
            "Active" => $this->active);
		return  $Campos;
    }
    
    public function getArrayData()
	{
        $Campos = array(
            "RdfType" => $this->rdfType,
            "OrderBy" => $this->orderBy,
            "FieldDate" => $this->fieldDate,
            "PrefijoFieldDate" => $this->prefijoFieldDate,
            "FieldName" => $this->fieldName,
            "PrefijoFieldName" => $this->prefijoFieldName,
            "FieldSearch" => $this->fieldSearch,
            "PrefijoFieldSearch" => $this->prefijoFieldSearch);
		return  $Campos;
	}

}








