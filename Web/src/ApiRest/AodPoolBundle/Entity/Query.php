<?php

namespace ApiRest\AodPoolBundle\Entity;

use Swagger\Annotations as SWG;

/**
 * AodPool
 *
 * @SWG\Definition(
 *   definition="AodPoolQuery",
 *   type="object",
 *   @SWG\Xml(name="AodPoolQuery"),
 * )
 */
class Query
{
   
	/** 
     *  @var string
	 * */
	private $filters = "";

    /** 
     *  @var integer
	 * */
    private $page = "";
    
    /** 
     *  @var integer
	 * */
    private $pageSize = "";


    /** 
     *  @var string
	 * */
	private $orderBy = "";


	/**
	* Set Filters
	* @param string
	*/
	public function setFilters($filters) 
	{
		$this->filters = $filters;
	}

	/**
	* Get Filters
	* @return string 
	*/
	public function getFilters() 
	{
		return $this->filters;
    }
    

	/**
	* Set Page
	* @param string
	*/
	public function setPage($page)
	{
		$this->page = $page;
	}

	/**
	* Get Page
	* @return string 
	*/
	public function getPage()
	{
		return $this->page;
	}

	/**
	* Set PageSize
	* @param string
	*/
	public function setPageSize($pageSize)
	{
		$this->pageSize = $pageSize;
	}

	/**
	* Get PageSize
	* @return string 
	*/
	public function getPageSize()
	{
		return $this->pageSize;
	}

        /**
	* Set OrderBy
	* @param string
	*/
	public function setOrderBy($orderBy)
	{
		$this->orderBy = $orderBy;
	}

	/**
	* Get OrderBy
	* @return string 
	*/
	public function getOrderBy()
	{
		return $this->orderBy;
	}
	
}
