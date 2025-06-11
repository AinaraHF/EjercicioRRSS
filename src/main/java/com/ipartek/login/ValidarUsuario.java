package com.ipartek.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Cancion;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;

@WebServlet("/ValidarUsuario")
public class ValidarUsuario extends HttpServlet implements I_Constantes{
	private static final long serialVersionUID = 1L;
     
    public ValidarUsuario() {
        super();
    }

    /**
     * <b>Función para validación del usuario.</b>
     * <p>Funciona por el método GET, pero está adaptada a que funcione con el POST también.</p>
     * 
     * <p>Esta función recibirá dos parámetros del formulario:</p>
     * <ul>
     * 		<li>p_usuario: el nombre del usuario </li>
     *      <li>p_pass: el password </li>
     * </ul>
     * 
     * <b>Funcionamiento:</b>
     * <p>Comprobaremos si el usuario y la contraseña son correctos y el usuario tiene permiso para poder entrar a la siguiente página.
     * Solo podrán entrar los usuarios con rol de usuario y de admin. Los baneados y bloqueados no podrán.</p>
     * 
     * <p>Si un usuario existe en la BD y se introduce el pass 3 veces mal se le bloquea.
     * Solo se le bloqueará si no está baneado.</p>
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Acceder sesión
		HttpSession session = request.getSession();
		
		String ruta = "";
		
		// Recibir los datos
		String usuario = "";
		if(request.getParameter("p_usuario") != null) {
			usuario = request.getParameter("p_usuario");
		}
		
		String pass = "";
		if(request.getParameter("p_pass") != null) {
			pass = request.getParameter("p_pass");
		}
		
			
		// Meter estos en un objeto
		Usuario usu = new Usuario(0, usuario, pass, 0);
		
		
		// Conectar a la BD
		DB_Helper  db = new DB_Helper();
		Connection con = db.conectar();
		
		
		// Comprobar en la BD si ese usuario con esa contraseña existe
			// Hacer SP y función que devuelva usuario vacio si no esta en la BD, relleno menos password si existe y null si algo falla
		
		Usuario UsuarioReal = db.comprobarSiExisteUsuario(usu, con);
		
		// Comprobar el bloqueo
		HashMap<String, Integer> listaPosiblesBloqueos = new HashMap <String, Integer> ();
		
		if(session.getAttribute("s_lista_posibles_bloqueos") != null) {
			listaPosiblesBloqueos = (HashMap<String, Integer>)session.getAttribute("s_lista_posibles_bloqueos");
		}
				
		if(UsuarioReal.getIdUsuario() == 0) { //si usuario o contraseña están mal
					
			if(listaPosiblesBloqueos.containsKey(usuario)) { //comprueba si el usuario erróneo está ya en la lista y si está, le suma un intento
					
				int intentos = listaPosiblesBloqueos.get(usuario);
				listaPosiblesBloqueos.put(usuario, intentos+1);
					
			}else {
						
				listaPosiblesBloqueos.put(usuario, 1); //si no está en la lista, lo agrega

			}			
		}
		
		session.setAttribute("s_lista_posibles_bloqueos", listaPosiblesBloqueos);
				
		if(listaPosiblesBloqueos.get(usuario) != null) { 
			
			if(listaPosiblesBloqueos.get(usuario) == 3) { // Para bloquear usuario
				// Seleccionar si existe en la BD un usuario con ese nombre, obtener su id, nombre
				Usuario usutemp = db.obtenerId_FK_PorNombre(usuario, con);		
						
				// Si no está baneado, se bloquea
				if(usutemp.getFK_rol() != 3) {
					db.bloquearUsuarioPorId(usutemp.getIdUsuario(), con);
				}
			}			
		}
		
				
				
		if(listaPosiblesBloqueos.get(usuario) == null) {
			ruta = JSP_INDEX;
		}
				
		List<V_Cancion> listaCanciones = new ArrayList<>();
		if(UsuarioReal.getIdUsuario() >0 ) {
			
			listaCanciones = db.obtenerCancionesPorIdUsuario(UsuarioReal.getIdUsuario(), con);

		}
		
		List<V_Pelicula> listaPeliculas = new ArrayList<>();
		if(UsuarioReal.getIdUsuario() >0 ) {
			
			listaPeliculas = db.obtenerPeliculasPorIdUsuario(UsuarioReal.getIdUsuario(), con);

		}
		
		List<V_Serie> listaSeries = new ArrayList<>();
		if(UsuarioReal.getIdUsuario() >0 ) {
			
			listaSeries = db.obtenerSeriesPorIdUsuario(UsuarioReal.getIdUsuario(), con);

		}
		
		
		// Desconectar de la BD
		db.desconectar(con);
				
		
		// Si el usuario tiene un id>0 (lo ha encontrado) comprobar su FK:
			//si el FK es 1 ir a página de admin, aún sin crear
			//si el FK es 2 ir a página gestión de ese usuario
			//si el FK es 3 ir otra vez al login
			//si el FK es 4 ir otra vez al login
		
		
		if(UsuarioReal.getIdUsuario()>0) {
			switch (UsuarioReal.getFK_rol()) {
			case 1: 
				ruta = JSP_ADMIN;	
				session.setAttribute(S_ATR_USUARIO, UsuarioReal); //guardar en sesión
				session.removeAttribute("s_lista_posibles_bloqueos");
				break;
			case 2: 
				ruta = JSP_GESTION;	
				session.setAttribute(S_ATR_USUARIO, UsuarioReal); //guardar en sesión
				session.removeAttribute("s_lista_posibles_bloqueos");
				break;
			case 3: ruta = JSP_INDEX;	break;
			case 4: ruta = JSP_INDEX;	break;

			default:
				ruta = JSP_INDEX; break;
			}
			
		}else {
			
			ruta = JSP_INDEX;
			
		}
		
		
		// La mochila
		request.setAttribute(ATR_LISTA_CANCIONES, listaCanciones);
		request.setAttribute(ATR_LISTA_PELICULAS, listaPeliculas);
		request.setAttribute(ATR_LISTA_SERIES, listaSeries);

		request.getRequestDispatcher(ruta).forward(request, response);
		
	
	
	//obtener datos de la sesión
	//int contador = (int) session.getAttribute("S_LISTA_COMPRA");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
