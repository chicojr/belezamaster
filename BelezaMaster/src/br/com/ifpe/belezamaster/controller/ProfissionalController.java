package br.com.ifpe.belezamaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.Profissional;
import br.com.ifpe.belezamaster.model.ProfissionalDao;

@Controller
public class ProfissionalController {
	
	//CADASTRANDO O PROFISSIONAL
	
	@RequestMapping("/exibirincluirprofissional")
	public String exibirIncluirProfissional(Profissional profissional) {
	return "incluirProfissional";
	}
	
	//INCLUINDO O PROFISSIONAL
	
	@RequestMapping("/incluirProfissional")
	public String incluirProfissional(Profissional profissional,Model model) {
	ProfissionalDao dao = new ProfissionalDao();
	dao.salvar(profissional);
	model.addAttribute("mensagem","Profissional Adicionado com Sucesso!");
	return "incluirProfissional";
	
	}

	
}