package com.ipartek.modelo.dto;

public class Rol {

	private int idRol;
	private String rol;
	
	public Rol(int idRol, String rol) {
		super();
		this.idRol = idRol;
		this.rol = rol;
	}
	
	public Rol() {
		super();
		this.idRol = 0;
		this.rol = "";
	}

	public int getIdRol() {
		return idRol;
	}

	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	@Override
	public String toString() {
		return "Rol [idRol=" + idRol + ", rol=" + rol + "]";
	}
	
	
}
