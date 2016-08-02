package br.com.ifpe.belezamaster.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

   	
	public Usuario buscarPorCpf(String cpf) {

	try {
	    PreparedStatement stmt = connection.prepareStatement("SELECT * FROM usuario WHERE cpf = ?");
	    stmt.setString(1, cpf);
	    ResultSet rs = stmt.executeQuery();

	    Usuario usuario = null;
	    if (rs.next()) {
		usuario = montarObjeto(rs);
	    }

	    rs.close();
	    stmt.close();
	    connection.close();
	    return usuario;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

	
    public void alterar(Usuario usuario) {

	String sql = "UPDATE usuario SET nome = ? , email = ? , telefone = ? , celular = ?  WHERE cpf = ?";

	try {

	    PreparedStatement stmt = connection.prepareStatement(sql);
	    stmt.setString(1, usuario.getNome());
	    stmt.setString(2, usuario.getEmail());
	    stmt.setString(3, usuario.getTelefone());
	    stmt.setString(4, usuario.getCelular());
	    stmt.setString(5, usuario.getCpf());
	 
	    stmt.execute();
	    stmt.close();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }
    
    
    private Usuario montarObjeto(ResultSet rs) throws SQLException {

	Usuario usuario = new Usuario();
	usuario.setNome(rs.getString("nome"));
	usuario.setEmail(rs.getString("email"));
	usuario.setTelefone(rs.getString("Telefone"));
	usuario.setCelular(rs.getString("celular"));
	usuario.setCpf(rs.getString("cpf"));


	return usuario;
    }
}


