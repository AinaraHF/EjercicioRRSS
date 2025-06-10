package com.ipartek.canciones;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ipartek.modelo.I_Constantes;

@WebServlet("/ModificarCancion")
public class ModificarCancion extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
           
    public ModificarCancion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idCancion = 0;
		if(request.getParameter("p_idCancion") != null) {
			idCancion = Integer.parseInt(request.getParameter("p_idCancion"));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
