<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservas | Corte Mágico</title>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>


</head>

<body>



	<div class="menu">
		<ul class="nav" id="nav">
			<li><a href="exibirListarProduto">Listar Produto</a></li>
			<li><a href="exibirListarServico">Listar Serviço</a></li>
			<li><a href="exibirPesquisarPorCpf">Pesquisar Usuário</a></li>
			<li><a href="exibirListaProfissional">Pesquisar Profissional</a></li>
			<li><a href="exibirListarUsuario">Listar Usuário</a></li>
			<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>
			<li><a href="exibirIncluirProduto">Cadastrar Produto</a></li>
			<li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>
			<li><a href="exibirIncluirProfissional">Cadastrar
					Profissional</a></li>
			<li><a href="exibirLogin">Home</a></li>

		</ul>
	</div>
	<div class="msg"> ${mensagem} </div>
	<div class="contact">
		<h3 class="m_3">Fazer Reservas</h3>
		<div class="m_4"><span class="bottom_line"></span></div>
<form action="fazerReserva"  method="post" >

<br>
<select>
  <option value="Escolha o serviço">Escolha o serviço</option>
  <option value="Escova Progressiva">Escova Progressiva</option>
  <option value="corte">Corte</option>
  <option value="Hidratação">Hidratação</option>
  <option value="Manicure">Manicure</option>
</select><br>
<br>
<br>
<label class="span">Escolha a data:</label><br />
 <input  type="date" class="author" name="data" value=""> <br>
<br>
<br>
<label class="span">Escolha a hora:</label><br />
<input  type="time" class="author" name="data" value="">  <br>
<br>
<br>
<input type="submit" class="submit" value="Pesquisar"> &nbsp;&nbsp;  <input type="reset" class="submit" value="Limpar">
</form>
	<br>
	<br>

		<h3 class="m_3">Profissionais disponíveis</h3>
		<div class="m_4"><span class="bottom_line"></span></div>
</div>
	<div align="center">
			<h1></h1>
			<table border='1' style='width: 50%;'>
		<tr style='background-color: #383838; font-weight: bold;'>
					<td class="span">PROFISSIONAL</td>
					<td class="span">AGENDAR</td>
					
				</tr>
				<c:forEach var="profissional" items="">
					<tr>
						<td class="span"></td>
						<td class="span"> <input type="button" value="agendar"> Agendar</td>
						
					</tr>
				</c:forEach>
			</table>
		
	</div>

<div class="footer-bottom">
		<div class="container">
			<ul class="footer-nav">
				<li><a href="exibirAlterarUsuario">Alterar Usuário</a></li>|
				<li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>|
				<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>|
				<li><a href="exibirListaProfissional">Pesquisar
						Profissional</a></li>|
				<li><a href="exibirIncluirProfissional">Cadastrar
						Profissional</a></li>|
				<li><a href="exibirLogin">Home</a></li>
			</ul>
			<div class="copy">
				<p>
					© 2014 Template by <a href="#" target="_blank"
						class="link-password-02">ALM e Suplementos</a>
				</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>

</body>
</html>