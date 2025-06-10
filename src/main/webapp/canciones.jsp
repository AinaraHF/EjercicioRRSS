<%@page import="com.ipartek.modelo.dto.Usuario"%>
<%@page import="com.ipartek.modelo.dto.V_Cancion"%>
<%@page import="com.ipartek.modelo.I_Constantes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.modelo.dto.Cancion"%>
<%@page import="java.util.List"%>
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

    <main>
              
       <table border=1>
       		<thead>
       			<tr>
       				<th>ID</th>
       				<th>Título</th>
       			    <th>Enlace</th>	
       			    <th>Estilo</th>
       			    <th>Descripción</th>
       			    <th>Usuario</th>	
       			</tr>
       		</thead>
       		<tbody>
       		
       			<%for(V_Cancion elem : listaCanciones) {%>
       			<tr>
       				<td><%=elem.getIdCancion() %></td>
       				<td><%=elem.getTitulo() %></td>
       				<td><%=elem.getEnlace()%></td>
       				<td><%=elem.getEstilo_cancion() %></td>
       				<td><%=elem.getDescripcion_cancion() %></td>
       				<td><%=elem.getUsuario() %></td>
       			</tr>
       			<%}%>
       			
       		</tbody>
       
       </table>
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>