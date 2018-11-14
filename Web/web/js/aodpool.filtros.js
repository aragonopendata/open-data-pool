$(document).ready(function() {        
    $('a#ordenaListaMenu').bind('click', function(e) {    
         var panResultados = $('div[name=panResultados]');
         var listView  =  $('li[name=listView]'); 
         var panGraficos = $('div[name=panGraficos]');
         var lisGraphic = $('li[name=lisGraphic]');
         var styloActual = $(panResultados).css("display");
         if (styloActual=="none") {
              $(panResultados).css("display","block");
              $(panGraficos).css("display","none");
              $(lisGraphic).removeClass('activeView');
              $(listView).addClass("activeView");
         } 
        
        var url = $(this).attr('href');                    
        tmpval = $('input[name=ordajax]').val();
        camporden = "ordc=" + $('input[name=ordcajax]').val();
        if(tmpval == '') {
            $('input[name=ordajax]').val("DESC");
            url = url.concat("&ord=DESC");
        } else if (tmpval == 'ASC')  {
                $('input[name=ordajax]').val("DESC");
                if (url.search("ord=ASC")>0) {
                    url = url.replace("ord=ASC",'ord=DESC');
                } else {
                    url = url.concat("&ord=DESC");
                }
            } else if (tmpval == 'DESC') {
                $('input[name=ordajax]').val("ASC"); 
                if (url.search("ord=ASC")>0) {
                    url = url.replace("ord=DESC",'ord=ASC');
                } else {
                    url = url.concat("&ord=ASC");
                } 
        }
        if (camporden.length>0) {
                url = url.replace("ordc=",camporden);
        }
        $('input[name=lasturl]').val(url);
        $('div#panResultados').load(url); // load the html response into a DOM element
        e.preventDefault(); // stop the browser from following the link
    });
    $('a#verGraficosMenu').bind('click', function(e) {     
        e.preventDefault();      
         var panResultados = $('div[name=panResultados]');
         var listView  =  $('li[name=listView]'); 
         var panGraficos = $('div[name=panGraficos]');
         var lisGraphic = $('li[name=lisGraphic]');
         var styloActual = $(panGraficos).css("display");
         if (styloActual=="none") {
              $(panResultados).css("display","none");
              $(panGraficos).css("display","block");
              $(lisGraphic).addClass('activeView');
              $(listView).removeClass("activeView");
         } 
    });

    $('a#verListadoMenu').bind('click', function(e) {     
        e.preventDefault();      
         var panResultados = $('div[name=panResultados]');
         var listView  =  $('li[name=listView]'); 
         var panGraficos = $('div[name=panGraficos]');
         var lisGraphic = $('li[name=lisGraphic]');
         var styloActual = panResultados.css("display");
         if (styloActual=="none") {
              $(panResultados).css("display","block");
              $(panGraficos).css("display","none");
              $(lisGraphic).removeClass('activeView');
              $(listView).addClass("activeView");
         } 
    });
    
    $('a[id^="ordenacion"]').bind('click', function(e) {           
        var url = $(this).attr('href');  
        var enlace  = $(this).attr('id'); 
        if (enlace == "ordenacionFecha") {
            url = url.replace("ordc=",'ordc=?date');
            $('input[name=ordcajax]').val("?date");
            $('a#dropdownOrdenacion').text("Ordenar por fecha");
        } else if  (enlace == "ordenacionNombre") {
            url = url.replace("ordc=",'ordc=?name');
            $('input[name=ordcajax]').val("?name");
            $('a#dropdownOrdenacion').text("Ordenar por nombre");
        } else if (enlace == "ordenacionRelevancia") {
            url = url.replace("ordc=",'ordc=?scoreText');
            $('input[name=ordcajax]').val("?scoreText");
            $('a#dropdownOrdenacion').text("Ordenar por relevancia");
        } else {
            url = $(this).attr('href'); 
            $('input[name=ordcajax]').val("?name");
            $('a#dropdownOrdenacion').text("Ordenar por relevancia");
        }  
        $('input[name=ordajax]').val("ASC");
        $('input[name=lasturl]').val(url);
        $('div#panResultados').load(url); // load the html response into a DOM element
        e.preventDefault(); // stop the browser from following the link
    });
    $('span[id^="desplegar_"]').bind('click', function(e) { 
        elemento="ul[id=" + this.id.replace("desplegar_","") + "]"
        styloActual = $(elemento).css("display");
        if (styloActual=="none") {
            $(elemento).css("display","block");
        } else {
            $(elemento).css("display","none");
        }
        e.preventDefault(); 
    });  
    var win = $(window);
    // Each time the user scrolls
    win.scroll(function() {
        // End of the document reached?
        if ($(document).height() - win.height() == win.scrollTop()) {
            var offset = $('.resource').length; 
            var resulados =  $('#numResultadosspan').text();
            if (resulados - offset >0) {
                var urlpaginado = $('input[name=lasturl]').val() + "&pag=" + offset;
                $.ajax({
                    url: urlpaginado,
                    dataType: 'html',
                    success: function(html) {
                        $('div#panResultados').append(html); 
                    }
                });  
            }
        }
        
    });                   
});