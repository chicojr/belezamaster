package br.com.ifpe.belezamaster.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class UsuarioDao {
	
	private Connection connection;

	public UsuarioDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void salvar(Usuario usuario) {

		String sql = "INSERT INTO usuario (cpf, nome, email, nome_usuario, senha, telefone, celular) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usuario.getCpf());
			stmt.setString(2, usuario.getNome());
			stmt.setString(3, usuario.getEmail());
			stmt.setString(4, usuario.getNomeUsuario());
			stmt.setString(5, usuario.getSenha());
			stmt.setString(6, usuario.getTelefone());
			stmt.setString(7, usuario.getCelular());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
