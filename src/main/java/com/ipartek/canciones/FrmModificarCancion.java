package com.ipartek.canciones;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Cancion;
import com.ipartek.modelo.dto.V_Cancion;

@WebServlet("/FrmModificarCancion")
public class FrmModificarCancion extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
       
    public FrmModificarCancion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idCancion = 0;
		if(request.getParameter("p_id") != null) {
			idCancion = Integer.parseInt(request.getParameter("p_id"));
		}
		
		DB_Helper  db = new DB_Helper();
		Connection con = db.conectar();
		
		V_Cancion ca = db.obtenerCancionPorIdCancion(idCancion,con);
		
		db.desconectar(con);
		
		request.setAttribute(ATR_CANCION, ca);
		request.getRequestDispatcher(JSP_FRM_MODIFICAR_CANCIONES).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
