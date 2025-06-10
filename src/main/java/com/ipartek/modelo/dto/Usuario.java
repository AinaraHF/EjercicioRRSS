package com.ipartek.modelo.dto;

public class Usuario {

	private int idUsuario;
	private String usuario;
	private String pass;
	private int FK_rol;
	
	public Usuario(int idUsuario, String usuario, String pass, int fK_rol) {
		super();
		this.idUsuario = idUsuario;
		this.usuario = usuario;
		this.pass = pass;
		this.FK_rol = fK_rol;
	}
	
	public Usuario() {
		super();
		this.idUsuario = 0;
		this.usuario = "";
		this.pass = "";
		this.FK_rol = 0;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getFK_rol() {
		return FK_rol;
	}

	public void setFK_rol(int fK_rol) {
		FK_rol = fK_rol;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", usuario=" + usuario + ", pass=" + pass + ", FK_rol=" + FK_rol
				+ "]";
	}
	
	
}
