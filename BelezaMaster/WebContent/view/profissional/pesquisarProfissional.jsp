<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
<href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="view/css/style.css" rel="stylesheet" type="text/css" />
<title>Beleza Master - Especialista em Designer de Cortes
	Femininos e Masculinos</title>

<!-- Bootstrap Core CSS -->


<!-- Custom Fonts -->
<link href="view/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="view/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<link href="view/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="view/css/creative.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-dark-2">

	<c:import url="../menu/menu.jsp"></c:import>


	<br>
	<br>
	<br>
	<br>
	<br>

	<center>
		<div class="container">
			<div class="msg alert alert-success fade in">${mensagem}
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			</div>
		</div>
	</center>
	<div id="loginbox" style="margin-top: 50px;"
		class=" col-md-6 col-md-offset-3 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Listar Profissional</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>


		<div class="msg" >${msgPr}</div>
		<div class="msg">${mensagem}</div>
		<div class="msg">${remove}</div>
		
		
		<form action="pesquisarProfissional" method="get">
			<br /> <label class="span">Nome:</label><br /> <input class="form-control"
				type="text" name="nome" onkeypress="mascara(this,soLetras)" /> <br />
			<br /> <input class="btn btn-primary" type="submit" value="Buscar" />
		</form>

</div>
		</div>

	</div>
	<p>
	
	
	<table border='1' class="table table-bordered">
		<tr style='background-color: #fff; font-weight: bold;'>
			<td class="span">Nome do Profissional</td>
			<td class="span">Profiss�o</td>
			<td class="span">CPF</td>
			<td class="span">E-mail</td>
			<td class="span">Endere�o</td>
			<td class="span">Telefone</td>
			<td class="span">Celular</td>
			<td class="span">Alterar</td>
			<td class="span">Remover</td>
		</tr>
		<c:forEach var="profissional" items="${listarProfissional}">
					<tr>
						<td class="span-text">${profissional.nome}</td>
						<td class="span-text">${profissional.profissao}</td>
						<td class="span-text">${profissional.cpf}</td>
						<td class="span-text">${profissional.email}</td>
						<td class="span-text">${profissional.endereco}</td>
						<td class="span-text">${profissional.telefone}</td>
						<td class="span-text">${profissional.celular}</td>
						<td><a class="btn btn-success" 
							href="exibirAlterarProfissional?id=${profissional.id}">Alterar</a></td>
						<td ><a class="btn btn-danger" 
							href="removerProfissional?id=${profissional.id}">Remover</a>
						
					</tr>
				</c:forEach>
			</table>
	<!-- jQuery -->
    <script src="view/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="view/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="view/vendor/easing/easing.min.js"></script>
    <script src="view/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="view/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="view/js/creative.min.js"></script>
    <script type="text/javascript" src="view/js/validaCPF.js"></script>
    
	
</body>
</html>