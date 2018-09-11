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
        if (localBody.hasClass('facetas-mostrar')) {
          lanzarCharts.init();
          localBody.removeClass('facetas-mostrar');
        } else {
          lanzarCharts.init();
          localBody.addClass('facetas-mostrar');
        }
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

      if (facetedSearchBox.length > 0){
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
      if (img.length > 0 && span.length  == 0){
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

/*
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
      google.charts.setOnLoadCallback(graficoTemas);
      google.charts.setOnLoadCallback(graficoEntidades);
      google.charts.setOnLoadCallback(graficoLugares);

      return;
  }
};
*/
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

    var aLiNav = localBody.find('.row-menu-secundario nav > li > a');

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
  
  if (body.hasClass('fichaComunidad')){
    accionesFicha.init();
    mostrarRestoDatosFicha.init();
  }else if (body.hasClass('listadoComunidad')){
    comportamientoFacetas.init();
  //  lanzarCharts.init();
  }else if (body.hasClass('homeSubbloque')){
    mapaComarcas.init();
  }else if (body.hasClass('homeBloque')){
    recortarDescBodyBloque.init();
  }

});
