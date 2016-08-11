package br.com.ifpe.belezamaster.model.servico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
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
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getValor());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
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

	
	/*
	public List<Servico> buscar(String nome) {

		try {
			List<Servico> listaServico = new ArrayList<Servico>();
			java.sql.PreparedStatement stmt = connection
					.prepareStatement("SELECT * FROM Servico WHERE nome like ?");
			stmt.setString(1, "%" + nome + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listaServico.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();

			return listaServico;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
	
	
	
	
	
	//Pesquisar Servico
	

	
	public List<Servico> pesquisar(String nome) {

		try {
		    List<Servico> pesquisarServico = new ArrayList<Servico>();

		    PreparedStatement stmt = null;

		    if (!nome.equals("") ) {
			stmt = this.connection.prepareStatement("SELECT * FROM servico WHERE nome like ? ORDER BY nome");
			stmt.setString(1, '%' + nome + '%');
		    } else if (nome.equals("") ) {
			stmt = this.connection.prepareStatement("SELECT * FROM servico WHERE nome like ? ORDER BY nome");
			stmt.setString(1, '%' +nome + '%');
		    } else if (!nome.equals("")) {
			stmt = this.connection.prepareStatement("SELECT * FROM servico WHERE nome like ? ORDER BY nome");
			stmt.setString(1, '%' + nome + '%');
		
		    } else {
			stmt = this.connection.prepareStatement("SELECT * FROM servico ORDER BY nome");
		    }

		    ResultSet rs = stmt.executeQuery();

		    while (rs.next()) {
		    	pesquisarServico.add(montarObjeto(rs));
		    }

		    rs.close();
		    stmt.close();
		    connection.close();

		    return pesquisarServico;
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
	    }

	*/
	
	
	
	
// Listar servico
	public List<Servico> listar() {

		try {
			List<Servico> listaServico = new ArrayList<Servico>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM servico ORDER BY nome");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listaServico.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listaServico;

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
