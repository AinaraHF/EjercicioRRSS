package com.ipartek.modelo.dto;

public class V_Pelicula {

	private int idPelicula;
	private String pelicula;
	private String duracion;
	private String descripcion_peli;
	private String estilo_peli;
	private int FK_usuario;
	private String usuario;
	
	public V_Pelicula(int idPelicula, String pelicula, String duracion, String descripcion_peli, String estilo_peli,
			int fK_usuario, String usuario) {
		super();
		this.idPelicula = idPelicula;
		this.pelicula = pelicula;
		this.duracion = duracion;
		this.descripcion_peli = descripcion_peli;
		this.estilo_peli = estilo_peli;
		this.FK_usuario = fK_usuario;
		this.usuario = usuario;
	}

	public V_Pelicula() {
		super();
		this.idPelicula = 0;
		this.pelicula = "";
		this.duracion = "";
		this.descripcion_peli = "";
		this.estilo_peli = "";
		this.FK_usuario = 0;
		this.usuario = "";
	}

	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getPelicula() {
		return pelicula;
	}

	public void setPelicula(String pelicula) {
		this.pelicula = pelicula;
	}

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public String getDescripcion_peli() {
		return descripcion_peli;
	}

	public void setDescripcion_peli(String descripcion_peli) {
		this.descripcion_peli = descripcion_peli;
	}

	public String getEstilo_peli() {
		return estilo_peli;
	}

	public void setEstilo_peli(String estilo_peli) {
		this.estilo_peli = estilo_peli;
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
		return "V_Pelicula [idPelicula=" + idPelicula + ", pelicula=" + pelicula + ", duracion=" + duracion
				+ ", descripcion_peli=" + descripcion_peli + ", estilo_peli=" + estilo_peli + ", FK_usuario="
				+ FK_usuario + ", usuario=" + usuario + "]";
	}
	
	
}
