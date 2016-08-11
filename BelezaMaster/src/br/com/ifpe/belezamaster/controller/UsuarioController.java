package br.com.ifpe.belezamaster.controller;

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
	
	
	@RequestMapping("/exibirLogin")
	public String exibirLogin(){
		return "index";
		
			}
	
	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario(Usuario usuario) {

		return "usuario/incluirUsuario";

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
			model.addAttribute("mensagem", " O Usu�rio foi adicionado com Sucesso!");
			return "usuario/incluirUsuario";
		}

	}
	
	
	@RequestMapping("/exibirPesquisarPorCpf")
	public String exibirPesquisarPorCpf(){
		
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
		model.addAttribute("msg", " O Usu�rio foi alterado com Sucesso!");
		return "usuario/alterarUsuario";


	}
	//login usuario
	
		@RequestMapping("efetuarLogin")
		public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		if (usuarioLogado != null) {
		session.setAttribute("usuarioLogado", usuarioLogado);
		return "home";
		}
		model.addAttribute("msg", "N�o foi encontrado um usu�rio com o login e senha informados.");
		return "index";
		}

	}
	

