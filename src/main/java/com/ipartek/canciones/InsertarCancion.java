package com.ipartek.canciones;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Cancion;
import com.ipartek.modelo.dto.Pelicula;
import com.ipartek.modelo.dto.Serie;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;

@WebServlet("/InsertarCancion")
public class InsertarCancion extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
     
    public InsertarCancion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	HttpSession session = request.getSession();
	
	
	Usuario usuarioLogueado = new Usuario();
	if(session.getAttribute(S_ATR_USUARIO) != null) {
		usuarioLogueado = (Usuario)session.getAttribute(S_ATR_USUARIO);
	}
	
	String titulo = "";
	if(request.getParameter("p_titulo") != null) {
		titulo = request.getParameter("p_titulo");
	}
	
	String enlace = "";
	if(request.getParameter("p_enlace") != null) {
		enlace = request.getParameter("p_enlace");
	}
	
	String estilo_cancion = "";
	if(request.getParameter("p_estilo_cancion") != null) {
		estilo_cancion = request.getParameter("p_estilo_cancion");
	}
	
	String descripcion_cancion = "";
	if(request.getParameter("p_descripcion_cancion") != null) {
		descripcion_cancion = request.getParameter("p_descripcion_cancion");
	}
		
	
	Cancion can = new Cancion(0, titulo, enlace, estilo_cancion, descripcion_cancion, usuarioLogueado.getIdUsuario());
	
	
	DB_Helper  db = new DB_Helper();
	Connection con = db.conectar();
	
	
	db.insertarCancion(can, con);
	List<V_Cancion> listaCanciones = db.obtenerCancionesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);

	db.desconectar(con);

	request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);

	request.getRequestDispatcher(JSP_GESTION).forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
