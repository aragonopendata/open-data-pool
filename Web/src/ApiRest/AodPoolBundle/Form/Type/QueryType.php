<?php // File: AodPool/src/ApiRest/AodPoolBundle/Form/Type/AodPoolType.php
      

namespace ApiRest\AodPoolBundle\Form\Type;

use Symfony\Component\Form\AbstractType; 
use Symfony\Component\Form\FormBuilderInterface; 
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use nelmio\apidocbundle\util\LegacyFormHelper;


class QueryType extends AbstractType 
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
        ->add('filters',TextType::class,
            [
                'required' => true,
                'description' => "Lista de los filtros que se añaden a la consulta 
                 Notas a la parametrización: 
                1.-Los nombres de los filtros no admiten prefijos. 
                2.-Los nombres de los filtros no deben llevar limitadores '<' '>'.
                3.-Los nombres de los filtros admiten anidamiento por @ y reverso por $ dela primara condición anidada.
                4.-Los valores de los filtros han de llevar comillas o limadores '<' '>' si son necesarios para la consulta sparql.
                5.-Los filtros ha de separase por '|' ejemplo: filtro1=valor1|filtro2=valor2", 
            ])
        ->add('page',TextType::class,
            [
                'required' => true,
                'description' => "Nº de la página de resultados. Paginación de resultados",
            ])
        ->add('pageSize',TextType::class,
            [
                'required' => true,
                'description' => "Cantidad de registros por página. Paginación de resultados",
            ])
        ->add('orderBy',TextType::class,
            [
                'required' => false,
                'description' => "Campo por el que se desea ordenar.
                Notas a la parametrización: 
                1.-El capo de ordenación se incluye en los filtros sparql. 
                2.-No deben llevar limitadores '<' '>'.",
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
                'data_class' => 'ApiRest\AodPoolBundle\Entity\Query',
            ]
	    );
	}
}


