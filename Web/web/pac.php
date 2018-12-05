<!DOCTYPE html>
<html lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Aragon Open Data</title>
		<link href="img/favicon.ico" rel="icon" type="image/x-icon">		
		<!-- PERSONALIACION COMUNIDAD -->
		<!-- CARRUSEL -->
		<link href="css/owl.carousel.css"  rel="stylesheet" type="text/css">
		<!-- FUENTES -->
		<link href="css/fonts.googleapis.com.css"  rel="stylesheet">
		<link href="css/fonts.googleapis.ico.com.css"  type="text/css" rel="stylesheet"  media="all">

		<!-- TETHER -->
		<link href="css/tether.min.css"  rel="stylesheet" type="text/css">
		<!-- BOOTSTRAP 4 -->
		<link href="css/bootstrap.min.css"  rel="stylesheet" type="text/css">
		<!-- DATATABLES -->
		<link href="css/datatables.min.css"  rel="stylesheet" type="text/css">
		<!-- PERSONALIZACION TEMA -->
		<link href="css/theme.css"  rel="stylesheet" type="text/css">
		<link href="css/theme1.css"  rel="stylesheet" type="text/css">
		<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
		
		<!-- FONT AWESOME -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<!-- JQUERY -->
		<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script> 
		<!-- DOTDOTDOT -->
		<script type="text/javascript" src="js/jquery.dotdotdot.min.js" ></script> 
		<!-- CARRUSEL  -->
		 <script type="text/javascript" src="js/owl.carousel.min.js" ></script>
		<!-- TETHER -->
		<script type="text/javascript" src="js/tether.min.js" ></script>
		<!-- BOOTSTRAP 4 -->
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<!-- DATATABLES -->
		<script type="text/javascript" src="js/datatables.min.js" ></script>
		<!-- PERSONALIZACION TEMA -->
		<script type="text/javascript" src="js/theme.js" ></script>
		
		
		
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="robots" content="noindex,nofollow">
	</head>
	
	<body class="pagina pagina-pac">

		<header>
			<div class="container-fluid">
				<div class="row row-principal">
					<div class="col col-4 col-sm-6">
						<img src="img/logo-gobierno.png" alt="Logo gobierno de Aragón" title="Logo gobierno de Aragón">
						<img src="img/logo-europa.png" alt="Logo Fondo Europeo de Desarrollo Regional" title="Logo Fondo Europeo de Desarrollo Regional">
					</div>
					<div class="col col-8 col-sm-6">
						<ul>
							<li><a href="/" class="col-3 active">Open data</a></li>
							<li><a href="http://aragonparticipa.aragon.es" target="_blank" class="col-6">Participación ciudadana</a></li>
							<li><a href="http://transparencia.aragon.es/" target="_blank" class="col-3">Transparencia</a></li>
						</ul>
					</div>
				</div>
				<div class="row row-secundaria">
					<a href="/" class="logo">
						<img src="img/aragon-open-data.png" alt="Aragón Open Data" title="Aragón Open Data" class="azul">
						<img src="img/aragon-open-data-blanco.png" alt="Aragón Open Data" class="blanco">
					</a>
					<div class="menuLogin">
						<a class="aLogin" href="https://opendata.aragon.es/login" title="Acceso plataforma"></a>
					</div>
					<div class="menu">
						<a class="aMenu" title="Menu principal"></a>
					</div>
				</div>
				<div class="row-menu-secundario">
					<ul>
						<li>
							<a href="#" title="Datos">Datos</a>
							<ul>
								<li><a href="/datos/catalogo" onclick="openNav()">Banco de datos</a></li>
								<li><a href="/datos/tema" onclick="openNav()">Temas</a></li>
								<li><a href="/datos/organizacion" onclick="openNav()">Publicadores</a></li>
							</ul>
						</li>
						<li>
							<a href="#" title="Servicios">Servicios</a>
							<ul>
								<li><a href="/servicios/aragopedia">Aragopedia</a></li>
								<li><a href="http://presupuesto.aragon.es/">Presupuestos</a></li>
								<li><a href="/servicios/analytics">Open Analytics Data</a></li>
								<li><a href="/servicios/open-social-data">Open Social Data</a></li>
								<!--<li><a href="/servicios/visualdata">Open Visual Data</a></li>-->
								<li><a href="/servicios/cras">CRAs Aragón</a></li>
							</ul>
						</li>
						<li>
							<a href="#" title="Información">Información</a>
							<ul>
								<li><a href="/informacion/open-data" onclick="openNav()">Información</a></li>
								<li><a href="/informacion/aplicaciones" onclick="openNav()">Aplicaciones</a></li>
								<li><a href="/informacion/eventos" onclick="openNav()">Eventos</a></li>
								<li><a href="/informacion/colabora" onclick="openNav()">Colabora</a></li>
							</ul>
						</li>
						<li>
							<a href="#" title="">Herramientas</a>
							<ul>
								<li><a href="/herramientas/campus" onclick="openNav()">AOD Campus</a></li>
								<li><a href="/herramientas/desarrolladores" onclick="openNav()">Desarrolladores</a></li>
								<li><a href="/herramientas/apis" onclick="openNav()">APIs</a></li>
								<li><a href="/herramientas/sparql" onclick="openNav()">SPARQL</a></li>
								<li><a href="https://github.com/aragonopendata/Aragon-Open-Data-3" target="_blank" onclick="openNav()">GITHUB</a></li>
							</ul>
						</li>
					</ul>
					<div class="buscador">
						<div class="wrap">
							<form class="search" method="post" onsubmit="return buscaCkan()">
									<input autocomplete="off" id="buscador_header" class="textBox" placeholder="BUSCA DATOS ABIERTOS" onkeyup="autocompleteRequest()" type="search">
									<a href="#" class="lupa"><span class="material-icons">search</span></a>
									<!--<button type="submit" class="submit"><i aria-hidden="true" class="fa fa-search"></i></button>-->
									<button type="submit" class="btnSearch">
											<i aria-hidden="true" class="fa fa-search" style="display: table; vertical-align: middle;"></i>
									</button>
									<!--<input autocomplete="off" #searchBox id="searchBox" placeholder="BUSCA DATOS ABIERTOS" type="search" class="textBox" (keyup)="search(searchBox.value)"
										(keyup.enter)="searchDatasetsByText(searchBox.value); openNav();" />-->
									<div id="resultsList">
										<div class="search-result">
											<a id="searchResult1"></a>
										</div>
										<div class="search-result">
											<a id="searchResult2"></a>
										</div>
										<div class="search-result">
											<a id="searchResult3"></a>
										</div>
										<div class="search-result">
											<a id="searchResult4"></a>
										</div>
									</div>
							</form>				
						</div>
					</div>
				</div>
			</div>
		 </header>

		<div class="panel-menu">
            <div class="row header-panel">
                <div class="col col-toggle-menu">
                    <span class="material-icons">close</span>
                </div>
                <div class="col logo">
                    <img src="img/logo-gobierno.png" alt="">
                </div>
            </div>
            <div class="body-panel">
                <nav>
                    <li><a href="https://opendata.aragon.es/">Open data</a></li>
                    <li><a href="http://aragonparticipa.aragon.es/">Participación ciudadana</a></li>
                    <li><a href="http://transparencia.aragon.es/">Transparencia</a></li>
                </nav>
            </div>
		</div>

		<div class="container" role="main">
			<div class="breadcrumb enlinea">
				<div class="wrap">
				  <ul>
					<li class="seccion"><a href="/pool/">INICIO</a></li>
					<li class="flecha"><span class="material-icons">keyboard_arrow_right</span></li>
					<li class="titulo">Acerca de los datos de la PAC</li>
				  </ul>
				</div>
			</div>
			<div class="row row-ficha">
				<div class="col col-12 col-lg-8 col01">

						<div class="row row-cabecera-ficha">
						  <div class="col col-titulo">
							<div class="imagen"></div>
							<div class="titulo">
							  <h1 class="literal">Datos de solicitudes de ayuda de la PAC</h1>
							</div>
						  </div>
						  <div class="col col-acciones">
							<a href="#" class="toggle-acciones">Acciones <span class="material-icons">more_vert</span></a>
							<div class="menu-acciones">
							  <ul>
								<li><a href="#">Accion 1</a></li>
								<li><a href="#">Accion 2</a></li>
								<li><a href="#">Accion 3</a></li>
							  </ul>
							</div>
						  </div>
						</div>

						<div class="row row-contenido">
						  <h2 class="sr-only">Información</h2>
						  <div class="col ">
							<p>
							Los datos de las solicitudes de ayuda de la PAC constituyen la mayor parte de los Datos Enlazados del proyecto Aragón Open Data Pool. Los datos provienen de unas vistas disponibles en el <a class="pac" href="https://opendata.aragon.es/GA_OD_Core/ui/">API GA_OD_CORE</a>) (de la 78 a la 89) y han sido cargados en Virtuoso en un grafo diferente al del resto, con un modelo ontológico definido ad-hoc dentro de EI2A. Esto se ha hecho así para que su volumen no afecte al rendimiento del API de Consulta y del interfaz web de búsquedas del usuario no técnico. En este sentido cabe decir que tenemos datos cargados desde 1.996 a 2.014 resultantes en:
							</p>
							<ul>
								<li>415.433.581 triples</li>
								<li>1.114.385 solicitudes</li>
								<li>23.163.826 parcelas de cultivos herbáceos</li>
								<li>4.758.008 parcelas de cultivos leñosos</li>
							</ul>
							<p>
							A pesar de este tamaño y de su diferenciación en un grafo diferente en Virtuoso, los datos de la PAC están enlazados con el resto y se pueden usar de manera conjunta, como se puede ver en la ficha de un municipio (por ejemplo, en <a class="pac" href="detalles?url=municipio-50252"> Tauste</a>), que muestra un resumen de las parcelas declaradas en su término municipal de 1.996 a 2.014.  Además de la integración de datos en la ficha de un municipio, los datos de la PAC pueden ser accedidos desde el punto SPARQL del proyecto. Por ejemplo, se podrían ejecutar consultas como:
							</p>
							<p><strong>Total de parcelas por cada solicitud para un municipio:</strong></p>
							<a href="/sparql?default-graph-uri=&query=SELECT+%3Fs+count%28%3Fparcelas%29+%0D%0AFROM+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%2Fpac>++%0D%0A%7B++%0D%0A%3Fs+dc%3Atype+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23solicitudes-pac>+.+%0D%0A%3Fs+<http%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23location>+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23municipio-50056>.+%0D%0A%3Fs+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23references>+%3Fparcelas+%0D%0A%7D+%0D%0AGROUP+BY+%3Fs&should-sponge=&format=text%2Fhtml&timeout=0&debug=on" target="_blank"><code>
								SELECT ?s count(?parcelas) <br>
								FROM &lthttp://opendata.aragon.es/def/ei2a/pac&gt  <br>
								{  <br>
								?s dc:type &lthttp://opendata.aragon.es/def/ei2a#solicitudes-pac&gt . <br>
								?s &lthttp://www.w3.org/2003/01/geo/wgs84_pos#location&gt &lthttp://opendata.aragon.es/def/ei2a#municipio-50056&gt. <br>
								?s &lthttp://opendata.aragon.es/def/ei2a#references&gt ?parcelas <br>
								} <br>
								GROUP BY ?s<br>
							</code></a>
							<p><strong>Datos de una solicitud de la PAC:</strong></p>
							<a href="/sparql?default-graph-uri=&query=SELECT+*+%0D%0AFROM+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%2Fpac>++%0D%0A%7B+%3Fs+%3Fp+%3Fo+.+filter%28%3Fs+%3D+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23solicitud-pac-300-2006-50056>%29%7D&should-sponge=&format=text%2Fhtml&timeout=0&debug=on" target="_blank"><code>
								SELECT * <br>
								FROM &lthttp://opendata.aragon.es/def/ei2a/pac&gt  <br>
								{ ?s ?p ?o . filter(?s = &lthttp://opendata.aragon.es/def/ei2a#solicitud-pac-300-2006-50056&gt)}<br>
							</code></a>
							<p><strong>Datos de un cultivo herbáceo perteneciente a una solicitud:</strong></p>
							<a href="/sparql?default-graph-uri=&query=SELECT+*+%0D%0AFROM+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%2Fpac>++%0D%0A%7B%3Fs+%3Fp+%3Fo+.+filter%28%3Fs+%3D+<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cultivo-herbaceo-300-2006-50056-11-3-0018>%29%7D&should-sponge=&format=text%2Fhtml&timeout=0&debug=on" target="_blank"><code>
								SELECT * <br>
								FROM &lthttp://opendata.aragon.es/def/ei2a/pac&gt  <br>
								{?s ?p ?o . filter(?s = &lthttp://opendata.aragon.es/def/ei2a#cultivo-herbaceo-300-2006-50056-11-3-0018&gt)}<br>
							</code></a>
						  </div>

						</div>
				</div>
			</div>
			
		</div>
		
		<footer>
            <div class="container-fluid">
                <div class="row row01">
                    <div class="col col-aviso">
                        <p class="titulo">Aviso legal</p>
                        <nav>
                            <li><a href="#">Terminos de uso</a></li>
                        </nav>
                        <div class="union-europea">
                            <div class="imagen">
                                <img src="img/flag-europe.png" alt="Union Europea">
                            </div>
                            <div class="texto">
                                <p>Union Europea</p>
                                <p>Fondo europeo de desarrollo regional</p>
                                <p>(feder)</p>
                                <p class="minus">"Construyendo Europa desde Aragón"</p>
                            </div>
                        </div>
						<div class="licencia">
							<div class="imagen-licencia">
								<img src="img/cc.png">
							</div>
							<div class="texto-licencia">
								<p>Los contenidos del portal están sujetos a la licencia creative commons reconocimiento 4.0 salvo que se indique lo contrario</p>
							</div>
						</div>
                    </div>
                    <div class="col col-menu">
                        <p class="titulo">Contenido destacado</p>
                        <nav>
                            <li><a href="https://opendata.aragon.es/datos/catalogo">Banco de datos</a></li>
                            <li><a href="https://opendata.aragon.es/servicios/aragopedia/">Aragonpedia</a></li>
                            <li><a href="https://opendata.aragon.es/servicios/open-social-data/#/main">Open social data</a></li>
                            <li><a href="https://opendata.aragon.es/informacion/colabora">colabora</a></li>
                            <li><a href="https://opendata.aragon.es/informacion/aplicaciones">Aplicaciones</a></li>
                            <li><a href="https://opendata.aragon.es/informacion/open-data">Info open data</a></li>
                        </nav>
                    </div>
                    <div class="col col-powered">
                       <p class="titulo">Powered By</p>
                        <div class="logos">
                            <div class="logo">
                                 	<a alt="ckan" href="http://ckan.org/" target="_blank"><img src="img/cajaLogoCKAN.jpg"></a>
                            </div>
                            <div class="logo">
                                  <a alt="mediawiki" href="http://www.mediawiki.org/" target="_blank"><img src="img/cajaLogoMediaWiki.jpg"></a>
                            </div>
                            <div class="logo">
                                <a alt="virtuoso" href="http://virtuoso.openlinksw.com/" target="_blank"><img src="img/cajaLogoVirtuoso.jpg"></a>
                            </div>
                            <div class="logo">
                                 <a alt="elda" href="http://epimorphics.github.io/elda/" target="_blank"><img src="img/cajaLogoElda.jpg"></a>
                            </div>
                            <div class="logo">
                               <a alt="swagger" href="http://swagger.io/" target="_blank"><img src="img/cajaLogoSwagger.jpg"></a>
                            </div>
                            <div class="logo">
                                <a alt="node" href="https://nodejs.org/es/" target="_blank"><img src="img/cajaLogoNodeJS.jpg"></a>
                            </div>
                            <div class="logo">
                                <a alt="angular" href="https://angular.io/" target="_blank"><img src="img/cajaLogoAngular.jpg"></a>
                            </div>
                            <div class="logo">
                                <a alt="kibana" href="https://www.elastic.co/products/kibana/" target="_blank"><img src="img/cajaLogoKibana.jpg"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row02">
                    <div class="col col-aragon">
                        <div class="wrap-imagen">
                            <img src="img/logo-aragon.png" alt="Gobierno de aragón" title="Gobierno de aragón">
                        </div>
                    </div>
					
					<div class="col redes-sociales">
						<div class="social mail">
							<a href="mailto:opendata@aragon.es">
								<i class="far fa-envelope">
									<span>AOD</span>
								</i>
							</a>
						</div>
						<div class="social youtube">
							<a href="https://www.youtube.com/watch?v=8d409yteTJM&amp;list=PLQ3k0vA0UZvhBVOz_mCq-9Wyn3VCB6QCe">
								<i class="fab fa-youtube"></i>
							</a>
						</div>
						<div class="social twitter">
							<a href="https://www.twitter.com/oasi">
								<i class="fab fa-twitter"></i>
							</a>	
						</div>
						<div class="social facebook">
							<a href="https://www.facebook.com/observatorio.aragones">
								<i class="fab fa-facebook"></i>
							</a>
						</div>
					</div>
					
                </div>
                <div class="row row03">
                    <div class="gobText">
						<p> Gobierno de Aragón - Edificio Pignatelli - Paseo María Agustín, 36, 50071 - Zaragoza - Tel 976714000 </p>
                    </div>
                </div>
            </div>
        </footer>
		

		<div class="mascaritaGenerica"></div>

	</body>

</html>