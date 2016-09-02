package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;

@Controller
public class ServicoController {

	@RequestMapping("/exibirIncluirServico")
	public String exibirIncluirServico() {
		return "servico/incluirServico";

	}

	@RequestMapping("/exibirFazerReserva")
	public String exibirFazerReserva() {
		return "servico/fazerReserva";

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
	@RequestMapping("pesquisarServico")
	public String PesquisarServico(Model model, String nome) {
		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.buscar(nome);
		model.addAttribute("listaServico", listaServico);
		return "servico/pesquisarServico";
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
		dao.remover(servico);

		model.addAttribute("mensagem", "Produto Removido com Sucesso");
		return "forward:exibirListarServico";
	}

}
