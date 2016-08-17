<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

	<div class="msg">${mensagem}</div>
	<div class="contact">
		<h3 class="m_3">Alterar Serviço</h3>
		<div class="m_4">
			<span class="bottom_line"></span>
		</div>
		<form action="alterarServico" method="post">

			<br> <label class="span">Nome do Serviço:</label><br /> <input
				type="text" class="author" name="nome" required="true"
				maxlength="30" value="${servico.nome}"> <br>
			<form:errors path="servico.nome"
				cssStyle="color:red; font-size:10px;" />

			<br> <label class="span"> Valor: </label><br /> <input
				type="text" class="author" name="valor" required="true"
				value="${servico.valor}"> <br>
			<form:errors path="servico.valor"
				cssStyle="color:red; font-size:10px;" />
			<br> <label class="span">Descrição:</label><br /> <input
				type="text" class="author" name="descricao" maxlength="50"
				required="true" value="${servico.descricao}"> <br>
			<form:errors path="servico.descricao" style="width: 300px;"
				cssStyle="color:red; font-size:10px;" />
			<br> <br>
			<!-- codigo servico -->
			<label class="span"></label><br /> <input type="hidden"
				class="author" name="codigo" maxlength="50" required="true"
				value="${servico.codigo}"></input> <br>
			<form:errors path="servico.codigo" style="width: 300px;"
				cssStyle="color:red; font-size:10px;" />
			<br> <input type="submit" class="submit" value="Salvar">
		</form>
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