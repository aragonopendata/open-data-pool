<?php

namespace ApiRest\AodPoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Temas
 *
 * @ORM\Table(name="temas")
 * @ORM\Entity
 */
class Temas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="code", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="temas_code_seq", allocationSize=1, initialValue=1)
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
     * @ORM\Column(name="name_es", type="string", length=60, nullable=true)
     */
    protected $nameEs;

    /**
     * @var string
     *
     * @ORM\Column(name="name_en", type="string", length=60, nullable=true)
     */
    protected $nameEn;

    /**
     * @var string
     *
     * @ORM\Column(name="comment_es", type="string", length=200, nullable=true)
     */
    protected $commentEs;

    /**
     * @var string
     *
     * @ORM\Column(name="comment_en", type="string", length=200, nullable=true)
     */
    protected $commentEn;

          /**
     * @var string
     *
     * @ORM\Column(name="rdf_type", type="string", length=100, nullable=true)
     */
    protected $rdf_type;


    /**
     * @var integer
     *
     * @ORM\Column(name="parent_code", type="integer", nullable=false)
     */
    protected $parentCode;

    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean", nullable=false)
     */
    protected $active;

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

	public function getNameEs()
	{
		return $this->nameEs;
	}

	public function getNameEn()
	{
		return $this->nameEn;
	}

    public function getCommentEs()
	{
		return $this->commentEs;
	}

	public function getCommentEn()
	{
		return $this->commentEn;
	}

	public function getParentCode()
	{
		return $this->parentCode;
	}

    public function getRdf_type()
	{
		return $this->rdf_type;
    }

    public function getActive()
	{
		return $this->active;
	}

    public function getArray()
	{
        $tema = array(
            "Code" => $this->code,
            "Slug" => $this->slug,
            "NameEs" => $this->nameEs,
            "NameEn" => $this->nameEn,
            "CommentEs" => $this->commentEs,
            "CommentEn" => $this->commentEn,
            "ParentCode" => $this->parentCode,
            "rdfType" => $this->rdf_type,
            "Active" => $this->active);
		return  $tema;
	}

}
