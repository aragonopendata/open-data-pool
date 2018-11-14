function enviaEntidad(entidad) {
    var path =  document.getElementById('path').defaultValue + "?";
    var tem = "tem=" +  document.getElementById('tem').defaultValue + "&"; 
    var stem = "stem=" +  document.getElementById('stem').defaultValue + "&";
    var pro = "pro=" + document.getElementById('pro').defaultValue + "&";
    var com = "com=" + document.getElementById('com').defaultValue + "&";
    var mun = "mun=" + document.getElementById('mun').defaultValue + "&";
    var ent = "ent=" + entidad.id + "&";
    var sent = "sent=" + "&";
    var from = "from=Entidades";

    var newLocation =  path + tem + stem + pro + com +mun + ent + sent + from;
    window.location.href = newLocation;
}

jQuery(document).ready(function () {
    $('.js-lugares').select2({
       theme: "bootstrap",
       placeholder: "Seleccione Lugar:",
       allowClear: true,
    });

    $('.js-municipio').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidad("",data.id,"");
    });

    $('.js-provincia').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidad(data.id,"","");
    });

    $('.js-comarca').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidad("","",data.id);
    });
	
	$('.js-municipio-bis').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidadBis("",data.id,"");
    });

    $('.js-provincia-bis').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidadBis(data.id,"","");
    });

    $('.js-comarca-bis').on('select2:select', function (e) {
        var data = e.params.data;
        enviaLocalidadBis("","",data.id);
    });

    jQuery('.bloque-mapa').removeClass('ocultar-bloque');
    jQuery('#vmap').vectorMap({
        map: 'aragon_es',
        enableZoom: false,
        showTooltip: true,
        backgroundColor: '#fcfcfa',
        selectedColor: '#aaaaaa',
        hoverColor: '#dada0d',
        color: '#fcfcfb',
        borderColor: '#dada0d',
        borderWidth: 3,
        onResize: function (element, width, height) {
            console.log('Map Size: ' +  width + 'x' +  height);
            element.visible= true;
        },
        onRegionClick: function(element, code, region)
        {
			var homeBloque = document.getElementsByClassName('homeBloque');
			if(homeBloque.length > 0){
				enviaLocalidadBis("","",code.toUpperCase());
			} else{
				enviaLocalidad("","",code.toUpperCase());
			}
			
            //enviaLocalidad("","",code.toUpperCase());
        }
    });
    jQuery('.bloque-mapa').addClass('ocultar-bloque');
  });

function enviaLocalidadBis(pro,mun,com) {
        var path =  document.getElementById('pathLugares').defaultValue + "?";
        var tem = "tem=" + document.getElementById('tem').defaultValue  + "&";
        var stem = "stem=" + document.getElementById('stem').defaultValue  + "&";
        var pro = "pro=" + pro + "&";
        var com = "com=" + com + "&";
        var mun = "mun=" + mun + "&";
        var ent = "ent=" + document.getElementById('ent').defaultValue + "&";
        var sent = "sent=" +  document.getElementById('sent').defaultValue + "&";
        var from = "from=" + document.getElementById('from').defaultValue;            
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }  
  
  function enviaLocalidad(pro,mun,com) {
        var path =  document.getElementById('path').defaultValue + "?";
        var tem = "tem=" + document.getElementById('tem').defaultValue  + "&";
        var stem = "stem=" + document.getElementById('stem').defaultValue  + "&";
        var pro = "pro=" + pro + "&";
        var com = "com=" + com + "&";
        var mun = "mun=" + mun + "&";
        var ent = "ent=" + document.getElementById('ent').defaultValue + "&";
        var sent = "sent=" +  document.getElementById('sent').defaultValue + "&";
        var from = "from=" + document.getElementById('from').defaultValue;            
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }
 function enviaLocalidadSubtema(stem) {
        var path =  document.getElementById('path').defaultValue + "?";
        var tem = "tem=" + document.getElementById('tem').defaultValue  + "&";
        var stem = "stem=" + stem + "&";
        var pro = "pro="  + "&";
        var com = "com="  + "&";
        var mun = "mun="  + "&";
        var ent = "ent=" + document.getElementById('ent').defaultValue + "&";
        var sent = "sent=" +  document.getElementById('sent').defaultValue + "&";           
        var from = "from=" + document.getElementById('from').defaultValue;           
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }
 function enviaLocalidadEntidad(ent) {
        var path =  document.getElementById('path').defaultValue + "?";
        var tem = "tem=" + document.getElementById('tem').defaultValue  + "&";
        var stem = "stem=" + document.getElementById('stem').defaultValue  + "&";
        var pro = "pro="  + "&";
        var com = "com="  + "&";
        var mun = "mun="  + "&";
        var ent = "ent=" + ent + "&";
        var sent = "sent=" +  document.getElementById('sent').defaultValue + "&";
        var from = "from=" + document.getElementById('from').defaultValue;           
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }

 function enviaTema(tema) {
    var path =  document.getElementById('path').defaultValue + "?";
    var tem = "tem=" +  tema.id + "&";
    var stem = "stem=" + "&";
    var pro = "pro=" + document.getElementById('pro').defaultValue + "&";
    var com = "com=" + document.getElementById('com').defaultValue + "&";
    var mun = "mun=" + document.getElementById('mun').defaultValue + "&";
    var ent = "ent=" + document.getElementById('ent').defaultValue + "&";
    var sent = "sent=" +  document.getElementById('sent').defaultValue + "&";;
    var from = "from=Temas";
    var newLocation =  path + tem + stem + pro + com +mun + ent + sent + from;
    window.location.href = newLocation;
    }

function enviaEntidadTema(tem) {
        var path =  document.getElementById('path').defaultValue + "?";
        var tem = "tem=" + tem  + "&";
        var stem = "stem=" + "&";
        var pro = "pro=" + document.getElementById('pro').defaultValue +  "&";
        var com = "com=" + document.getElementById('com').defaultValue +  "&";
        var mun = "mun="  + document.getElementById('mun').defaultValue +  "&";
        var ent = "ent=" + "&";
        var sent = "sent=" + "&";
        var from = "from=Lugares" ;
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }
 
 function enviaEntidadEntidad(ent) {
        var path =  document.getElementById('path').defaultValue + "?";
        var tem = "tem=" +  "&";
        var stem = "stem=" +  "&";
        var pro = "pro=" + document.getElementById('pro').defaultValue +  "&";
        var com = "com=" + document.getElementById('com').defaultValue +  "&";
        var mun = "mun="  + document.getElementById('mun').defaultValue +  "&";
        var ent = "ent=" + ent + "&";
        var sent = "sent=" + "&";
        var from = "from=Lugares" ;
        var newLocation =  path + tem + stem + pro + com + mun + ent + sent + from;
        window.location.href = newLocation;
 }