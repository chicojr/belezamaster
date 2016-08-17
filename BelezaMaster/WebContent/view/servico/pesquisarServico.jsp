<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Serviço</title>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>


</head>


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




<div class="contact">
	<h3 class="m_3">Pesquisar Servico</h3>
	<div class="m_4">
		<span class="bottom_line"></span>
	</div>
</div>

<form action="pesquisarServico" align="center" method="post">
	<br /> <label class="span">Nome:</label><br /> <input class="author"
		type="text" name="nome" /> <br /> <br /> <input class="submit"
		type="submit" value="BUSCAR" />
</form>


<br>
<br>
<br>
<table border='1' style='width: 100%;'>
	<tr style='background-color: #383838; font-weight: bold;'>
		<td class="span">Nome do Produto</td>
		<td class="span">Descrição</td>
		<td class="span">Valor</td>

	</tr>

	<c:forEach var="servico" items="${listaServico}">
		<tr>
			<td class="span">${servico.nome}</td>
			<td class="span">${servico.descricao}</td>
			<td class="span">${servico.valor}</td>
			<td><a color="white"
				href="removerServico?codigo=${servico.codigo}">Remover</a></td>
			<td><a style="color: white"
				href="exibirAlterarServico?codigo=${servico.codigo}">Alterar</a></td>


		</tr>
	</c:forEach>
</table>
<br />
<br />
<br />
<br />

<div class="footer-bottom">
	<div class="container">
		<ul class="footer-nav">
			<li><a href="exibirAlterarUsuario">Alterar Usuário</a></li>|
			<li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>|
			<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>|
			<li><a href="exibirListaProfissional">Pesquisar Profissional</a></li>|
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