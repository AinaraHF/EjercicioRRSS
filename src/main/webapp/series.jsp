<%@page import="com.ipartek.modelo.dto.Usuario"%>
<%@page import="com.ipartek.modelo.dto.V_Serie"%>
<%@page import="com.ipartek.modelo.I_Constantes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.modelo.dto.Serie"%>
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

    <main>
       
       <table border=1>
       		<thead>
       			<tr>
       				<th>ID</th>
       				<th>Serie</th>
       			    <th>Nº Temporadas</th>	
       			    <th>Descripción</th>
       			    <th>Usuario</th>	
       			</tr>
       		</thead>
       		<tbody>
       		
       			<%for (V_Serie elem : listaSeries) {%>
       			<tr>
       				<td><%=elem.getIdSerie() %></td>
       				<td><%=elem.getSerie() %></td>
       				<td><%=elem.getNum_temporadas() %></td>
       				<td><%=elem.getDescripcion_serie()%></td>
       				<td><%=elem.getUsuario() %></td>
       			</tr>
       			<%}%>
       			
       		</tbody>
       
       </table>
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>