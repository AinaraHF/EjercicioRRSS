package com.ipartek.menu;

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
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;

@WebServlet("/MenuGestion")
public class MenuGestion extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
     
    public MenuGestion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		int idUsuarioLogueado = 0;
		if(session.getAttribute(S_ATR_USUARIO) != null) {
			idUsuarioLogueado = ((Usuario)session.getAttribute(S_ATR_USUARIO)).getIdUsuario();
		}
		
		
		DB_Helper  db = new DB_Helper();
		Connection con = db.conectar();
		
		List<V_Cancion> listaCanciones = new ArrayList<V_Cancion>();
		if(idUsuarioLogueado > 0) {
			listaCanciones = db.obtenerCancionesPorIdUsuario(idUsuarioLogueado, con);
		}				
		
		List<V_Pelicula> listaPeliculas= new ArrayList<V_Pelicula>();
		if(idUsuarioLogueado > 0) {
			listaPeliculas = db.obtenerPeliculasPorIdUsuario(idUsuarioLogueado, con);
		}
		
		List<V_Serie> listaSeries= new ArrayList<V_Serie>();
		if(idUsuarioLogueado > 0) {
			listaSeries = db.obtenerSeriesPorIdUsuario(idUsuarioLogueado, con);
		}
		
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
