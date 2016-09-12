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
			model.addAttribute("nomeProduto", "*O campo não pode ser preenchido só com espaços ou caracteres. ");
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
			model.addAttribute("nomeProduto", "*O campo não pode ser preenchido só com espaços ou caracteres. ");
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
		public @ResponseBody String pesquisarProduto(@RequestParam String nome, HttpServletResponse response) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProduto = dao.buscar(nome);
		StringBuilder st = new StringBuilder();
		st.append("<tr  style='background-color: #fff; font-weight:bold'>");
		st.append("<td class='span'>Codígo</td>");
		st.append("<td class='span'>Nome do Produto</td>");
		st.append("<td class='span'>Descrição</td>");
		st.append("<td class='span'>Quantidade</td>");
		st.append("<td class='span'>Valor</td>");
		st.append("<td class='span'>Alterar</td>");
		st.append("<td class='span'>Remover</td>");
		

		st.append("</tr>");
		for (Produto produto : listarProduto) {
		st.append("<tr>");
		st.append("<td class='span-text' > " + produto.getCodigo() + " </td>");
		st.append("<td class='span-text'> " + produto.getNomeProduto() + " </td>");
		st.append("<td class='span-text'> " + produto.getDescricao() + " </td>");
		st.append("<td class='span-text' > " + produto.getQuantidade() + " </td>");
		st.append("<td class='span-text' > " + produto.getValor() + " </td>");
		st.append("<td><a class='btn btn-success' style='color: white' href='exibirAlterarProduto?codigo=" + produto.getCodigo() + "'>Editar</a> &nbsp;</td>");
		st.append("<td><a  class='btn btn-danger' href='removerProduto?codigo=" + produto.getCodigo() + "'>Remover</a></td>");
		st.append("</td>");
		st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
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