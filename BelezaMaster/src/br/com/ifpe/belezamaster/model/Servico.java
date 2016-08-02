package br.com.ifpe.belezamaster.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Servico {
     
	@NotEmpty(message="O campo de ser preenchido")
	@Size(max= 30, message=" O nome do serviço deve ter no máximo 30 caracteres")
	private String nomeServico;
	
	@NotEmpty(message=" O campo de ser preenchido")
	@Size(max= 50, message="A descrição deve ter no máximo 50 caracteres ")
	private String descricao;  
	
	private double valor;

	public String getNomeServico() {
		return nomeServico;
	}

	public void setNomeServico(String nomeServico) {
		this.nomeServico = nomeServico;
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
