package br.com.ifpe.belezamaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.produto.Produto;
import br.com.ifpe.belezamaster.model.produto.ProdutoDao;

@Controller
public class ProdutoController {

	@RequestMapping("/exibirIncluirProduto")
	public String IncluirCadastroProduto( Produto produto) {
		return "produto/incluirProduto";

	}

	@RequestMapping("/incluirProduto")
	public String CadastroProduto (Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		dao.salvar(produto);
		model.addAttribute("mensagem", "Produto inserido com Sucesso!");
		return "produto/incluirProduto";
		
	}

	}

