<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pesquisar Listar Profissional</title>
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

	<div class="contact">
		<h3 class="m_3">Pesquisar Listar Profissional</h3>
		<div class="m_4">
			<span class="bottom_line"></span>
		</div>
		<div class="msg" >${msgPr}</div>
		<div class="msg">${mensagem}</div>
		<div class="msg">${remove}</div>
		
		
		<form action="pesquisarProfissional" method="get">
			<br /> <label class="span">Nome:</label><br /> <input class="author"
				type="text" name="nome" /> <br />
			<br /> <input class="submit" type="submit" value="BUSCAR" />
		</form>



	</div>
	<br>
	<div align="center">
		<fieldset>
			<h1>Pesquisar Listar Profissional</h1>

			<table border='1' style='width: 100%;'>
				<tr style='background-color: #383838; font-weight: bold;'>
					<td class="span">NOME DO PROFISSIONAL</td>
					<td class="span">PROFISSÃO</td>
					<td class="span">CPF</td>
					<td class="span">E-MAIL</td>
					<td class="span">ENDEREÇO</td>
					<td class="span">TELEFONE</td>
					<td class="span">CELULAR</td>
					<td class="span">OPÇÕES</td>
				</tr>
				<c:forEach var="profissional" items="${listarProfissional}">
					<tr>
						<td class="span">${profissional.nome}</td>
						<td class="span">${profissional.profissao}</td>
						<td class="span">${profissional.cpf}</td>
						<td class="span">${profissional.email}</td>
						<td class="span">${profissional.endereco}</td>
						<td class="span">${profissional.telefone}</td>
						<td class="span">${profissional.celular}</td>
						<td class="span"><a style="color: white"
							href="removerProfissional?id=${profissional.id}">Remover</a>
						<td><a style="color: white"
							href="exibirAlterarProfissional?id=${profissional.id}">Alterar</a></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
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