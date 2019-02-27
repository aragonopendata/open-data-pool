<?php // File: AodPool/src/ApiRest/AodPoolBundle/Form/Type/AodPoolType.php
      

namespace ApiRest\AodPoolBundle\Form\Type;

use Symfony\Component\Form\AbstractType; 
use Symfony\Component\Form\FormBuilderInterface; 
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use nelmio\apidocbundle\util\LegacyFormHelper;


class RdfType extends AbstractType 
{ 
    public function getBlockPrefix()
    {
        return "";
    }

    /**
     * Get name
     * @return string
     */
    public function getName()
    {
        return $this->getBlockPrefix();
    }

	/** 
     * @param FormBuilderInterface  $builder 
     * @param array                 $options 
    */ 
	public function buildForm(FormBuilderInterface $builder, array $options) 
	{ 
        $builder
        ->add('uri',TextType::class,
            [
                'required' => true,
                'description' => "URI de la entidad a descargar",
                
            ]
        );
    }

	/**
	 * @param OptionsResolver $resolver
	 */
	public function configureOptions(OptionsResolver $resolver)
	{

	    $resolver->setDefaults(
            [
                'csrf_protection' => false,
                'mapped' => false,
                'allow_extra_fields' => true,
                'data_class' => 'ApiRest\AodPoolBundle\Entity\Rdf',
            ]
	    );
	}
}


