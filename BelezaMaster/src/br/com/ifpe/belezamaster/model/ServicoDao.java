package br.com.ifpe.belezamaster.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ServicoDao {

	// abri conexão
	private Connection connection;

	public ServicoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// aqui é o salvar
	public void salvar(Servico servico) {

		String sql = "INSERT INTO servico (nome, descricao, valor) VALUES (?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, servico.getNomeServico());
			stmt.setString(2, servico.getDescricao());

			stmt.setDouble(3, servico.getValor());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
