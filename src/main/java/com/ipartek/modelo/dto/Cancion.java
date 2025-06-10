package com.ipartek.modelo.dto;

/**
 * <b>Clase cancion </b>
 * <p>Esta clase define un objeto canción.</p>
 * <p>Los datos los obtiene de la table canciones de la BD</p>
 * 
 * @author Ainara
 * 
 * @version 1
 * @since
 */

public class Cancion {

	/**
	 * <p>Atributo idCancion en la BD es autonumerico y PK.</p>
	 * <p>No admite valores nulos.</p>	 * 
	 */
	private int idCancion;
	
	/**
	 * <p>Valor que representa el título. Tiene un límite de 45 caracteres</p>
	 */
	private String titulo;
	
	private String enlace;
	private String estilo_cancion;
	private String descripcion_cancion;
	private int FK_usuario;
	
	public Cancion(int idCancion, String titulo, String enlace, String estilo_cancion, String descripcion_cancion,
			int fK_usuario) {
		super();
		this.idCancion = idCancion;
		this.titulo = titulo;
		this.enlace = enlace;
		this.estilo_cancion = estilo_cancion;
		this.descripcion_cancion = descripcion_cancion;
		this.FK_usuario = fK_usuario;
	}
	
	public Cancion() {
		super();
		this.idCancion = 0;
		this.titulo = "";
		this.enlace = "";
		this.estilo_cancion = "";
		this.descripcion_cancion = "";
		this.FK_usuario = 0;
	}

	public int getIdCancion() {
		return idCancion;
	}

	public void setIdCancion(int idCancion) {
		this.idCancion = idCancion;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getEnlace() {
		return enlace;
	}

	public void setEnlace(String enlace) {
		this.enlace = enlace;
	}

	public String getEstilo_cancion() {
		return estilo_cancion;
	}

	public void setEstilo_cancion(String estilo_cancion) {
		this.estilo_cancion = estilo_cancion;
	}

	public String getDescripcion_cancion() {
		return descripcion_cancion;
	}

	public void setDescripcion_cancion(String descripcion_cancion) {
		this.descripcion_cancion = descripcion_cancion;
	}

	public int getFK_usuario() {
		return FK_usuario;
	}

	public void setFK_usuario(int fK_usuario) {
		FK_usuario = fK_usuario;
	}

	@Override
	public String toString() {
		return "Cancion [idCancion=" + idCancion + ", titulo=" + titulo + ", enlace=" + enlace + ", estilo_cancion="
				+ estilo_cancion + ", descripcion_cancion=" + descripcion_cancion + ", FK_usuario=" + FK_usuario + "]";
	}
	
	
}
