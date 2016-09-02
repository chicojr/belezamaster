package br.com.ifpe.belezamaster.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.reserva.Atendimento;
import br.com.ifpe.belezamaster.model.reserva.AtendimentoDao;
import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;
import br.com.ifpe.belezamaster.model.usuario.Usuario;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;

@Controller
public class AtendimentoController {
	// EXIBIR INCLUIR RESERVA
		@RequestMapping("/exibirIncluirAtendimento")
		public String ExibirIncluirAtendimento(Atendimento atendimento,Model model) {
			
			ProfissionalDao dao = new ProfissionalDao();
			List<Profissional> listaProfissional = dao.listar();
			model.addAttribute("listaProfissional", listaProfissional);
			
			ServicoDao dao2 = new ServicoDao();
			List<Servico> listaServico = dao2.listar();
			model.addAttribute("listaServico", listaServico);
			
			UsuarioDao dao3 = new UsuarioDao();
			List<Usuario> listaUsuario = dao3.listar();
			model.addAttribute("listaUsuario", listaUsuario);
			
			return "reserva/fazerReserva";
		}

		
		// INCLUIR RESERVA
		@RequestMapping("/fazerReserva")
		public String IncluirAtendimento(Atendimento atendimento, BindingResult result, Model model) {
			AtendimentoDao dao = new AtendimentoDao();
			dao.salvar(atendimento);
			model.addAttribute("mensagem", "A Reserva foi cadastrado com Sucesso!!");
			return "forward:exibirIncluirAtendimento";
		}


			
	
         /*    Finalizar e registro  */
		
		
		
		
	// exibir listar registro
	@RequestMapping("/exibirListarAtendimento")
	public String listarAtendimento(Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> registrarAtendimento = dao.listar();
		model.addAttribute("registrarAtendimento", registrarAtendimento);

		return "reserva/registrarAtendimento";

	}

	// pesquisar registro
	@RequestMapping("/registrarAtendimento")
	public String PesquisarAtendimento(Model model, String situacao) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> registrarAtendimento = dao.buscar(situacao);
		model.addAttribute("registrarAtendimento", registrarAtendimento);

		return "reserva/registrarAtendimento";

	}
		// Redireciona para alterar registro
		@RequestMapping("/alterarSituacao")
		public String alterarAtendimento(Atendimento atendimento, Model model) {
			AtendimentoDao dao = new AtendimentoDao();
			Calendar horario = Calendar.getInstance();
			atendimento.setHorario(horario.getTime());
			dao.alterarRegistrar(atendimento);
			model.addAttribute("registrar", " O Atendimento foi registrado com Sucesso!");
			return "forward:exibirListarAtendimento";

		}

	

	// exibir finalizar registro
	@RequestMapping("/exibirFinalizarAtendimento")
	public String listarFinalizarAtendimento(Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> registrarAtendimento = dao.listar();
		model.addAttribute("registrarAtendimento", registrarAtendimento);

		return "reserva/finalizarAtendimento";

	}

	// Redireciona para alterar finalizar Atendimento
	@RequestMapping("/finalizarAtendimento")
	public String alterarFinalizarAtendimento(Atendimento atendimento, Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		dao.alterarFinalizar(atendimento);
		model.addAttribute("finalizar", " O Atendimento foi Finalizado com Sucesso!");
		return "forward:exibirFinalizarAtendimento";

	}
	
	// REMOVER RESERVA
		@RequestMapping("/removerCancelar")
		public String cancelarReserva(Atendimento atendimento, Model model) {
			AtendimentoDao dao = new AtendimentoDao();
			dao.cancelar(atendimento);
			model.addAttribute("cancelar", "Reserva Cancelada com Sucesso");
			return "forward:exibirListarAtendimento";
		}

}
