package br.com.ifpe.belezamaster.model.produto;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Produto {
	
	
	@NotEmpty(message = "Não é permitido caracteres e espaço.")
	@Pattern(regexp = "\\w*") 
	private String nomeProduto;
	@NotEmpty(message = "Não é permitido caracteres e espaço.")
	@Pattern(regexp = "\\w*") 
	private String descricao;
	private int codigo;
	private int quantidade;
	private double valor;
	
	
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
}