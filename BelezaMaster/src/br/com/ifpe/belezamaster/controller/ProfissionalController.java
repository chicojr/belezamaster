package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;

@Controller
public class ProfissionalController {

	// CADASTRANDO O PROFISSIONAL

	@RequestMapping("/exibirIncluirProfissional")
	public String exibirIncluirProfissional(Profissional profissional) {
		return "profissional/incluirProfissional";
	}

	// INCLUINDO O PROFISSIONAL

	@RequestMapping("/incluirProfissional")
	public String incluirProfissional(Profissional profissional, Model model) {
		ProfissionalDao dao = new ProfissionalDao();

		if (dao.buscarPorEmail(profissional.getEmail()) != null) {
			model.addAttribute("email", " E-mail já cadastrado");
			return "exibirIncluirProfissional";
		}
		ProfissionalDao dao1 = new ProfissionalDao();

		if (dao1.buscarPorCpf(profissional.getCpf()) != null) {
			model.addAttribute("cpf", " Cpf já cadastrado");
			return "forward:exibirIncluirProfissional";

		} else {
			ProfissionalDao dao2 = new ProfissionalDao();

			dao2.salvar(profissional);
			model.addAttribute("mensagem", "Profissional Adicionado com Sucesso!");
			return "forward:exibirListarProfissional";

		}
	}

	// listar servico

	@RequestMapping("/exibirListarProfissional")
	public String listarProfissional(Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listarProfissional = dao.listar();
		model.addAttribute("listarProfissional", listarProfissional);
		return "profissional/pesquisarProfissional";

	}

	// pesquiar profissional
	@RequestMapping("/pesquisarProfissional")
	public @ResponseBody String PesquisarProfissional(@RequestParam String nome, HttpServletResponse response) {
		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listarProfissional = dao.buscar(nome);
		StringBuilder st = new StringBuilder();
		st.append("<tr  style='background-color: #fff; font-weight:bold'>");
		st.append("<td class='span'>Nome do Profissional</td>");
		st.append("<td class='span'>Profissão</td>");
		st.append("<td class='span'>CPF</td>");
		st.append("<td class='span'>E-mail</td>");
		st.append("<td class='span'>Endereço</td>");
		st.append("<td class='span'>Telefone</td>");
		st.append("	<td class='span'>Celular</td>");
		st.append("<td class='span'>Alterar</td>");
		st.append("<td class='span'>Remover</td>");

		st.append("</tr>");
		for (Profissional profissional : listarProfissional) {
			st.append("<tr>");
			st.append("<td class='span-text' > " + profissional.getNome() + " </td>");
			st.append("<td class='span-text' > " + profissional.getProfissao() + " </td>");
			st.append("<td class='span-text'> " + profissional.getCpf() + " </td>");
			st.append("<td class='span-text'> " + profissional.getEmail() + " </td>");
			st.append("<td class='span-text' > " + profissional.getEndereco() + " </td>");
			st.append("<td class='span-text' > " + profissional.getTelefone() + " </td>");
			st.append("<td class='span-text' > " + profissional.getCelular() + " </td>");
			st.append("<td><a class='btn btn-success' style='color: white' href='exibirAlterarProfissional?id="
					+ profissional.getId() + "'>Alterar</a> &nbsp;</td>");
			st.append("<td><a  class='btn btn-danger' href='removerProfissional?id=" + profissional.getId()
					+ "'>Remover</a></td>");
			st.append("</td>");
			st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
	}

	// Alterar profissional
	@RequestMapping("/exibirAlterarProfissional")
	public String exibirAlterarProfissional(Model model, Profissional profissional) {
		ProfissionalDao dao = new ProfissionalDao();
		Profissional ProfissionalCOD = dao.buscarPorId(profissional.getId());
		model.addAttribute("profissional", ProfissionalCOD);
		return "profissional/alterarProfissional";

	}

	// Redireciona para alterar profissional
	@RequestMapping("/alterarProfissional")
	public String alterarProfissional(Profissional Profissional, Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		dao.alterar(Profissional);
		model.addAttribute("mensagem", " O Profissional foi alterado com Sucesso!");
		return "forward:exibirListarProfissional";

	}

	// remover profissional
	@RequestMapping("/removerProfissional")
	public String removeProfissional(Profissional profissional, Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		try {
			dao.remover(profissional);
		} catch (ViolacaoIntegridadeException e) {
			model.addAttribute("mensagem", "Profissional Não pode ser Removido");
			return "forward:exibirListarProfissional";
		}
		model.addAttribute("mensagem", "Profissional Removido com Sucesso");
		return "forward:exibirListarProfissional";
	}

}