package br.com.ifpe.belezamaster.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;

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
	@RequestMapping("pesquisarProfissional")
	public String PesquisarProfissional(Model model, String nome) {
		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listarProfissional = dao.buscar(nome);
		model.addAttribute("listarProfissional", listarProfissional);
		return "profissional/pesquisarProfissional";
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
		dao.remover(profissional);
		model.addAttribute("mensagem", "Profissional Removido com Sucesso");
		return "forward:exibirListarProfissional";
	}

}