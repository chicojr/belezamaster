package br.com.ifpe.belezamaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.Usuario;
import br.com.ifpe.belezamaster.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario(){
		
		return "incluirUsuarios";
		
	}
	
	@RequestMapping("/incluirUsuario")
	public String incluirUsuario(Usuario usuario){
		
		UsuarioDao dao = new UsuarioDao();
		dao.salvar(usuario);
		return "inserirUsuarioSucesso";
	}
	
	
}
