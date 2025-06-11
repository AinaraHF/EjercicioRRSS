<%@page import="com.ipartek.modelo.dto.V_Serie"%>
<%@page import="com.ipartek.modelo.dto.V_Pelicula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.modelo.dto.V_Cancion"%>
<%@page import="java.util.List"%>
<%@page import="com.ipartek.modelo.dto.Usuario"%>
<%@page import="com.ipartek.modelo.I_Constantes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Usuario usuarioSession = new Usuario(); 
if(session.getAttribute(I_Constantes.S_ATR_USUARIO) != null){
	usuarioSession = (Usuario)session.getAttribute(I_Constantes.S_ATR_USUARIO);
}
//solo entra si es 1 o 2
if(usuarioSession.getFK_rol() != 1 && usuarioSession.getFK_rol() != 2 ){
	response.sendRedirect(I_Constantes.JSP_INDEX);
}


List<V_Cancion> listaCanciones = new ArrayList<V_Cancion>();
if(request.getAttribute(I_Constantes.ATR_LISTA_CANCIONES) != null){
	listaCanciones = (List<V_Cancion>)request.getAttribute(I_Constantes.ATR_LISTA_CANCIONES);
}

List<V_Pelicula> listaPeliculas = new ArrayList<V_Pelicula>();
if(request.getAttribute(I_Constantes.ATR_LISTA_PELICULAS) != null){
	listaPeliculas = (List<V_Pelicula>)request.getAttribute(I_Constantes.ATR_LISTA_PELICULAS);
}

List<V_Serie> listaSeries = new ArrayList<V_Serie>();
if(request.getAttribute(I_Constantes.ATR_LISTA_SERIES) != null){
	listaSeries = (List<V_Serie>)request.getAttribute(I_Constantes.ATR_LISTA_SERIES);
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sharing is caring</title>
    <link rel="stylesheet" href="styles/style_productos.css" >
    <link rel="stylesheet" href="styles/style.css" >
</head>
<body>
    
    <%@include file="includes/cabecera.jsp" %>

   	<%@include file="includes/menu.jsp" %>

    <main class="container">
       ZONA ADMIN
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>