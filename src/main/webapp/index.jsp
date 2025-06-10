<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    <main >
       <form action="ValidarUsuario" class="frm_identificacion" method="get">
       		<h2>Identifícate</h2>
       		
       		<label for="p_usuario">Usuario</label>
       		<input type=text name="p_usuario" id="p_usuario"><br>
       		
       		<label for="p_pass">Contraseña</label>
       		<input type=text name="p_pass" id="p_pass"><br>
       		
       		<input type=submit value="ENTRAR" class="boton">
       		
       		<p>¿No eres usuario?</p>
       		<a href="" class="registrate">¡Regístrate aquí!</a>
       </form>
    </main>

   	<%@include file="includes/pie.jsp" %>

</body>
</html>