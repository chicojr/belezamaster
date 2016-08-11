<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Pesquisar Profissional | Beleza Master </title>
</head>
<body>
<div class="menu">
		<ul class="nav" id="nav">
			<li><a href="exibirListarServico">Listar Serviço</a></li>
			<li><a href="exibirPesquisarPorCpf">Pesquisar Usuário</a></li>
			<li><a href="exibirListaProfissional">Pesquisar Profissional</a></li>
			<li><a href="exibirAlterarUsuario">Alterar Usuário</a></li>
			<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>
		    <li><a href="exibirIncluirProduto">Cadastrar Produto</a></li>
		    <li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>		
			<li><a href="exibirIncluirProfissional">Cadastrar Profissional</a></li>
			<li><a href="exibirLogin">Home</a></li>
		</ul>
	</div>
	<div class="contact">
		<h3 class="m_3">Pesquisar Profissional</h3>
		<div class="m_4"><span class="bottom_line"></span></div>
		<form method="post" action="#">
			<p>
			<label class="span">Nome:</label><br />
			</p>
			<input class="author" type="text" name="nomeProfissional" />
			<br><br>
			<p>
			<label class="span">Área de Atuação:</label><br />
			</p>
			<input type="text" class="author" name="areaAtuacao" />
			<br><br>
			<input type="submit" class	="submit" name="btn-pesquisar" value="Pesquisar">
		</form>
		<br><br><br>
	</div>
	<div class="footer-bottom">
	<div class="container">
				<ul class="footer-nav">
	  			 <li><a href="exibirAlterarUsuario">Alterar Usuário</a></li>|
				   <li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>|
				   <li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>|
				   <li><a href="exibirListaProfissional">Pesquisar Profissional</a></li>|
				   <li><a href="exibirIncluirProfissional">Cadastrar Profissional</a></li>|
				   <li><a href="exibirLogin">Home</a></li> 
	  		</ul>
	  		<div class="copy">
			   <p>© 2014 Template by <a href="#" target="_blank" class="link-password-02">ALM e Suplementos</a></p>
		    </div>
		    <div class="clear"></div>
	  	</div>
	  </div>
	  		
</body>
</html>