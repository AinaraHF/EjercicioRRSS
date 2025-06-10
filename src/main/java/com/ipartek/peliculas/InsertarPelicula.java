package com.ipartek.peliculas;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Pelicula;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;


@WebServlet("/InsertarPelicula")
public class InsertarPelicula extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
       
    
    public InsertarPelicula() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		Usuario usuarioLogueado = new Usuario();
		if(session.getAttribute(S_ATR_USUARIO) != null) {
			usuarioLogueado = (Usuario)session.getAttribute(S_ATR_USUARIO);
		}
		
		String pelicula ="";
		if(request.getParameter("p_pelicula") != null) {
			pelicula = request.getParameter("p_pelicula");
		}
		
		String duracion = "";
		if(request.getParameter("p_duracion") != null) {
			duracion = request.getParameter("p_duracion");
		}
				
		String estilo_peli = "";
		if(request.getParameter("p_estilo_peli") != null) {
			estilo_peli = request.getParameter("p_estilo_peli");
		}
		
		String descripcion_peli = "";
		if(request.getParameter("p_descripcion_peli") != null) {
			descripcion_peli = request.getParameter("p_descripcion_peli");
		}
		
		
		
		Pelicula pe = new Pelicula(0, pelicula, duracion, descripcion_peli, estilo_peli, usuarioLogueado.getIdUsuario());
		
		DB_Helper  db = new DB_Helper();
		Connection con = db.conectar();
		
		db.insertarPelicula(pe, con);
		List<V_Pelicula> listaPeliculas = db.obtenerPeliculasPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
		List<V_Serie> listaSeries = db.obtenerSeriesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
		List<V_Cancion> listaCanciones = db.obtenerCancionesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);

		db.desconectar(con);
		
		request.setAttribute(ATR_LISTA_PELICULAS, listaPeliculas);
		request.setAttribute(ATR_LISTA_SERIES, listaSeries);
		request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);

		request.getRequestDispatcher(JSP_GESTION).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
