package br.com.ifpe.belezamaster.model;

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

	// aqui � o salvar
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
    	

    	return servico;
        }

}
