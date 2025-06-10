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
       <form action="InsertarCancion" class="insertar_cancion">
       		<h2>Añadir canción</h2><br>
       		
       		<label for="p_titulo">Título</label>
       		<input type=text name="p_titulo" id="p_titulo"><br>
       		
       		<label for="p_enlace">Enlace</label>
       		<input type=text name="p_enlace" id="p_enlace"><br>
       		
       		<label for="p_estilo_cancion">Estilo</label>
       		<input type=text name="p_estilo_cancion" id="p_estilo_cancion"><br>
       		
       		<label for="p_descripcion_cancion">Descripción</label>
       		<textarea name="p_descripcion_cancion" id="p_descripcion_cancion"></textarea><br>
       		       		
       		<input type=submit value="AÑADIR" class="boton">
       </form>
       
       <form action="InsertarPelicula" class="insertar_pelicula">
       		<h2>Añadir película</h2><br>
       		       		
       		<label for="p_pelicula">Película</label>
       		<input type=text name="p_pelicula" id="p_pelicula"><br>
       		
       		<label for="p_duracion">Duración</label>
       		<input type=text name="p_duracion" id="p_duracion"><br>       		    		
       		
       		<label for="p_estilo_peli">Estilo</label>
       		<input type=text name="p_estilo_peli" id="p_estilo_peli"><br>
       		
       		<label for="p_descripcion_peli">Descripción</label>
       		<textarea name="p_descripcion_peli" id="p_descripcion_peli"></textarea><br>      		   		       		    		
       		
       		<input type=submit value="AÑADIR" class="boton">
       </form>
       
       <form action="InsertarSerie" class="insertar_serie">
       		<h2>Añadir series</h2><br>
       		       		
       		<label for="p_serie">Serie</label>
       		<input type=text name="p_serie" id="p_serie"><br>
       		
       		<label for="p_num_temporadas">Nº Temporadas</label>
       		<input type=text name="p_num_temporadas" id="p_num_temporadas"><br>
       		
       		<label for="p_descripcion_serie">Descripción</label>
       		<textarea name="p_descripcion_serie" id="p_descripcion_serie"></textarea><br>
       		       		       		
       		<input type=submit value="AÑADIR" class="boton">
       </form>
       
       <div class="canciones">
           <h2>MIS CANCIONES</h2>
	       <table border=1>
	       		<thead>
	       			
	       			<tr>
	       				<th>ID</th>
	       				<th>Título</th>
	       			    <th>Enlace</th>	
	       			    <th>Estilo</th>
	       			    <th>Descripción</th>
	       			    <th>Opciones</th>
	       			</tr>
	       			
	       		</thead>
	       		<tbody>
	       		
	       		<%for(V_Cancion elem: listaCanciones) {%>
	       			<tr>
	       				<td><%=elem.getIdCancion() %></td>
	       				<td><%=elem.getTitulo() %></td>
	       				<td><%=elem.getEnlace() %></td>
	       				<td><%=elem.getEstilo_cancion() %></td>
	       				<td><%=elem.getDescripcion_cancion() %></td>
	       				<td>
	       					<a href="FrmModificarCancion?p_idCancion=<%=elem.getIdCancion()%>">Editar</a>
	       					|
	       					<a href="BorrarCancion?p_idCancion=<%=elem.getIdCancion()%>">Borrar</a>
	       				</td>
	       			</tr>
	       			<%}%>
	       		</tbody>
	       
	       </table>
       </div>
       <div class="peliculas">
       	   <h2>MIS PELICULAS</h2>
	       <table border=1>
	       		<thead>
	       			<tr>
	       				<th>ID</th>
	       				<th>Película</th>
	       			    <th>Duración</th>	
	       			    <th>Estilo</th>
	       			    <th>Descripción</th>
	       			    <th>Opciones</th>
	       			</tr>
	       		</thead>
	       		<tbody>
	       			<tr>
	       			
	       			<%for(V_Pelicula elem: listaPeliculas) {%>
	       				<td><%=elem.getIdPelicula() %></td>
	       				<td><%=elem.getPelicula() %></td>
	       				<td><%=elem.getDuracion() %></td>
	       				<td><%=elem.getEstilo_peli() %></td>
	       				<td><%=elem.getDescripcion_peli() %></td>	       				
	       				<td>
	       					<a>Editar</a>
	       					|
	       					<a href="BorrarPelicula?p_idPelicula=<%=elem.getIdPelicula()%>">Borrar</a>
	       				</td>
	       			</tr>
	       			<%}%>
	       			
	       		</tbody>
	       
	       </table>
       </div>
       
       <div class="series">
           <h2>MIS SERIES</h2>       
	       <table border=1>
	       		<thead>
	       			<tr>
	       				<th>ID</th>
	       				<th>Serie</th>
	       			    <th>Nº Temporadas</th>	
	       			    <th>Descripción</th>
	       			    <th>Opciones</th>
	       			</tr>
	       		</thead>
	       		<tbody>
	       			<tr>
	       			
	       			<%for(V_Serie elem: listaSeries) {%>
	       				<td><%=elem.getIdSerie() %></td>
	       				<td><%=elem.getSerie() %></td>
	       				<td><%=elem.getNum_temporadas() %></td>
	       				<td><%=elem.getDescripcion_serie() %></td>
	       				<td>
	       					<a>Editar</a>
	       					|
	       					<a href="BorrarSerie?p_idSerie=<%=elem.getIdSerie()%>">Borrar</a>
	       				</td>
	       			</tr>
	       			
	       			<%}%>
	       		</tbody>
	       
	       </table>
	       </div>
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>