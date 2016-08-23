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
<script type="text/javascript" src="view/js/validaCPF.js"></script>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>
</head>
<body>



		<c:import url="../menu/menu.jsp"></c:import>

	<div class="msg">${mensagem}</div>

	<div class="contact">
		<h3 class="m_3">Alterar Profissional</h3>
		<div class="m_4">
			<span class="bottom_line"> </span>
		</div>




		<form name="form1" action="alterarProfissional" method="post">
			<label class="span">Nome do Profissional: <br /></label> <input
				type="text" class="author" name="nome" maxlength="50"
				value="${profissional.nome}" onkeypress='return soLetras(event)'
				required="required" />
			<p />
			<br> <label class="span">Profissão: <br /></label> <input
				type="text" class="author" name="profissao" maxlength="20"
				value="${profissional.profissao}"
				onkeypress='return soLetras(event)' required="required" />
			<p />

			<br> <label class="span">E-mail: <br /></label> <input
				type="email" class="author" name="email"
				value="${profissional.email}" maxlength="50" required="required" />
			<p />
			<br> <label class="span">Endereço: <br /></label> <input
				type="text" class="author" name="endereco"
				value="${profissional.endereco}" maxlength="50" required="required" />
			<p />
			<br> <label class="span">Telefone: <br /></label> <input
				type="text" class="author" name="telefone"
				value="${profissional.telefone}" maxlength="14" id="telefone"
				required="required" />
			<p />
			<br>
			<p>
				<label class="span">Celular: <br /></label> <input type="text"
					class="author" name="celular" value="${profissional.celular}"
					maxlength="14" required="required" id="celular" />
			</p>
			<!-- id -->
			<br> <label class="span"> <br /></label> <input type="hidden"
				class="author" name="id" maxlength="14" value="${profissional.id}"
				onblur="javascript: validarCPF(this.value);"
				onkeypress="javascript: mascara(this, cpf_mask);"
				required="required" />
			<p />
			<!-- id fim-->
			<br> <input type="submit" class="submit" value="Alterar"
				name="btn-cadastrar" /> &nbsp;&nbsp; <input type="reset"
				class="submit" value="Limpar" name="btn-limpar" />

			<p />

		</form>
		<script type="text/javascript">
			jQuery.noConflict();
			jQuery(function($) {
				$("#telefone").mask("(99)9999-9999");
				$("#cpf").mask("999.999.999-99");
				$("#celular").mask("(99)99999-9999");

			});
		</script>

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