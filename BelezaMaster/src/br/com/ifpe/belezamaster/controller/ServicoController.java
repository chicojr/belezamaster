package br.com.ifpe.belezamaster.controller;


import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.Servico;
import br.com.ifpe.belezamaster.model.ServicoDao;


@Controller
public class ServicoController {

	@RequestMapping("/exibirIncluirServico")
	public String exibirIncluirServico(){
		return "incluirServico";
		
			}
	

	@RequestMapping("/incluirServico")
	public String incluirServico(@Valid Servico servico,BindingResult result, Model model){
		
		ServicoDao dao = new ServicoDao();
		dao.salvar(servico);
		model.addAttribute("mensagem","O Serviço foi cadastrado com sucesso!");

		if (result.hasErrors()) {
			return "forward:exibirIncluirServico";
			}
		
		return "incluirServico";
	}
	
	
}
	
	
