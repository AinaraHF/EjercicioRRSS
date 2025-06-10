<%@page import="com.ipartek.modelo.dto.Cancion"%>
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


V_Cancion ca = new V_Cancion();
if(request.getAttribute(I_Constantes.ATR_CANCION) != null){
	ca = (V_Cancion)request.getAttribute(I_Constantes.ATR_CANCION);
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
    
       <form action="ModificarCancion" class="insertar_cancion">
       		<h2>Modificar canción</h2><br>
       		
       		<label for="p_idCancion">ID</label>
       		<input type=text name="p_idCancion" id="p_idCancion" required readonly><br>
       		
       		<label for="p_titulo">Título</label>
       		<input type=text name="p_titulo" id="p_titulo" value="<%=ca.getTitulo()%>" required><br>
       		
       		<label for="p_enlace">Enlace</label>
       		<input type=text name="p_enlace" id="p_enlace" value="<%=ca.getEnlace()%>" required><br>
       		
       		<label for="p_estilo_cancion">Estilo</label>
       		<input type=text name="p_estilo_cancion" id="p_estilo_cancion" value="<%=ca.getEstilo_cancion()%>" required><br>
       		
       		<label for="p_descripcion_cancion">Descripción</label>
       		<textarea name="p_descripcion_cancion" id="p_descripcion_cancion" value="<%=ca.getDescripcion_cancion()%>" required></textarea><br>
       		       		
       		<input type=submit value="GUARDAR" class="boton">
       </form>         
                     
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>