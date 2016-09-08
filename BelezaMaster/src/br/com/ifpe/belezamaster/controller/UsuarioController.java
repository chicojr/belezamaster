package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.belezamaster.model.usuario.Usuario;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;
import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;

@Controller
public class UsuarioController {
	

	// Exibir Página Inicial
	@RequestMapping("/exibirIndex")
	public String exibirIndex() {
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
		UsuarioDao dao = new UsuarioDao();

		if (dao.buscarPorEmail(usuario.getEmail()) != null) {
			model.addAttribute("email", " E-mail já cadastrado");
			return "forward:exibirIncluirUsuario";
		}

		if (result.hasErrors()) {
			model.addAttribute("senha", "* A senha deve ter no minímo 6 e no maximo 64 caracteres ");
			return "forward:exibirIncluirUsuario";
		}

		if (!usuario.getSenha().equals(usuario.getConfSenha())) {
			model.addAttribute("confsenha", "As senhas estão diferentes!");
			return "forward:exibirIncluirUsuario";

		}

		UsuarioDao dao1 = new UsuarioDao();

		if (dao1.buscarPorCpf(usuario.getCpf()) != null) {
			model.addAttribute("cpf", " Cpf já cadastrado");
			return "forward:exibirIncluirUsuario";

		} else {
			UsuarioDao dao2 = new UsuarioDao();

			dao2.salvar(usuario);
			model.addAttribute("mensagem", " O Usuário foi adicionado com Sucesso!");
			return "usuario/incluirUsuario";
		}

	}

	// Exibir Alterar dados
	@RequestMapping("/exibirAlterarDadosUsuario")
	public String exibirAlterarDadosUsuario() {

		return "usuario/alterarUsuario";
	}

	// Exibir alterar usuario
	@RequestMapping("/exibirAlterarUsuario")
	public String exibirAlterarUsuario(Model model, Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();

		if (dao.buscarPorCpf(usuario.getCpf()) == null) {
			model.addAttribute("cpf", " Cpf não cadastrado");
			return "forward:exibirPesquisarPorCpf";

		} else {

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

	// pesquisar usuario

	@RequestMapping("/pesquisarUsuario")
	public @ResponseBody String pesquisarUsuario(@RequestParam String email, HttpServletResponse response) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.buscar(email);
		StringBuilder st = new StringBuilder();
		st.append("<tr>");
		st.append("<th>Nome Usuário</th>");
		st.append("<th>E-mail</th>");
		st.append("<th>Telefone</th>");
		st.append("<th>Celular</th>");
		st.append("<th>Alterar</th>");
		st.append("<th>Remover</th>");
		st.append("</tr>");

		for (Usuario usuario : listarUsuario) {
			st.append("<tr>");
			st.append("<td> " + usuario.getNome() + " </td>");
			st.append("<td> " + usuario.getEmail() + " </td>");
			st.append("<td> " + usuario.getTelefone() + " </td>");
			st.append("<td > " + usuario.getCelular() + " </td>");
			st.append("<td><a class='btn btn-success' style='color: white' href='exibirAlterarUsuario?codigo="
					+ usuario.getCpf() + "'>Alterar</a> &nbsp;</td>");
			st.append("<td><a  class='btn btn-danger' href='removerUsuairio?cpf=" + usuario.getCpf()
					+ "'>Remover</a></td>");
			st.append("</td>");
			st.append("</tr>");

		}
		response.setStatus(200);
		return st.toString();
	}

	// Remover Usuario
	@RequestMapping("/removerUsuario")
	public String removerUsuario(Usuario usuario, Model model, HttpSession session) {
		UsuarioDao dao = new UsuarioDao();
		
		try {
			dao.remover(usuario);
		} catch (ViolacaoIntegridadeException e) {
			model.addAttribute("mensagem", "Usuario não pode ser removido");
			return "forward:exibirListarUsuario";
		}
//			UsuarioDao dao1 = new UsuarioDao();
//
//			if (dao1.buscarPorCpf(usuario.getCpf()) == null) {
//				session.invalidate();
//				model.addAttribute("mensagem", "Você Excluiu sua Conta Por Isso foi deslogado");
//				return "index";
//		}

		model.addAttribute("mensagem", "Usuario Removido com Sucesso");
		return "forward:exibirListarUsuario";
	}

	// recuperar Por Email
	@RequestMapping("/recuperarPorEmail")
	public String recuperarPorEmail(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();

		if (dao.buscarPorEmail(usuario.getEmail()) != null) {
			return "forward:esqueciMinhaSenha";
		}
		model.addAttribute("mensagem", " E-mail Inexistente");

		return "index";
	}

	// Exibir Esqueci minha senha
	@RequestMapping("/esqueciMinhaSenha")
	public String esqueciSenha() {
		return "usuario/esqueciMinhaSenha";

	}

	// Alterar senha
	@RequestMapping("/alterarSenha")
	public String AlterarSenha(@Valid Usuario usuario, BindingResult result, Model model) {

		if (!usuario.getSenha().equals(usuario.getConfSenha())) {
			model.addAttribute("confsenha", "As senhas estão diferentes!");
			return "forward:esqueciMinhaSenha";

		}

		// if (result.hasErrors()) {
		// model.addAttribute("senha", "* A senha deve ter no minímo 6 e no
		// maximo 64 caracteres ");
		// return "forward:esqueciMinhaSenha";
		// }

		UsuarioDao dao = new UsuarioDao();

		if (dao.buscarPorCpf(usuario.getCpf()) != null) {
			UsuarioDao dao1 = new UsuarioDao();

			dao1.alterarSenha(usuario);
			model.addAttribute("mensagem", " A Senha foi alterada com Sucesso!");
			return "index";
		}

		model.addAttribute("mensagem", "CPF inexistente");
		return "forward:esqueciMinhaSenha";

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
