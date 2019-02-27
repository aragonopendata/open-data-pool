var accionesFicha = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    this.rowCabecera = this.body.find('.row-cabecera-ficha');
    return;
  },
  comportamiento: function(){

    var acciones = this.rowCabecera.find('.col-acciones');
    var toggle = acciones.find('.toggle-acciones');
    var ico = toggle.find('.material-icons');
    var menu = acciones.find('.menu-acciones');

    toggle.bind('click', function(){
      if (acciones.hasClass('open')){
        acciones.removeClass('open');
        ico.text('more_vert');
      }else{
        acciones.addClass('open');
        ico.text('close');
      }
    });

    return;
  }
};

var mapaComarcas = {
  init: function () {
      this.config();
      this.comportamiento();
      return;
  },
  config: function () {
      this.body = body;
      this.bloques = this.body.find('.bloques-wrap');
      this.tresBloquesPrincipales = this.bloques.find('.bloque-provincias, .bloque-municipios, .bloque-comarcas');
      this.bloquesMapa = this.bloques.find('.bloque-comarcas-min, .bloque-mapa');

      this.comarcas = this.bloques.find('.bloque-comarcas');
      this.mapa = this.bloques.find('.bloque-mapa');

      this.boton_mapa = this.comarcas.find('.enlace-mapa');
      this.boton_cerrar = this.mapa.find('.cerrar');
      return;
  },
  comportamiento: function () {
      var that = this;

      this.boton_mapa.bind('click', function (event) {
          
          if (that.tresBloquesPrincipales.hasClass('ocultar-bloque')) {
              that.tresBloquesPrincipales.removeClass('ocultar-bloque');
          } else {
              that.tresBloquesPrincipales.addClass('ocultar-bloque');
          }

          if (that.bloquesMapa.hasClass('ocultar-bloque')) {
              that.bloquesMapa.removeClass('ocultar-bloque');
          } else {
              that.bloquesMapa.addClass('ocultar-bloque');
          }

      });

      this.boton_cerrar.on('click', function (event) {
          that.boton_mapa.trigger('click');
      });
      return;
  }
}

var comportamientoFacetas = {
  init: function () {
      this.config();
      this.mostrarOcultar();
      this.searchBox();
      this.desplegarNiveles();
      return;
  },
  config: function () {
      this.body = body;
      this.row_listado = this.body.find('.row-listado');
      this.boton = this.row_listado.find('.mostrar-ocultar-facetas');
      this.botonCerrarFacetas = this.row_listado.find('.col01 .header-facetas .col-toggle-facetas');
      this.panFacetas = this.row_listado.find('#panFacetas');

      return;
  },
  mostrarOcultar: function () {

      var localBody = this.body;
      var mascara = localBody.find('.mascaritaGenerica');

      this.boton.off('click');
      this.boton.on('click', function (e) {

        e.preventDefault();
        /*if (localBody.hasClass('facetas-mostrar')) {
          lanzarCharts.init();
          localBody.removeClass('facetas-mostrar');
        } else {
          lanzarCharts.init();
          localBody.addClass('facetas-mostrar');
        }*/
        if (localBody.hasClass('facetas-mostrar-movil')){
          localBody.removeClass('facetas-mostrar-movil');
        }else{
          localBody.addClass('facetas-mostrar-movil');
        }
      });

      this.botonCerrarFacetas.unbind('click');
      this.botonCerrarFacetas.bind('click', function(e){
        e.preventDefault();
        localBody.removeClass('facetas-mostrar-movil');
      });

      mascara.bind('click', function(){
        localBody.removeClass('facetas-mostrar-movil');
      });

      return;
  },
  searchBox: function(){

    var facetaTitleBuscar = this.panFacetas.find('.faceta-title .material-icons');

    facetaTitleBuscar.unbind('click');
    facetaTitleBuscar.bind('click', function(e){

      e.preventDefault();
      var item = $(this);
      var box = item.parents('.box').first();
      var facetedSearchBox = box.find('.facetedSearchBox');

      if (facetedSearchBox.size() > 0){
        if (box.hasClass('search-open')){
          box.removeClass('search-open');
          item.text('search');
        }else{
          box.addClass('search-open');
          item.text('close');
          facetedSearchBox.find('input').focus();
        }
      }

    });

    return;
  },
  desplegarNiveles: function(){

    var listadoFacetas = this.panFacetas.find('.listadoFacetas');
    var lis = listadoFacetas.find('li');

    lis.each(function(){

      var li = $(this);
      var img = li.children('.imgMas');
      var span = li.children('.desplegar-faceta');
      
      if (img.length > 0 && span.length == 0){
        span = $('<span />').addClass('material-icons desplegar-faceta').text('keyboard_arrow_down');
        li.prepend(span);
        img.hide();
      }

      span.unbind('click');
      span.bind('click', function(){
        img.trigger('click');
      });

    });

    return;
  }
}

var lanzarCharts = {
  init: function () {
      this.config();
      this.comportamiento();

      return;
  },
  config: function () {
      this.body = body;

      return;
  },
  comportamiento: function () {
      google.charts.load('current', { 'packages': ['treemap'] });
      //google.charts.setOnLoadCallback(graficoTemas);
      google.charts.setOnLoadCallback(graficoEntidades);
      google.charts.setOnLoadCallback(graficoLugares);

      return;
  }
};

var panelMenu = {
  init: function(){
    this.config();
    this.comportamiento();
    return; 
  },
  config: function(){
    this.body = body;
    return;
  },
  comportamiento: function(){

    var localBody = this.body;
    var toggleMenu = localBody.find('.col-toggle-menu span');
    var mascara = localBody.find('.mascaritaGenerica');

    toggleMenu.bind('click', function(){

      if (localBody.hasClass('panelMenuVisible')){
        localBody.removeClass('panelMenuVisible');
      }else{
        localBody.addClass('panelMenuVisible');
      }

    });

    mascara.bind('click', function(){
      localBody.removeClass('panelMenuVisible');
    });

    return;
  }
};

var menuSecundario = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    return;
  },
  comportamiento: function(){
    var localBody = this.body;
    var aMenu = localBody.find('a.aMenu');

    aMenu.bind('click', function(){
      if (localBody.hasClass('menuSecundarioVisible')){
        localBody.removeClass('menuSecundarioVisible');
      }else{
        localBody.addClass('menuSecundarioVisible');
      }
    });

    var aLiNav = localBody.find('.row-menu-secundario > ul > li > a');

    aLiNav.bind('click', function(e){

      e.preventDefault();
      var padre = $(this).parent();
      if (padre.hasClass('open')){
        padre.removeClass('open');
      }else{
        padre.addClass('open');
      }

    });

    return;
  }
};

var recortarDescBodyBloque = {
  init: function(){
    this.config();
    this.recortar();
    return;
  },
  config: function(){
    this.body = body;
    this.bloques = this.body.find('.bloque-texto');
    return;
  },
  recortar: function(){

    var bodysBloque = this.bloques.find('.body-bloque');

    bodysBloque.each(function(){

      var item = $(this);
      var h3 = item.find('h3');
      var p = item.find('p');

      var itemH = item.height();
      var h3H = h3.outerHeight(true);
      
      var calc = itemH - h3H;

      p.dotdotdot({
        height: calc
      });

    });

    return;
  }
};

var mostrarRestoDatosFicha = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    this.rowContenido = this.body.find('.row-contenido');
    return;
  },
  comportamiento: function(){

    var restoDatos = this.rowContenido.find('.resto-datos');
    var enlace = this.rowContenido.find('.mostrar-resto-datos');

    enlace.bind('click', function(e){

      e.preventDefault();
      if (restoDatos.hasClass('open')){
        restoDatos.removeClass('open');
      }else{
        restoDatos.addClass('open');
      }

    });

    return;
  }
};

var verTodosFacetas = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    this.modal = this.body.find('#modalFacetas');
    this.panFacetas = this.body.find('#panFacetas');
    return;
  },
  comportamiento: function(){

    var that = this;
    var modal = this.modal;
    var headerModal = this.modal.find('.modal-header');
    var bodyModal = this.modal.find('.modal-body');
    var inputBuscar = bodyModal.find('.buscador-modal input');

    var bloquesFacetas = this.panFacetas.find('#idComarcas, #idMunicipios, #idPartido, #idCargo');

    bloquesFacetas.each(function(){

      var bloque = $(this);
      var section = bloque.find('.section');
      var lis = section.find('ul > li');

      if (lis.length > 4){

        var verTodos = $('<a />').addClass('ver-todas-facetas').text('Ver todos');

        section.append(verTodos);

        lis.each(function(i){
          if (i > 3) $(this).addClass('oculto');
        });

        verTodos.bind('click', function(e){

          var modalTitle = headerModal.find('.modal-title');
          var lista = bodyModal.find('.lista-modal');
          var ulClone = lis.parent().clone(true, true);
          var id = bloque.attr('id').replace('id', '');

          modalTitle.text(id);
          lista.children().remove();
          ulClone.find('li').removeClass('oculto');
          lista.append(ulClone);
          modal.modal('show');

          that.eventoBuscar();

        });

      }

    });

    return;
  },
  eventoBuscar: function(){

    var that = this;
    var bodyModal = this.modal.find('.modal-body');
    var inputBuscar = bodyModal.find('.buscador-modal input');

    inputBuscar.unbind('keyup');
    inputBuscar.bind('keyup input', function() {
        var item = $(this);
        var itemVal = item.val();
        that.buscar(itemVal);
    });

    return;
  },
  buscar: function(valor){

    var bodyModal = this.modal.find('.modal-body');
    var lista = bodyModal.find('.lista-modal li');

    lista.each(function(indice) {
      var item = $(this);
      var enlaceItem = item.children('a');
      var itemText = enlaceItem.text();

      item.removeClass('oculto');

      if (itemText.toLowerCase().indexOf(valor.toLowerCase()) < 0) {
          item.addClass('oculto');
      } else {
          item.parents('.oculto').removeClass('oculto');
      }

    });

    return;
  }
};

var headerMinScroll = {
	posicionAnterior: 0,
	obj_top: 0,
	init: function () {
		this.config();
		this.scroll();
		return;
	},
	config: function () {
		this.body = body;
		return;
	},
	scroll: function () {
		var that = this;
		$(window).scroll(function () {
			that.lanzar();
		});
		return;
	},
	lanzar: function () {
		var obj = $(window);
		this.posicionAnterior = this.obj_top;
		this.obj_top = obj.scrollTop();
		if (/*this.obj_top < this.posicionAnterior || */this.obj_top <= 10) {
			this.body.removeClass("headerMin");
		} else {
			this.body.addClass("headerMin");
		}
		return;
	}
};

var marginTopHome = {
  init: function(){
    var busqueda = body.find('.sliderPrincipal');

    if (busqueda) body.addClass('margen');

  }
};

var enlazarBloquesMin = {
  init: function(){

    var bloques = body.find('.col.bloque-min');
    bloques.each(function(e){
      
      var item = $(this);
      if (!item.hasClass('bloque-provincias') && !item.hasClass('bloque-municipios') && !item.hasClass('bloque-comarcas')){
        var enlace = item.find('.titulo a').first();

        enlace.bind('click', function(e){
          
          if ($(this).attr('onclick') != undefined){
            e.stopPropagation();
          }else{
            window.location.href = $(this).attr('href');
          }
        });

        item.unbind('click');
        item.bind('click', function(e){
          e.preventDefault();
          e.stopPropagation();
          enlace.trigger('click');
        });
      }
    });

    return;
  }
};

var breadcrumbMovil = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    return;
  },
  comportamiento: function(){

    var width = this.body.width();

    if (width < 992){

      var breadcrumb = this.body.find('.breadcrumb');
      var wrap = breadcrumb.children('.wrap');
      var p = wrap.children('p');

      if (p.length > 0){

        var spanAyuda = wrap.children('.ayuda');
        if (spanAyuda.length == 0){

          spanAyuda = $('<span />').addClass('ayuda');

          wrap.append(spanAyuda);

          spanAyuda.bind('click', function(e){
            wrap.toggleClass('ayuda-open');
          });

        } 

      }

    }

    return;
  }
};

var filtrarMovil = {
  init: function(){
    this.config();
    this.comportamiento();
    return;
  },
  config: function(){
    this.body = body;
    this.wrapCol02 = this.body.find('.row-listado > .col02 > .wrapCol02');
    this.accionesListado = this.wrapCol02.children('.acciones-listado');
    return;
  },
  comportamiento: function(){

    var wrapfiltrar = $('<div />').addClass('wrap-filtrar');
    var form = this.accionesListado.children('form');

    var btn = $('<a />').addClass('mostrar-ocultar-facetas').text('Filtrar resultados');

    wrapfiltrar.append(form).append(btn);
    this.accionesListado.prepend(wrapfiltrar);

    return;
  }
};

var moverIframeAEMET = {
  init: function(){

    var iframeNormal = body.find('iframe.normal');
    var iframeMovil = body.find('iframe.movil');

    iframeMovil.parents('.gadget').hide();
    iframeMovil.insertAfter(iframeNormal);

    return;
  }
};

var buscarEnMenu = {
  init: function(){
    this.config();
    this.autocompletar();
    this.buscar();
    return;
  },
  config: function(){
    this.body = body;
    this.rowMenuSecundario = this.body.find('.row-menu-secundario');
    return;
  },
  autocompletar: function(){

    var input = this.rowMenuSecundario.find('#buscador_header');
    var resultsList = this.rowMenuSecundario.find('#resultsList');
    
    input.removeAttr('onkeyup');
    
    input.unbind('keyup');
    input.bind('keyup input', function() {
      var item = $(this);
      var val = item.val();
      
      if (val.length > 2){
        var urlpeticion = window.location.protocol + '//' + window.location.hostname + '/aod/services/web/datasets/autocomplete?text=' + val + '&limit=4';
        //var urlpeticion = 'https://preopendata.aragon.es/aod/services/web/datasets/autocomplete?text=' + val + '&limit=4';
        $.ajax({url: urlpeticion, success: function(result){
          
          var objeto = JSON.parse(result);
          var correcto = objeto.success;

          if (correcto){

            resultsList.children().remove();
            var ul = $('<ul />');
            var resultados = objeto.result;

            $.each(resultados, function(c,v){

              var field = v.match_field;
              var displayed = v.match_displayed;
              var name = v.name;
              var title = v.title;
              var urldestino = window.location.protocol + '//' + window.location.hostname + '/datos/catalogo/dataset/' + name;
              //var urldestino = 'https://preopendata.aragon.es/datos/catalogo/dataset/' + name;
              var a = $('<a />').text(title).attr('href', urldestino);
              var li = $('<li />').append(a);
              ul.append(li);
            });

            resultsList.append(ul);

          }


        }});
      }

    });

    return;
  },
  buscar: function(){

    var input = this.rowMenuSecundario.find('#buscador_header');
    var lupa = this.rowMenuSecundario.find('a.lupa');

    lupa.off('click').on('click', function(e){
      var val = input.val();
      var urlpeticion = window.location.protocol + '//' + window.location.hostname + '/datos/catalogo?texto=' + val;
      //var urlpeticion = 'https://preopendata.aragon.es/datos/catalogo?texto=' + val;
      window.location.href = urlpeticion;
    });

    input.keypress(function(e) {
      if(e.which == 13) {
        lupa.trigger('click');
      }
    });

    return;
  }
};

/*
var facetaCategorias = {
  init: function(){
    this.config();
    this.clonar();
    return;
  },
  config: function(){
    this.body = body;
    this.panFacetas = this.body.find('#panFacetas');
    this.categorias = this.panFacetas.find('#bbvao--about---bbvao--categoryNode');
    this.modalResultados = this.body.find('#modal-resultados');
    this.indiceLista = this.modalResultados.find('.indice-lista');
    return;
  },
  clonar: function(){

    this.indiceLista.children().remove();
    this.indiceLista.removeAttr('style');
    if (this.modalResultados.find('#bbvao--about---bbvao--categoryNode').size() > 0) return;
    var that = this;

    var clon = this.categorias.clone(true, true);
    clon.find('ul.listadoFacetas > li.oculto').removeClass('oculto');
    this.indiceLista.append(clon);


    var aFacetas = clon.find('a.faceta');
    var verTodos = this.modalResultados.find('.opciones .ver-todos');

    aFacetas.bind('click', function(){

      setTimeout(function(){
        verTodos.trigger('click');
      }, 100);

    });

    var desplegarSubFaceta = this.modalResultados.find('.desplegarSubFaceta i');
    var desplegarNiveles = $('<span />').addClass('desplegarNiveles').text('Desplegar niveles');
    clon.prepend(desplegarNiveles);

    desplegarNiveles.bind('click', function(){

      if (desplegarNiveles.hasClass('desplegados')){
        desplegarNiveles.removeClass('desplegados').text('Desplegar niveles');
        that.desplegarSubniveles(desplegarSubFaceta);
      }else{
        desplegarNiveles.addClass('desplegados').text('Plegar niveles');
        that.plegarSubniveles(desplegarSubFaceta);
      }

    });
    desplegarNiveles.trigger('click');
    aFacetas.attr('onclick', "$('#modal-resultados').modal('hide')");

    this.eventoBuscar();

    return;
  },
  eventoBuscar: function(){

    var that = this;
    var box = this.modalResultados.find('#bbvao--about---bbvao--categoryNode');
    var desplegables = this.modalResultados.find('.desplegarSubFaceta');
    var desplegarNiveles = this.modalResultados.find('.desplegarNiveles');
    var inputBuscador = this.modalResultados.find('.buscar .texto');

    inputBuscador.unbind('keyup');
    inputBuscador.bind('keyup input', function() {
        var item = $(this);
        var itemVal = item.val();
        box.removeClass('oculto');
        that.buscar(itemVal);
    });

    var desplegarSubFaceta = this.modalResultados.find('.desplegarSubFaceta i');

    inputBuscador.focusin(function(){

      //that.plegarSubniveles(desplegarSubFaceta);
      //desplegables.addClass('oculto');
      //desplegarNiveles.addClass('oculto');
      //box.addClass('oculto');

    });

    inputBuscador.focusout(function(){

      //that.desplegarSubniveles(desplegarSubFaceta);
      //desplegables.removeClass('oculto');
      //desplegarNiveles.removeClass('oculto');
      //box.removeClass('oculto');

    });

    return;
  },
  buscar: function(valor){

    var lista = this.modalResultados.find('.listadoFacetas li');

    lista.each(function(indice) {
        var item = $(this);
        //if (indice === 0) debugger;
        var enlaceItem = item.children('a');
        var itemText = enlaceItem.text();

        item.removeClass('oculto');

        if (itemText.toLowerCase().indexOf(valor.toLowerCase()) < 0) {
            item.addClass('oculto');
        } else {
            item.removeHighlight().highlight(valor);
            item.parents('.oculto').removeClass('oculto');
        }

    });

    return;
  },
  plegarSubniveles: function(desplegables){

    var desplegarNiveles = this.modalResultados.find('.desplegarNiveles');
    desplegarNiveles.addClass('desplegados').text('Plegar niveles');
    desplegables.each(function(){
      var desplegar = $(this);
      if (desplegar.text() == "keyboard_arrow_down") desplegar.trigger('click');
    });

    return;
  },
  desplegarSubniveles: function(desplegables){

    var desplegarNiveles = this.modalResultados.find('.desplegarNiveles');
    desplegarNiveles.removeClass('desplegados').text('Desplegar niveles');
    desplegables.each(function(){
      var desplegar = $(this);
      if (desplegar.text() == "keyboard_arrow_up") desplegar.trigger('click');
    });

    return;
  }
};*/

/* FUNCIONES GRÁFICOS */

function graficoTemas() {

  data = google.visualization.arrayToDataTable([
      ['Location', 'Parent', 'Market trade volume (size)', 'Market increase/decrease (color)'],
      ['Global', null, 0, 0],
      ['Impuestos, pagos y tasas (3421)', 'Global', 3421, 20],
      ['Derecho y justicia (543)', 'Global', 543, 10],
      ['Información al consumidor (213)', 'Global', 213, 0],
      ['Protección y seguridad ciudadana (56)', 'Global', 56, -10],
      ['Temas', 'Global', 0, -20]
  ]);

  if (document.getElementById('graficoTemas') != null){
    tree = new google.visualization.TreeMap(document.getElementById('graficoTemas'));
  
    tree.draw(data, {
        height: 420,
        minColor: '#FFD3B2',
        midColor: '#FF9A4C',
        maxColor: '#FF6F00',
        headerHeight: 0,
        textStyle: {
            color: '#FFF',
            fontSize: '16',
            bold: true
        },
        showScale: false
    });
  }

};

function graficoEntidades() {

  data = google.visualization.arrayToDataTable([
      ['Location', 'Parent', 'Market trade volume (size)', 'Market increase/decrease (color)'],
      ['Global', null, 0, 0],
      ['Entidad (3421)', 'Global', 3421, 20],
      ['Entidad (543)', 'Global', 543, 10],
      ['Entidad (213)', 'Global', 213, 0],
      ['Entidad (56)', 'Global', 56, -10],
      ['Entidad (10)', 'Global', 56, -20],
      ['Entidad', 'Global', 0, -20]
  ]);

  if (document.getElementById('graficoEntidades') != null){
    tree = new google.visualization.TreeMap(document.getElementById('graficoEntidades'));
  
    tree.draw(data, {
        height: 420,
        minColor: '#B2D0FF',
        midColor: '#4C94FF',
        maxColor: '#0066FF',
        headerHeight: 0,
        textStyle: {
            color: '#FFF',
            fontSize: '16',
            bold: true
        },
        showScale: false
    });
  }

};

function graficoLugares() {

  data = google.visualization.arrayToDataTable([
      ['Location', 'Parent', 'Market trade volume (size)', 'Market increase/decrease (color)'],
      ['Global', null, 0, 0],
      ['Lugares (3421)', 'Global', 3421, 20],
      ['Lugares (543)', 'Global', 543, 10],
      ['Lugares (213)', 'Global', 213, 0],
      ['Lugares (56)', 'Global', 56, -10],
      ['Lugares', 'Global', 0, -20]
  ]);

  if (document.getElementById('graficoLugares') != null){
    tree = new google.visualization.TreeMap(document.getElementById('graficoLugares'));
  
    tree.draw(data, {
        height: 420,
        minColor: '#EAEA98',
        midColor: '#E0E065',
        maxColor: '#CCCC00',
        headerHeight: 0,
        textStyle: {
            color: '#FFF',
            fontSize: '16',
            bold: true
        },
        showScale: false
    });
  }

};

/* COOKIES */

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
};

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
};

var body;

$(function(){

  body = $('body');

  panelMenu.init();
  menuSecundario.init();
  headerMinScroll.init();
  marginTopHome.init();
  buscarEnMenu.init();
  
  if (body.hasClass('fichaComunidad')){
    moverIframeAEMET.init();
    accionesFicha.init();
    mostrarRestoDatosFicha.init();
  }else if (body.hasClass('listadoComunidad')){
    filtrarMovil.init();
    comportamientoFacetas.init();
    //lanzarCharts.init();
    verTodosFacetas.init();
  }else if (body.hasClass('homeSubbloque')){
    mapaComarcas.init();
  }else if (body.hasClass('homeBloque')){
	 mapaComarcas.init();
    recortarDescBodyBloque.init();
  }

  enlazarBloquesMin.init();
  breadcrumbMovil.init();

});
