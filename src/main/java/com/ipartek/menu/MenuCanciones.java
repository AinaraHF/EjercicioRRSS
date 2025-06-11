package com.ipartek.menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.ipartek.Auxiliar;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Cancion;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;

@WebServlet("/MenuCanciones")
public class MenuCanciones extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
      
    public MenuCanciones() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if ( (Usuario)session.getAttribute(S_ATR_USUARIO) != null) {
			
			if ( Auxiliar.validarAdminYUsuario(session)) {
				
				DB_Helper  db = new DB_Helper();
				Connection con = db.conectar();
		
				List<V_Cancion> listaCanciones = db.obtenerTodasCanciones(con);
						
				db.desconectar(con);
		
				request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);
		
				request.getRequestDispatcher(JSP_CANCIONES).forward(request, response);
				
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
