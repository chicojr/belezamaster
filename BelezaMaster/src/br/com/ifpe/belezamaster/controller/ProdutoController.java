package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.produto.Produto;
import br.com.ifpe.belezamaster.model.produto.ProdutoDao;

@Controller
public class ProdutoController {
	// exibir incluir produto
	@RequestMapping("/exibirIncluirProduto")
	public String IncluirCadastroProduto(Produto produto) {
		return "produto/incluirProduto";

	}

	// incluir produto
	@RequestMapping("/incluirProduto")
	public String CadastroProduto(@Valid Produto produto, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("nomeProduto", "* Uso de caracteres e espaços em branco proibido.");
			return "forward:exibirIncluirProduto";
		}

		ProdutoDao dao = new ProdutoDao();
		dao.salvar(produto);
		model.addAttribute("mensagem", "Produto inserido com Sucesso!");
		return "produto/incluirProduto";

	}

	// Alterar Produto
	@RequestMapping("/exibirAlterarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtos = dao.buscarPorCodigo(produto.getCodigo());
		model.addAttribute("produto", produtos);
		return "produto/alterarProduto";

	}

	// Redireciona para alterar Produto
	@RequestMapping("/alterarProduto")
	public String alterarProduto(@Valid Produto produto, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("nomeProduto", "* Uso de caracteres e espaços em branco proibido. ");
			return "forward:exibirAlterarProduto";
		}

		ProdutoDao dao = new ProdutoDao();
		dao.alterar(produto);
		model.addAttribute("mensagem", " O produto foi alterado com Sucesso!");
		return "forward:exibirListarProduto";

	}

	// exibir listar produto
	@RequestMapping("/exibirListarProduto")
	public String listarProduto(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProduto = dao.listar();
		model.addAttribute("listarProduto", listarProduto);

		return "produto/listarProduto";

	}

	// pesquisar produto
	@RequestMapping("/pesquisarProduto")
	public String PesquisarProduto(Model model, String nomeProduto) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProduto = dao.buscar(nomeProduto);
		model.addAttribute("listarProduto", listarProduto);

		return "produto/listarProduto";

	}

	// Remover produto
	@RequestMapping("/removerProduto")
	public String removerProduto(int codigo, Model model) {
		ProdutoDao dao = new ProdutoDao();
		dao.remover(codigo);

		model.addAttribute("mensagem", "Produto Removido com Sucesso");
		return "forward:exibirListarProduto";
	}

}