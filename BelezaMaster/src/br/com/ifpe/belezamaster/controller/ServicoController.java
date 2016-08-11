package br.com.ifpe.belezamaster.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;


@Controller
public class ServicoController {

	@RequestMapping("/exibirIncluirServico")
	public String exibirIncluirServico(){
		return "servico/incluirServico";
		
			}
	
//incluir servico
	@RequestMapping("/incluirServico")
	public String incluirServico(@Valid Servico servico,BindingResult result, Model model){
		
		ServicoDao dao = new ServicoDao();
		dao.salvar(servico);
		model.addAttribute("mensagem","O Serviço foi cadastrado com sucesso!");

		if (result.hasErrors()) {
			return "forward:exibirIncluirServico";
			}
		
		return "servico/incluirServico";
	}
	
	//listar servico
	@RequestMapping("/exibirListarServico")
    public String listarServico(Model model) {

	ServicoDao dao = new ServicoDao();
	List<Servico> listaServico = dao.listar();
	model.addAttribute("listaServico", listaServico);

	return "servico/listarServico";
    }
	
	
	//Remover servico
	@RequestMapping("/removerServico")
	public String removerProduto(Servico servico, Model model) {
	ServicoDao dao = new ServicoDao();
	dao.remover(servico);
	model.addAttribute("mensagem", "Produto Removido com Sucesso");
	return "servico/listarServico";
	}
		
	}

	
	
	/*
	
//pesquisar servico

	@RequestMapping("/exibirPesquisarServico")
    public String exibirPesquisarServico(Model model,Servico servico) {

		
		return "servico/pesquisarServico";
	}	
	
	@RequestMapping("/PesquisarServico")
    public String PesquisarServico(Model model,String nome) {

	ServicoDao dao = new ServicoDao();
	List<Servico> pesquisarServico = dao.pesquisar(nome);
	model.addAttribute("pesquisarServico", pesquisarServico);

	return "servico/pesquiarServico";
    }
	*/

	
	
