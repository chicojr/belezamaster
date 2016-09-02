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
	private static int Adm = 1;
	private static int prof = 1;
	private static int user = 3;
	
	
	
	// Exibir Página Inicial
	@RequestMapping("/exibirIndex")
	public String exibirIndex() {
		return "index";

	}

	// Exibir Incluir Usuario
	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario( Usuario usuario) {

		return "usuario/incluirUsuario";

	}


	// incluir usuario
	@RequestMapping("/incluirUsuario")
	public String incluirUsuario( @Valid Usuario usuario, BindingResult result, Model model) {
		UsuarioDao dao = new UsuarioDao();

		if (dao.buscarPorEmail(usuario.getEmail()) != null) {
			model.addAttribute("email", " E-mail já cadastrado");
			return "forward:exibirIncluirUsuario";
		}
		
	     if (result.hasErrors()) {
				model.addAttribute("senha", "* A senha deve ter no minímo 6 e no maximo 20 caracteres ");
				return "forward:exibirIncluirUsuario";
			}
		
		if (!usuario.getSenha().equals(usuario.getConfSenha())) {
			model.addAttribute("confsenha", "As senhas estão diferentes!");
			return "forward:exibirIncluirUsuario";

		}
		
			UsuarioDao dao1 = new UsuarioDao();
			
			if( dao1.buscarPorCpf(usuario.getCpf()) != null){
				model.addAttribute("cpf", " Cpf já cadastrado");
				return "forward:exibirIncluirUsuario";

				
			} else {	
			UsuarioDao dao2 = new UsuarioDao();

			dao2.salvar(usuario);
			model.addAttribute("mensagem", " O Usuário foi adicionado com Sucesso!");
			return "usuario/incluirUsuario";
		}
	
	}
	// Exibir Pesquisar por CPF
		@RequestMapping("/exibirAlterarDadosUsuario")
		public String exibirAlterarDadosUsuario() {

			return "usuario/alterarUsuario";
		}

		// Exibir alterar usuario
		@RequestMapping("/exibirAlterarUsuario")
		public String exibirAlterarUsuario(Model model, Usuario usuario) {
              UsuarioDao dao = new UsuarioDao();
			
			if( dao.buscarPorCpf(usuario.getCpf()) == null){
				model.addAttribute("cpf", " Cpf não cadastrado");
				return "forward:exibirPesquisarPorCpf";

				
			}else{
			
			UsuarioDao dao1 = new UsuarioDao();
            Usuario usuarioCPF = dao1.buscarPorCpf(usuario.getCpf());
			model.addAttribute("usuario", usuarioCPF);
			return "usuario/alterarUsuario";
			}
		}
	// Redireciona para alterar usuario
	@RequestMapping("/alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.alterar(usuario);
		model.addAttribute("mensagem", " O Usuário foi alterado com Sucesso!");
		return "usuario/alterarUsuario";

	}

	// exibir listar Usuario
	@RequestMapping("/exibirListarUsuario")
	public String listarUsuario(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.listar();
		model.addAttribute("listarUsuario", listarUsuario);

		return "usuario/listarUsuario";

	}

	// pesquiar usuario
	@RequestMapping("buscarUsuario")
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
			session.setAttribute("usuario", usuarioLogado);
			session.setAttribute("usuarioLogado", usuarioLogado);
			return "home";
		}
		model.addAttribute("mensagem", "Não foi encontrado um usuário com o login e senha informados.");
		return "index";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";

	}

}
