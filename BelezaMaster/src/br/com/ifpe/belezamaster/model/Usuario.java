package br.com.ifpe.belezamaster.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Usuario {

	@NotEmpty(message = "O nome deve ser preenchido")
	@Size(max = 50, message = " O nome deve deve ter no máximo 50 caracteres")

	private String nome;

	@NotEmpty(message = "O código deve ser preenchido")
	@Size(max = 50, message = " O E-mail deve deve ter no máximo 50 caracteres")
	private String email;

	@NotEmpty
	@Size(max = 20, message = " O Login deve deve ter no máximo 20 caracteres ")
	private String nomeUsuario;

	@NotEmpty(message = "A senha deve ser preenchida")
	@Size(min = 6, max = 20, message = "A senha deve ter no minímo 6 e no máximo 20 caracteres")
	private String senha;

	@NotEmpty(message = "A senha deve ser preenchida")
	@Size(min = 6, max = 20, message = "A senha deve ter no minímo 6 e no máximo 20 caracteres")
	private String confSenha;

	@NotEmpty
	@Size(min = 14, max = 14, message = "O CPF deve ter obrigatoriamente 14 caracteres, seguindo o seguinte padrão (XXX.XXX.XXX-XX)")
	private String cpf;

	@NotEmpty
	@Size(max = 15, message = " O Telefone deve deve ter no máximo 13 caracteres, seguindo o padrão '(XX)XXXXX-XXXX' ")
	private String telefone;

	@NotEmpty
	@Size(max = 15, message = " O Telefone deve deve ter no máximo 13 caracteres, seguindo o padrão '(XX)XXXXX-XXXX' ")
	private String celular;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getConfSenha() {
		return confSenha;
	}

	public void setConfSenha(String confSenha) {
		this.confSenha = confSenha;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

}
