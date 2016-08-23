<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
	<href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800'
	rel='stylesheet' type='text/css'>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link href="view/css/style.css" rel="stylesheet" type="text/css" /> 
    <title>Beleza Master - Especialista em Designer de Cortes Femininos e Masculinos</title>

    <!-- Bootstrap Core CSS -->
    <link href="view/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="view/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="view/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

	    <link href="view/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	
    <!-- Theme CSS -->
    <link href="view/css/creative.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>


</head>

<body>

<c:import url="../menu/menu.jsp"></c:import>

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