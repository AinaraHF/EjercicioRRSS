package com.ipartek.series;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.util.List;

import com.ipartek.Auxiliar;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Serie;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;

@WebServlet("/InsertarSerie")
public class InsertarSerie extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
    
    public InsertarSerie() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		Usuario usuarioLogueado = new Usuario();
		if(session.getAttribute(S_ATR_USUARIO) != null) {
			usuarioLogueado = (Usuario)session.getAttribute(S_ATR_USUARIO);
		}
		
		if ( (Usuario)session.getAttribute(S_ATR_USUARIO) != null) {
			
			if (Auxiliar.validarAdminYUsuario(session)) {
				
				String serie = "";
				if(request.getParameter("p_serie") != null) {
					serie = request.getParameter("p_serie");
				}
				
				int num_temporadas = 0;
				if(request.getParameter("p_num_temporadas") != null) {
					num_temporadas = Integer.parseInt(request.getParameter("p_num_temporadas"));
				}
				
				String descripcion_serie = "";
				if(request.getParameter("p_descripcion_serie") != null) {
					descripcion_serie = request.getParameter("p_descripcion_serie");
				}
				
				Serie se = new Serie(0, serie, num_temporadas, descripcion_serie, usuarioLogueado.getIdUsuario());
				
				DB_Helper  db = new DB_Helper();
				Connection con = db.conectar();
				
				db.insertarSerie(se, con);
				List<V_Serie> listaSeries = db.obtenerSeriesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
				List<V_Pelicula> listaPeliculas = db.obtenerPeliculasPorIdUsuario(usuarioLogueado.getIdUsuario(), con);
				List<V_Cancion> listaCanciones = db.obtenerCancionesPorIdUsuario(usuarioLogueado.getIdUsuario(), con);

				
				db.desconectar(con);
				
				request.setAttribute(ATR_LISTA_SERIES, listaSeries);
				request.setAttribute(ATR_LISTA_PELICULAS, listaPeliculas);
				request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);

				request.getRequestDispatcher(JSP_GESTION).forward(request, response);
			
			}else {
				
				response.sendRedirect("http://www.marca.com");
				
			}
			}else {
				
				response.sendRedirect("http://www.marca.com");
			}
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
