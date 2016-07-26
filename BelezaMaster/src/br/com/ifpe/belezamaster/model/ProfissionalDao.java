package br.com.ifpe.belezamaster.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.belezamaster.model.Profissional;
import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ProfissionalDao {

	private Connection connection;

	public ProfissionalDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
						
	
	                          
	                            //Salvar

	public void salvar(Profissional profissional) {
		try {
			String sql = "INSERT INTO PROFISSIONAL ( nome, profissao, cpf,email, endereco,telefone,celular) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, profissional.getNome());
			stmt.setString(2, profissional.getProfissao());
			stmt.setString(3, profissional.getCpf());
			stmt.setString(4, profissional.getEmail());
			stmt.setString(5, profissional.getEndereco());
			stmt.setString(6, profissional.getTelefone());
			stmt.setString(7, profissional.getCelular());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);	
		}
	}
	
	
										//Alterar
    
				public void alterar(Profissional profissional) {
				
				try {
				String sql = "UPDATE PROFISSIONAL SET nome = ?, profissao = ?, cpf = ?,email = ?, endereco = ?,telefone = ?,celular = ?, WHERE id = ?";
				PreparedStatement stmt = connection.prepareStatement(sql);
			
				stmt.setString(1, profissional.getNome());
				stmt.setString(2, profissional.getProfissao());
				stmt.setString(3, profissional.getCpf());
				stmt.setString(4, profissional.getEmail());
				stmt.setString(5, profissional.getEndereco());
				stmt.setString(6, profissional.getTelefone());
				stmt.setString(7, profissional.getCelular());
			
				
				stmt.execute();
				connection.close();
				
				} catch (SQLException e) {
				throw new RuntimeException(e);   
				}
				}
	
	
	
					       
					    		  //Remover
	
	public void remover(Profissional profissional) {

    	try {
    	    PreparedStatement stmt = connection.prepareStatement("DELETE FROM PROFISSIONAL WHERE id = ?");
    	    stmt.setInt(1, profissional.getId());
    	    stmt.execute();
    	    stmt.close();
    	    connection.close();
    	} catch (SQLException e) {
    	    throw new RuntimeException(e);
    	}
        }
	
	
	

								//Listar
	
	
	public List<Profissional> listar() {

    	try {
    	    List<Profissional> listaProfissional = new ArrayList<Profissional>();
    	    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM PROFISSIONAL ORDER BY nome");

    	    ResultSet rs = stmt.executeQuery();

    	    while (rs.next()) {
    	    	listaProfissional.add(montarObjeto(rs));
    	    }

    	    rs.close();
    	    stmt.close();
    	    connection.close();

    	    return listaProfissional;
    	} catch (SQLException e) {
    	    throw new RuntimeException(e);
    	}
        }
	
	
	
							//Montar o Objeto
	
	private Profissional montarObjeto(ResultSet rs) throws SQLException {

		Profissional profissional = new Profissional();
    	
		profissional.setId(rs.getInt("ID"));
		profissional.setNome(rs.getString("NOME"));
		profissional.setProfissao(rs.getString("PROFISSAO"));
		profissional.setCpf(rs.getString("CPF"));
		profissional.setEmail(rs.getString("EMAIL"));
		profissional.setEndereco(rs.getString("ENDERECO"));
		profissional.setTelefone(rs.getString("TELEFONE"));
		profissional.setCelular(rs.getString("CELULAR"));
    	return profissional;
    	
        }
} 
	
