package com.ipartek;

import com.ipartek.modelo.I_Constantes;
import com.ipartek.modelo.dto.Usuario;

import jakarta.servlet.http.HttpSession;

public class Auxiliar implements I_Constantes{

	public static boolean validarAdminYUsuario(HttpSession session) {
		return ((Usuario)session.getAttribute(S_ATR_USUARIO)).getFK_rol() == 1 || 
			((Usuario)session.getAttribute(S_ATR_USUARIO)).getFK_rol() == 2;
	}
	
}
