package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;
import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;

@Controller
public class ServicoController {

	@RequestMapping("/exibirIncluirServico")
	public String exibirIncluirServico() {
		return "servico/incluirServico";

	}

	// incluir servico
	@RequestMapping("/incluirServico")
	public String incluirServico(@Valid Servico servico, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("nome", "*O campo não pode ser preenchido só com espaços ou caracteres. ");
			return "forward:exibirIncluirServico";
		}

		ServicoDao dao = new ServicoDao();
		dao.salvar(servico);
		model.addAttribute("mensagem", "O Serviço foi cadastrado com sucesso!");
		return "servico/incluirServico";

	}

	// listar servico

	@RequestMapping("/exibirListarServico")
	public String listarServico(Model model) {
		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.listar();
		model.addAttribute("listaServico", listaServico);
		return "servico/pesquisarServico";

	}

	// pesquiar servico
	@RequestMapping("/pesquisarServico")
	public @ResponseBody String pesquisarServico(@RequestParam String nome, HttpServletResponse response) {
		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.buscar(nome);
		StringBuilder st = new StringBuilder();
		st.append("<tr  style='background-color: #fff; font-weight:bold'>");
		st.append("<td class='span'>Nome do Servico</td>");
		st.append("<td class='span'>Descrição</td>");
		st.append("<td class='span'>Valor</td>");
		st.append("<td class='span'>Codígo</td>");
		st.append("<td class='span'>Alterar</td>");
		st.append("<td class='span'>Remover</td>");

		st.append("</tr>");
		for (Servico servico : listaServico) {
			st.append("<tr>");
			st.append("<td class='span-text'> " + servico.getNome() + " </td>");
			st.append("<td class='span-text'> " + servico.getDescricao() + " </td>");
			st.append("<td class='span-text' > " + servico.getValor() + " </td>");
			st.append("<td class='span-text' > " + servico.getCodigo() + " </td>");
			st.append("<td><a class='btn btn-success' style='color: white' href='exibirAlterarServico?codigo="
					+ servico.getCodigo() + "'>Editar</a> &nbsp;</td>");
			st.append("<td><a  class='btn btn-danger' href='removerServico?codigo=" + servico.getCodigo()
					+ "'>Remover</a></td>");
			st.append("</td>");
			st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
	}

	// alterar Servico
	@RequestMapping("/exibirAlterarServico")
	public String exibirServico(Model model, Servico servico) {

		ServicoDao dao = new ServicoDao();
		Servico server = dao.buscarPorCodigo(servico.getCodigo());
		model.addAttribute("servico", server);
		return "servico/alterarServico";
	}

	// Redireciona para alterar servico
	@RequestMapping("/alterarServico")
	public String alterarServico(@Valid Servico servico, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("nome", "*O campo não pode ser preenchido só com espaços ou caracteres. ");
			return "forward:exibirAlterarServico";
		}

		ServicoDao dao = new ServicoDao();
		dao.alterar(servico);
		model.addAttribute("mensagem", " O Servico foi alterado com Sucesso!");
		return "servico/alterarServico";

	}

	// Remover servico
	@RequestMapping("/removerServico")
	public String removerServico(Servico servico, Model model) {
		ServicoDao dao = new ServicoDao();
		try {
			dao.remover(servico);
		} catch (ViolacaoIntegridadeException e) {
			model.addAttribute("mensagem", "Servico não pode ser removido");
			return "forward:exibirListarServico";

		}

		model.addAttribute("mensagem", "Servico Removido com Sucesso");
		return "forward:exibirListarServico";
	}

}
