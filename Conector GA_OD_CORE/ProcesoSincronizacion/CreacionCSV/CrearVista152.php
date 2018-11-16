<?php
    $vista = 152;
    define ("CLAVE_URI", "CONTRATO");
    define ("VISTA_NECESITA", "11");										//El numero de la vista que necesita para completar sus datos
    define ("CLAVE_TIENE", "MUNICIPIO");								//La clve que tiene para poder relacionarse
    define ("CLAVE_TIENE_DEPENDE", "DENOMINACION");                         //La clave que corresponde en el xml que depende
    define ("CLAVE_NECESITA","CODIGO_MUN"); 								//La clave que necesita
    define ("XML_DEPENDE", "vista_".VISTA_NECESITA."_1.xml"); 				//El xml que depende para sacar todos sus datos
    define ("RUTA_XML_DEPENDE", "../VistasXml/Vista".VISTA_NECESITA."/"); 	//La ruta del xml que necesita para completar datos
    
    include 'comun.php';
    
    if ($archivoCSV !== false) {
        $codigosVistaNecesita = array (); //Codiogos de municipios de la vista que necesita
        $codgiosVistaNecesita ["BINÉFAR"] = [22061];
        $codgiosVistaNecesita [iconv("UTF-8", "Windows-1252", "MONTALBÁN")] = [44155];
        $codgiosVistaNecesita [iconv("UTF-8", "Windows-1252", "MONZÓN")] = [22158];
        $codgiosVistaNecesita [iconv("UTF-8", "Windows-1252", "SARRIÓN")] = [44210]; 
        $codgiosVistaNecesita [iconv("UTF-8", "Windows-1252", "ALAGÓN")] = [50008]; 
        $codgiosVistaNecesita [iconv("UTF-8", "Windows-1252", "SABIÑÁNIGO")] = [22199]; 
        
        crearCsvUnaDependencia2(CLAVE_URI, $codigosVistaNecesita);
    }

?>