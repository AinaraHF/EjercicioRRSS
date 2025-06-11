package com.ipartek.modelo;

public interface I_Constantes {

	// constantes de la BD
	String BD = "jsp_rrss_multimedia";
	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String CONEXION = "jdbc:mysql://localhost:3306/"+BD;
	String USUARIO = "root";
	String PASS = "1234";
	
	//constantes de los JSP
	String JSP_INDEX = "index.jsp";
	String JSP_ADMIN = "admin.jsp";
	String JSP_GESTION = "gestion.jsp";
	String JSP_CANCIONES = "canciones.jsp";
	String JSP_PELICULAS = "peliculas.jsp";
	String JSP_SERIES = "series.jsp";
	String JSP_FRM_MODIFICAR_CANCIONES = "frm_modificar_canciones.jsp";
	String JSP_FRM_MODIFICAR_PELICULAS = "peliculas.jsp";
	String JSP_FRM_MODIFICAR_SERIES = "series.jsp";
	
	String TABLA_CANCIONES = "canciones";
	String CANCION_ID = "idCancion";
	String CANCION_TITULO = "titulo";
	String CANCION_ENLACE = "enlace";
	String CANCION_ESTILO = "estilo_cancion";
	String CANCION_DESCRIPCION = "descripcion_cancion";
	String CANCION_FK_USUARIO = "FK_usuario";

	String TABLA_PELICULAS = "peliculas";
	String PELICULA_ID = "idPelicula";
	String PELICULA_PELICULA = "pelicula";
	String PELICULA_DURACION = "duracion";
	String PELICULA_DESCRIPCION = "descripcion_peli";
	String PELICULA_ESTILO = "estilo_peli";
	String PELICULA_FK_USUARIO = "FK_usuario";

	String TABLA_SERIES = "series";
	String SERIE_ID = "idSerie";
	String SERIE_SERIE = "serie";
	String SERIE_NUM_TEMPORADAS = "num_temporadas";
	String SERIE_DESCRIPCION = "descripcion_serie";
	String SERIE_FK_USUARIO = "FK_usuario";
	
	String TABLA_USUARIOS = "usuarios";
	String USUARIO_ID = "idUsuario";
	String USUARIO_USER = "usuario";
	String USUARIO_PASS = "pass";
	String USUARIO_FK_ROL = "FK_rol";
	
	String TABLA_ROLES = "roles";
	String ROL_ID = "idRol";
	String ROL_ROL = "rol";
	
	//Vistas
	String V_CANCIONES = "v_canciones";
	String V_CANCION_ID = "idCancion";
	String V_CANCION_TITULO = "titulo";
	String V_CANCION_ENLACE = "enlace";
	String V_CANCION_ESTILO = "estilo_cancion";
	String V_CANCION_DESCRIPCION = "descripcion_cancion";
	String V_CANCION_FK_USUARIO = "FK_usuario";
	String V_CANCION_USUARIO = "usuario";

	String V_PELICULAS = "v_peliculas";
	String V_PELICULA_ID = "idPelicula";
	String V_PELICULA_PELICULA = "pelicula";
	String V_PELICULA_DURACION = "duracion";
	String V_PELICULA_DESCRIPCION = "descripcion_peli";
	String V_PELICULA_ESTILO = "estilo_peli";
	String V_PELICULA_FK_USUARIO = "FK_usuario";
	String V_PELICULA_USUARIO = "usuario";

	String V_SERIES = "v_series";
	String V_SERIE_ID = "idSerie";
	String V_SERIE_SERIE = "serie";
	String V_SERIE_NUM_TEMPORADAS = "num_temporadas";
	String V_SERIE_DESCRIPCION = "descripcion_serie";
	String V_SERIE_FK_USUARIO = "FK_usuario";
	String V_SERIE_USUARIO = "usuario";

	//Atributos
	String ATR_LISTA_CANCIONES = "listaCanciones";
	String ATR_LISTA_PELICULAS = "listaPeliculas";
	String ATR_LISTA_SERIES = "listaSeries";
	
	String ATR_CANCION = "cancion";
	String ATR_PELICULA = "pelicula";
	String ATR_SERIE = "serie";

	//Atributos de la sesión
	String S_ATR_USUARIO = "s_atr_usuario";

	//Stored procedures
	
	String SP_INSERTAR_PELICULA = "call sp_insertar_pelicula(?, ?, ?, ?, ?);";
	String SP_INSERTAR_SERIE = "call sp_insertar_serie(?, ?, ?, ?);";
	String SP_INSERTAR_CANCION = "call sp_insertar_cancion(?, ?, ?, ?, ?);";
	
	String SP_BORRAR_PELICULA = "call sp_borrar_pelicula(?);";
	String SP_BORRAR_SERIE = "call sp_borrar_serie(?);";
	String SP_BORRAR_CANCION = "call sp_borrar_cancion(?);";
	
	String SP_OBTENER_TODAS_CANCIONES = "call sp_obtener_todas_canciones()";
	String SP_OBTENER_TODAS_SERIES = "call sp_obtener_todas_series()";
	String SP_OBTENER_TODAS_PELICULAS = "call sp_obtener_todas_peliculas()";
	
	String SP_OBTENER_CANCIONES_POR_ID_USUARIO = "call sp_obtener_canciones_por_id_usuario(?)";
	String SP_OBTENER_PELICULAS_POR_ID_USUARIO = "call sp_obtener_peliculas_por_id_usuario(?)";
	String SP_OBTENER_SERIES_POR_ID_USUARIO = "call sp_obtener_series_por_id_usuario(?)";

	String SP_VERIFICAR_USUARIO = "call sp_verificar_usuario(?, ?);";
	String SP_OBTENER_USUARIO_ID_POR_NOMBRE = "call sp_obtener_usuario_id_por_nombre(?)";
	String SP_BLOQUEAR_USUARIOS = "call sp_bloquear_usuarios(?);";
	
	String SP_OBTENER_CANCION_POR_IDCANCION = "call sp_obtener_cancion_por_idCancion(?);";



}
