package br.com.ifpe.belezamaster.model.servico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ServicoDao {

	// abri conex�o
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

		String sql = "INSERT INTO SERVICO (nome, descricao, valor) VALUES (?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getValor());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// remover
	public void remover(Servico servico) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM SERVICO WHERE codigo = ?");
			stmt.setInt(1, servico.getCodigo());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// alterar servico
	public void alterar(Servico servico) {
		String sql = "UPDATE SERVICO SET nome = ? , descricao = ? , valor = ?  WHERE codigo=?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getValor());
			stmt.setInt(4, servico.getCodigo());

			stmt.execute();
			stmt.close();

			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Buscar por codigo
	public Servico buscarPorCodigo(int codigo) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM SERVICO WHERE codigo = ?");
			stmt.setInt(1, codigo);
			ResultSet rs = stmt.executeQuery();

			Servico servico = null;
			if (rs.next()) {
				servico = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return servico;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	

	public List<Servico> buscar(String nome) {
		try {
			List<Servico> listarServico = new ArrayList<Servico>();
			PreparedStatement stmt = null;
			stmt = connection.prepareStatement("SELECT * FROM SERVICO WHERE nome like ?");
			stmt.setString(1, "%" + nome + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarServico.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();

			return listarServico;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Servico montarObjeto(ResultSet rs) throws SQLException {

		Servico servico = new Servico();

		servico.setNome(rs.getString("nome"));
		servico.setDescricao(rs.getString("descricao"));
		servico.setValor(rs.getDouble("valor"));
		servico.setCodigo(rs.getInt("codigo"));

		return servico;
	}
}