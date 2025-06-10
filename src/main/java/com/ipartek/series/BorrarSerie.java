package com.ipartek.series;

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
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;

@WebServlet("/BorrarSerie")
public class BorrarSerie extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
     
    public BorrarSerie() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();		
		
		Usuario usuarioLogueado = new Usuario();
		if(session.getAttribute(S_ATR_USUARIO) != null) {
			usuarioLogueado = (Usuario)session.getAttribute(S_ATR_USUARIO);
		}
		
		int idSerie = 0;
		if(request.getParameter("p_idSerie") != null) {
			idSerie = Integer.parseInt(request.getParameter("p_idSerie"));
		}
		
		DB_Helper  db = new DB_Helper();
		Connection con = db.conectar();
		
		db.borrarSerie(idSerie, con);
		List<V_Cancion> listaCanciones = db.obtenerCancionesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
		List<V_Pelicula> listaPeliculas = db.obtenerPeliculasPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
		List<V_Serie> listaSeries = db.obtenerSeriesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
		
		db.desconectar(con);
		
		request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);
		request.setAttribute(ATR_LISTA_PELICULAS, listaPeliculas);
		request.setAttribute(ATR_LISTA_SERIES, listaSeries);
		
		request.getRequestDispatcher(JSP_GESTION).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
