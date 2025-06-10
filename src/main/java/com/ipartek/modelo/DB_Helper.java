package com.ipartek.modelo;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.modelo.dto.Cancion;
import com.ipartek.modelo.dto.Pelicula;
import com.ipartek.modelo.dto.Serie;
import com.ipartek.modelo.dto.Usuario;
import com.ipartek.modelo.dto.V_Cancion;
import com.ipartek.modelo.dto.V_Pelicula;
import com.ipartek.modelo.dto.V_Serie;
import com.mysql.cj.protocol.Resultset;


public class DB_Helper implements I_Constantes{
	
	/**
	 * <p>Función para conectar a la BD. 
	 * Los parámetros de conexión los hardcodeamos en ella para no escribirlos como parámetros.</p>
	 * 
	 * <p>Para conectar se usa este código:</p>
	 * <pre>
	 * DB_Helper  db = new DB_Helper();
	 * Connection con = db.conectar();
	 * </pre>
	 * 
	 * @return null si no se ha podido conectar a la BD o un objeto Connection a nuestra BD.
	 * 
	 * @exception ClassNotFoundException esta capturada. Esta excepción es causada por no encontrar el Driver de MySQL.
	 * Crear proyecto Maven para solucionarlo y añadir las dependencias correspondientes.
	 * 
	 * @exception SQLException está capturada. Salta cuando hay un error en los datos de conexión a la BD. 
	 * Usuario, contraseña o dirección de la BD errónea o mal escrita.
	 * 
	 * @see Connection 
	 */
	public Connection conectar() {
		Connection con = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONEXION, USUARIO, PASS);
			System.out.println("BASE DE DATOS CONECTADA");
		} catch (ClassNotFoundException e) {
			System.out.println("NO SE ENCONTRO EL DRIVER");
		} catch (SQLException e) {
			System.out.println("ERROR AL CONECTAR A LA BD");
		}
		
		return con;
	}

	public void desconectar(Connection con) {
		try {
			con.close();
			System.out.println("BASE DE DATOS DESCONECTADA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO DESCONECTAR");
		}
	}


	public List<V_Cancion> obtenerTodasCanciones(Connection con) {

		try {
			List<V_Cancion> lista = new ArrayList<V_Cancion>();
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_TODAS_CANCIONES);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while (rs.next()) {
				
				V_Cancion ca = new V_Cancion();
				
				ca.setIdCancion(rs.getInt(V_CANCION_ID));
				ca.setTitulo(rs.getString(V_CANCION_TITULO));
				ca.setEnlace(rs.getString(V_CANCION_ENLACE));
				ca.setEstilo_cancion(rs.getString(V_CANCION_ESTILO));
				ca.setDescripcion_cancion(rs.getString(V_CANCION_DESCRIPCION));
				ca.setFK_usuario(rs.getInt(V_CANCION_FK_USUARIO));
				ca.setUsuario(rs.getString(V_CANCION_USUARIO));			
				
				lista.add(ca);

			}
		
			return lista;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<V_Pelicula> obtenerTodasPeliculas(Connection con) {

		try {
			
			List<V_Pelicula> lista = new ArrayList<V_Pelicula>();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_TODAS_PELICULAS);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while(rs.next()) {
				
				V_Pelicula pe = new V_Pelicula();
				
				pe.setIdPelicula(rs.getInt(V_PELICULA_ID));
				pe.setPelicula(rs.getString(V_PELICULA_PELICULA));
				pe.setDuracion(rs.getString(V_PELICULA_DURACION));
				pe.setDescripcion_peli(rs.getString(V_PELICULA_DESCRIPCION));
				pe.setEstilo_peli(rs.getString(V_PELICULA_ESTILO));
				pe.setUsuario(rs.getString(V_PELICULA_USUARIO));
				
				lista.add(pe);
			}
			
			return lista;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<V_Serie> obtenerTodasSeries(Connection con) {

		try {
			
			List<V_Serie> lista =  new ArrayList<V_Serie>();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_TODAS_SERIES);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while(rs.next()) {
				
				V_Serie se = new V_Serie();
				
				se.setIdSerie(rs.getInt(V_SERIE_ID));
				se.setSerie(rs.getString(V_SERIE_SERIE));
				se.setNum_temporadas(rs.getInt(V_SERIE_NUM_TEMPORADAS));
				se.setDescripcion_serie(rs.getString(V_SERIE_DESCRIPCION));
				se.setUsuario(rs.getString(V_SERIE_USUARIO));
				
				lista.add(se);
			}
				return lista;
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public Usuario comprobarSiExisteUsuario(Usuario usu, Connection con) {

		try {
			
			Usuario usuario = new Usuario();
			
			CallableStatement cstmt = con.prepareCall(SP_VERIFICAR_USUARIO);
			
			cstmt.setString(1, usu.getUsuario());
			cstmt.setString(2, usu.getPass());
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			int contador = 0; // esto lo hacemos para comprobar si hay duplicidades
			
			while(rs.next()) {
				
				usuario.setIdUsuario(rs.getInt(USUARIO_ID));
				usuario.setUsuario(rs.getString(USUARIO_USER));
				usuario.setPass(""); //vacío porque las contraseñas NUNCA se pasan
				usuario.setFK_rol(rs.getInt(USUARIO_FK_ROL));
				contador ++;
			
			}
			
			if(contador<2) { // si hay menos de 2, osea 1, lo retorna, sino, null
				
				return usuario;
				
			}else {
				
				return null;
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();		
			return null;
		}
	}

	public Usuario obtenerId_FK_PorNombre(String usu, Connection con) {

		try {
			
			Usuario usuario = new Usuario();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_USUARIO_ID_POR_NOMBRE);
			
			cstmt.setString(1, usu);
			
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			int contador = 0; // esto lo hacemos para comprobar si hay duplicidades
			
			while(rs.next()) {
				
				usuario.setIdUsuario(rs.getInt(USUARIO_ID));
				usuario.setUsuario("");
				usuario.setPass(""); //vacío porque las contraseñas NUNCA se pasan
				usuario.setFK_rol(rs.getInt(USUARIO_FK_ROL));
				contador ++;
			
			}
			
			if(contador<2) {// si hay menos de 2, osea 1, lo retorna, sino, null
				
				return usuario;
				
			}else {
				
				return null;
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();		
			return null;
		}
	}

	public void bloquearUsuarioPorId(int idUsuario, Connection con) {

		try {
			
			CallableStatement cstmt = con.prepareCall(SP_BLOQUEAR_USUARIOS);
		
			cstmt.setInt(1, idUsuario);
			
			cstmt.execute();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	public void insertarCancion(Cancion can, Connection con) {

		try {
			
			CallableStatement cstmt = con.prepareCall(SP_INSERTAR_CANCION);
			
			cstmt.setString(1, can.getTitulo());
			cstmt.setString(2, can.getEnlace());
			cstmt.setString(3, can.getEstilo_cancion());
			cstmt.setString(4, can.getDescripcion_cancion());
			cstmt.setInt(5, can.getFK_usuario());
			
			cstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<V_Cancion> obtenerCancionesPorIdUsuario(int idUsuario, Connection con) {

		try {
			List<V_Cancion> lista = new ArrayList<>();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_CANCIONES_POR_ID_USUARIO);
			
			cstmt.setInt(1, idUsuario);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while(rs.next()) {
			
				V_Cancion canci = new V_Cancion();
				
				canci.setIdCancion(rs.getInt(CANCION_ID));
				canci.setTitulo(rs.getString(CANCION_TITULO));
				canci.setEnlace(rs.getString(CANCION_ENLACE));
				canci.setEstilo_cancion(rs.getString(CANCION_ESTILO));
				canci.setDescripcion_cancion(rs.getString(CANCION_DESCRIPCION));
				
				
				lista.add(canci);
				
			}
			
			return lista;
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		
		return null;
	}

	public void borrarCancion(int idUsuario, int idCancion, Connection con) {

		
		try {
			
			CallableStatement cstmt = con.prepareCall(SP_BORRAR_CANCION);
			
			cstmt.setInt(1, idCancion);
			
			cstmt.execute();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public List<V_Pelicula> obtenerPeliculasPorIdUsuario(int idUsuarioLogueado, Connection con) {
		
		try {
			List<V_Pelicula> lista = new ArrayList<>();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_PELICULAS_POR_ID_USUARIO);
			
			cstmt.setInt(1, idUsuarioLogueado);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while(rs.next()) {
			
				V_Pelicula peli = new V_Pelicula();
				
				peli.setIdPelicula(rs.getInt(PELICULA_ID));
				peli.setPelicula(rs.getString(PELICULA_PELICULA));
				peli.setDuracion(rs.getString(PELICULA_DURACION));
				peli.setEstilo_peli(rs.getString(PELICULA_ESTILO));
				peli.setDescripcion_peli(rs.getString(PELICULA_DESCRIPCION));
				
				
				lista.add(peli);
				
			}
			
			return lista;
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		
		return null;
	}

	public List<V_Serie> obtenerSeriesPorIdUsuario(int idUsuarioLogueado, Connection con) {
		
		try {
			List<V_Serie> lista = new ArrayList<>();
			
			CallableStatement cstmt = con.prepareCall(SP_OBTENER_SERIES_POR_ID_USUARIO);
			
			cstmt.setInt(1, idUsuarioLogueado);
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while(rs.next()) {
			
				V_Serie canci = new V_Serie();
				
				canci.setIdSerie(rs.getInt(SERIE_ID));
				canci.setSerie(rs.getString(SERIE_SERIE));
				canci.setNum_temporadas(rs.getInt(SERIE_NUM_TEMPORADAS));
				canci.setDescripcion_serie(rs.getString(SERIE_DESCRIPCION));	
				
				lista.add(canci);
				
			}
			
			return lista;
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		
		return null;
	}

	public void borrarPelicula(int idPelicula, Connection con) {

		try {
			
			CallableStatement cstmt = con.prepareCall(SP_BORRAR_PELICULA);
			
			cstmt.setInt(1, idPelicula);
			
			cstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void borrarSerie(int idSerie, Connection con) {
		
		try {
			
			CallableStatement cstmt = con.prepareCall(SP_BORRAR_SERIE);
			
			cstmt.setInt(1, idSerie);
			
			cstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertarPelicula(Pelicula pe, Connection con) {

		try {
			
			CallableStatement cstmt = con.prepareCall(SP_INSERTAR_PELICULA);
			
			cstmt.setString(1, pe.getPelicula());
			cstmt.setString(2, pe.getDuracion());
			cstmt.setString(3, pe.getEstilo_peli());
			cstmt.setString(4, pe.getDescripcion_peli());
			cstmt.setInt(5, pe.getFK_usuario());
			
			cstmt.execute();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertarSerie(Serie se, Connection con) {

		try {
			
			CallableStatement cstmt = con.prepareCall(SP_INSERTAR_SERIE);
			
			cstmt.setString(1, se.getSerie());
			cstmt.setInt(2, se.getNum_temporadas());
			cstmt.setString(3, se.getDescripcion_serie());
			cstmt.setInt(4, se.getFK_usuario());

			
			cstmt.execute();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}

	public V_Cancion obtenerCancionPorIdCancion(int idCancion, Connection con) {
		
		try {
			V_Cancion ca = new V_Cancion();
			
			CallableStatement  cstmt = con.prepareCall(SP_OBTENER_CANCION_POR_IDCANCION);
			
			cstmt.setInt(1, ca.getIdCancion());
			
			cstmt.execute();
			
			ResultSet rs = cstmt.getResultSet();
			
			while (rs.next()) {
				
				ca.setIdCancion(rs.getInt(CANCION_ID));
				ca.setTitulo(rs.getString(CANCION_TITULO));
				ca.setEnlace(rs.getString(CANCION_ENLACE));
				ca.setEstilo_cancion(rs.getString(CANCION_ESTILO));
				ca.setDescripcion_cancion(rs.getString(CANCION_DESCRIPCION));
				
			}
			
			return ca;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	}


		

	

	
