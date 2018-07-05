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
class Rdf
{
   
	/** 
     *  @var string
	 * */
	private $uri = "";

	/**
	* Set Filters
	* @param string
	*/
	public function setUri($uri) 
	{
		$this->uri = $uri;
	}

	/**
	* Get Filters
	* @return string 
	*/
	public function getUri() 
	{
		return $this->uri;
    }
	
}
