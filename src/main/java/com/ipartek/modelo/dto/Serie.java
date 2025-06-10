package com.ipartek.modelo.dto;

public class Serie {

	private int idSerie;
	private String serie;
	private int num_temporadas;
	private String descripcion_serie;
	private int FK_usuario;
	
	public Serie(int idSerie, String serie, int num_temporadas, String descripcion_serie, int fK_usuario) {
		super();
		this.idSerie = idSerie;
		this.serie = serie;
		this.num_temporadas = num_temporadas;
		this.descripcion_serie = descripcion_serie;
		this.FK_usuario = fK_usuario;
	}
	
	public Serie() {
		super();
		this.idSerie = 0;
		this.serie = "";
		this.num_temporadas = 0;
		this.descripcion_serie = "";
		this.FK_usuario = 0;
	}

	public int getIdSerie() {
		return idSerie;
	}

	public void setIdSerie(int idSerie) {
		this.idSerie = idSerie;
	}

	public String getSerie() {
		return serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

	public int getNum_temporadas() {
		return num_temporadas;
	}

	public void setNum_temporadas(int num_temporadas) {
		this.num_temporadas = num_temporadas;
	}

	public String getDescripcion_serie() {
		return descripcion_serie;
	}

	public void setDescripcion_serie(String descripcion_serie) {
		this.descripcion_serie = descripcion_serie;
	}

	public int getFK_usuario() {
		return FK_usuario;
	}

	public void setFK_usuario(int fK_usuario) {
		FK_usuario = fK_usuario;
	}

	@Override
	public String toString() {
		return "Serie [idSerie=" + idSerie + ", serie=" + serie + ", num_temporadas=" + num_temporadas
				+ ", descripcion_serie=" + descripcion_serie + ", FK_usuario=" + FK_usuario + "]";
	}
	
	
}
