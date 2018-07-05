function DameMapa(markers,long,lat,marker,pzoom)
{
    var jsonmarkers = unescape(markers);
    
    var mk = JSON.parse(jsonmarkers);
    return function()
    {    
        var container = document.getElementById('popup');
        var content = document.getElementById('popup-content');
        var closer = document.getElementById('popup-closer');
        
        var overlay = new ol.Overlay({
            element: container,
            autoPan: true,
            autoPanAnimation: {
                duration: 250
            }
        });
        
        var view = new ol.View({
            center: ol.proj.fromLonLat([parseFloat(long),parseFloat(lat)]),
            zoom: pzoom  
        });
        
        var map = new ol.Map({
            controls: ol.control.defaults().extend([
                new ol.control.OverviewMap(),
                new ol.control.Attribution(),
                new ol.control.FullScreen()
            ]),
            layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM(),
                })
            ],
            target: 'map',
            overlays: [overlay],
            view: view 
        });
        
        map.on('singleclick', function(evt) {
            var name = map.forEachFeatureAtPixel(evt.pixel, function(feature) {
            return feature.get('text'); 
        });
        
        var coordinate = evt.coordinate;
        content.innerHTML = name;
            overlay.setPosition(coordinate);
        });
        
        map.on('pointermove', function(evt) {
            map.getTargetElement().style.cursor = map.hasFeatureAtPixel(evt.pixel) ? 'pointer' : '';
        });
        
        var busfeatures = new Array();
        var feature = null;
        var i=0;
        for(var k in mk) {
            feature= new ol.Feature({
                geometry: new ol.geom.Point(ol.proj.fromLonLat([mk[k].log,mk[k].lat])),
                text: mk[k].texto
            })
            busfeatures[i]=feature;
            i++;
        }
        var markers = new ol.layer.Vector({
            source: new ol.source.Vector({
                features : busfeatures
            }),
            style: new ol.style.Style({
                image: new ol.style.Icon({
                    src: 'img/'+ marker,
                    anchor: [0.5, 1]
                })
            })
        });
        map.addLayer(markers);
        
        closer.onclick = function() {
            overlay.setPosition(undefined);
            closer.blur();
            return false;
        }; 
    }
}

