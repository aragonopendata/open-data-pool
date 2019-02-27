<?php

namespace ApiRest\AodPoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Lugares
 *
 * @ORM\Table(name="lugares")
 * @ORM\Entity
 */
class Lugares
{
    /**
     * @var integer
     *
     * @ORM\Column(name="code", type="integer", nullable=false)
     * @ORM\Id
     */
    protected $code;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=50, nullable=true)
     */
    protected $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=60, nullable=true)
     */
    protected $name;

    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=1, nullable=true)
     */
    protected $type;

    /**
     * @var integer
     *
     * @ORM\Column(name="comarca_code", type="integer", nullable=true)
     */
    protected $comarcaCode;

    /**
     * @var integer
     *
     * @ORM\Column(name="provincia_code", type="integer", nullable=true)
     */
    protected $provinciaCode;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="date", nullable=false)
     */
    protected $created = 'now()';


	public function getCode()
	{
		return $this->code;
	}


	public function getSlug()
	{
		return $this->slug;
	}

	public function getName()
	{
		return $this->name;
	}

	public function getType()
	{
		return $this->type;
	}

    public function getComarcaCode()
	{
		return $this->comarcaCode;
	}

	public function getProvinciaCode()
	{
		return $this->provinciaCode;
	}

   
    public function getArray()
	{
        $lugar = array(
            "Code" => $this->code,
            "Slug" => $this->slug,
            "Name" => $this->name,
            "Type" => $this->type,
            "ComarcaCode" => $this->comarcaCode,
            "ProvinciaCode" => $this->provinciaCode);
		return  $lugar;
	}


}
