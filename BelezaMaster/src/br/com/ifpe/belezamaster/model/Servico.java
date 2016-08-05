package br.com.ifpe.belezamaster.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Servico {
     
	@NotEmpty(message="O campo de ser preenchido")
	@Size(max= 30, message=" O nome do servi�o deve ter no m�ximo 30 caracteres")
	private String nome;
	
	@NotEmpty(message=" O campo de ser preenchido")
	@Size(max= 50, message="A descri��o deve ter no m�ximo 50 caracteres ")
	private String descricao;  
	
	private double valor;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
}
