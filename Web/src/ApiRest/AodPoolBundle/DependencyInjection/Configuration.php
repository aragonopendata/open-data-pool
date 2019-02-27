<?php
namespace ApiRest\AodPoolBundle\DependencyInjection;
 
use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;
 
class Configuration implements ConfigurationInterface
{
    public function getConfigTreeBuilder()
    {
        $treeBuilder = new TreeBuilder();
        $rootNode = $treeBuilder->root('api_rest_aod_pool');
        $rootNode
            ->children()
                ->arrayNode('api_consulta')
                    ->children()
                        ->scalarNode('url_prefijo')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('email_to')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('email_from')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('smtp_encryption') 
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('smtp_host')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('smtp_port')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('smtp_username')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('smtp_password')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('mail_file')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('isql_host')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('isql_db')
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('isql_tam_buffer_lineas')
                            ->cannotBeEmpty()
                        ->end()   
                        ->scalarNode('trazas_debug')
                            ->cannotBeEmpty()
                        ->end()                     
                    ->end()
                ->end()
            ->end();
        return $treeBuilder;
    }
}
