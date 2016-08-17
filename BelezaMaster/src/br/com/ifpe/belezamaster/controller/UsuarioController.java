package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;


import br.com.ifpe.belezamaster.model.usuario.Usuario;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;

@Controller
public class UsuarioController {

	// Exibir Login
	@RequestMapping("/exibirLogin")
	public String exibirLogin() {
		return "index";

	}

	// Exibir Incluir Usuario
	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario(Usuario usuario) {

		return "usuario/incluirUsuario";

	}

	// incluir usuario
	@RequestMapping("/incluirUsuario")
	public String incluirUsuario(@Valid Usuario usuario, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "forward:exibirIncluirUsuario";
		}

		if (!usuario.getSenha().equals(usuario.getConfSenha())) {
			model.addAttribute("confsenha", "As senhas estão diferentes!");
			return "forward:exibirIncluirUsuario";

		} else {

			UsuarioDao dao = new UsuarioDao();
			dao.salvar(usuario);
			model.addAttribute("mensagem", " O Usuário foi adicionado com Sucesso!");
			return "usuario/incluirUsuario";
		}

	}

	// Exibir Pesquisar por CPF
	@RequestMapping("/exibirPesquisarPorCpf")
	public String exibirPesquisarPorCpf() {

		return "usuario/pesquisarAlterarCPF";
	}

	// Exibir alterar usuario
	@RequestMapping("/exibirAlterarUsuario")
	public String exibirAlterarUsuario(Model model, Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioCPF = dao.buscarPorCpf(usuario.getCpf());
		model.addAttribute("usuario", usuarioCPF);
		return "usuario/alterarUsuario";

	}

	// Redireciona para alterar usuario
	@RequestMapping("/alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.alterar(usuario);
		model.addAttribute("msg", " O Usuário foi alterado com Sucesso!");
		return "usuario/alterarUsuario";

	}

	
	
	// pesquiar Usuario
	@RequestMapping("/exibirListarUsuario")
	public String exibirListaUsuario() {
		return "usuario/listarUsuario";
	}

	
	// pesquiar usuario
	@RequestMapping("listarUsuario")
	public String PesquisarUsuario(Model model, String email) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.buscar(email);
		model.addAttribute("listarUsuario", listarUsuario);
		return "usuario/listarUsuario";
	}

	// Remover Usuario
	@RequestMapping("/removerUsuario")
	public String removerUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.remover(usuario);

		model.addAttribute("mensagem", "Produto Removido com Sucesso");
		return "forward:exibirListarUsuario";
	}

	

	// login usuario

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		if (usuarioLogado != null) {
			session.setAttribute("usuarioLogado", usuarioLogado);
			return "home";
		}
		model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
		return "index";
	}

}
