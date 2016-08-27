package br.com.ifpe.belezamaster.model.reserva;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;
import br.com.ifpe.belezamaster.model.usuario.Usuario;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;
import br.com.ifpe.belezamaster.util.ConnectionFactory;
import br.com.ifpe.belezamaster.util.Datas;

public class AtendimentoDao {

	private Connection connection;

	public AtendimentoDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// SALVAR RESERVA

	public void salvar(Atendimento atendimento) {
		try {
			String sql = "INSERT INTO ATENDIMENTO (horario, codigo, id_profissional , situacao, codigo_servico , cpf_usuario) VALUES(?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, Datas.criarDataSQL(atendimento.getHorario()));
			stmt.setInt(2, atendimento.getCodigoAtendimento());
			stmt.setInt(3, atendimento.getProfissional().getId());
			stmt.setString(4, atendimento.getSituacao());
			stmt.setInt(5, atendimento.getServico().getCodigo());
			stmt.setString(6, atendimento.getUsuario().getCpf());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Alterar registra atendimento

	public void alterarRegistrar(Atendimento atendimento) {
		String sql = "UPDATE ATENDIMENTO SET situacao = 'A', horario = ?  WHERE codigo = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, new java.sql.Date(atendimento.getHorario().getTime()));
			stmt.setInt(2, atendimento.getCodigoAtendimento());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterarFinalizar(Atendimento atendimento) {
		String sql = "UPDATE ATENDIMENTO SET situacao = 'A'  WHERE codigo = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, atendimento.getCodigoAtendimento());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// BuscarPorNome

	public List<Atendimento> buscar(String situacao) {

		try {
			List<Atendimento> BuscaAtendimento = new ArrayList<Atendimento>();
			java.sql.PreparedStatement stmt = connection
					.prepareStatement("SELECT * FROM ATENDIMENTO WHERE situacao like ?");
			stmt.setString(1, "%" + situacao + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				BuscaAtendimento.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();

			return BuscaAtendimento;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Listar profissional
	public List<Atendimento> listar() {

		try {
			List<Atendimento> registrarAtendimento = new ArrayList<Atendimento>();
			PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("select * from ATENDIMENTO;");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				registrarAtendimento.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return registrarAtendimento;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Montar o Objeto

	private Atendimento montarObjeto(ResultSet rs) throws SQLException {

		Atendimento atendimento = new Atendimento();

		atendimento.setHorario(rs.getDate("horario"));
		atendimento.setCodigoAtendimento(rs.getInt("codigo"));
		atendimento.setDataAtendimento(rs.getDate("data_atendimento"));
		atendimento.setSituacao(rs.getString("situacao"));

		UsuarioDao dao = new UsuarioDao();
		atendimento.setUsuario(dao.buscarPorCpf(rs.getString("cpf_usuario")));

		ServicoDao dao1 = new ServicoDao();
		atendimento.setServico(dao1.buscarPorCodigo(rs.getInt("codigo_servico")));

		ProfissionalDao dao2 = new ProfissionalDao();
		atendimento.setProfissional(dao2.buscarPorId(rs.getInt("id_profissional")));

		return atendimento;
	}
}