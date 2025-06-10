package com.ipartek.modelo.dto;

public class V_Cancion {

	private int idCancion;
	private String titulo;
	private String enlace;
	private String estilo_cancion;
	private String descripcion_cancion;
	private int FK_usuario;
	private String usuario;
	
	public V_Cancion(int idCancion, String titulo, String enlace, String estilo_cancion, String descripcion_cancion,
			int fK_usuario, String usuario) {
		super();
		this.idCancion = idCancion;
		this.titulo = titulo;
		this.enlace = enlace;
		this.estilo_cancion = estilo_cancion;
		this.descripcion_cancion = descripcion_cancion;
		this.FK_usuario = fK_usuario;
		this.usuario = usuario;
	}
	
	public V_Cancion() {
		super();
		this.idCancion = 0;
		this.titulo = "";
		this.enlace = "";
		this.estilo_cancion = "";
		this.descripcion_cancion = "";
		this.FK_usuario = 0;
		this.usuario = "";
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

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	@Override
	public String toString() {
		return "V_Cancion [idCancion=" + idCancion + ", titulo=" + titulo + ", enlace=" + enlace + ", estilo_cancion="
				+ estilo_cancion + ", descripcion_cancion=" + descripcion_cancion + ", FK_usuario=" + FK_usuario
				+ ", usuario=" + usuario + "]";
	}
	
	

}
