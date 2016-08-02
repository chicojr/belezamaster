package br.com.ifpe.belezamaster.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.Usuario;
import br.com.ifpe.belezamaster.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario(Usuario usuario) {

		return "incluirUsuario";

	}

	@RequestMapping("/incluirUsuario")
	public String incluirUsuario(@Valid Usuario usuario, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "forward:exibirIncluirUsuario";
		}

		if (!usuario.getSenha().equals(usuario.getConfSenha())) {
			model.addAttribute("confsenha", "As senhas est�o diferentes!");
			return "forward:exibirIncluirUsuario";

		} else {

			UsuarioDao dao = new UsuarioDao();
			dao.salvar(usuario);
			model.addAttribute("mensagem", " O Usuário foi adicionado com Sucesso!");
			return "incluirUsuario";
		}

	}
          // Exibir alterar usuario
	@RequestMapping("exibirAlterarUsuario")
	public String exibirAlterarUsuario(Model model) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorCpf("12123123131");
		model.addAttribute("usuario", usuario);
		return "alterarUsuario";

	}

	// Redireciona para alterar usuario
	@RequestMapping("alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		dao.alterar(usuario);
		model.addAttribute("msg", "Usuário alterado com sucesso !");

		return "forward:alterarUsuario";

	}

}
