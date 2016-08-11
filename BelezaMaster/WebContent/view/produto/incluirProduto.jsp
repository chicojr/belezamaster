<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<title>Cadastrar usuário</title>
<script type="text/javascript" src="view/js/validaCPF.js"></script>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>

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

	<div class="msg"> ${mensagem} </div>
	<div class="contact">
		<h3 class="m_3">Cadastrar Produto</h3>
		<div class="m_4"><span class="bottom_line"></span></div>



<form name="form1"  action="incluirProduto"  method="post">

		<label class="span">NOME DO PRODUTO:</label><br /> 
				<input type="text" class="author" name="nomeProduto" required="required" 
					maxlength="50">
		
		
             <br><br>
		<label class="span">DESCRIÇÃO:</label><br /> 
				<input type="text" class="author" name="descricao"
					maxlength="30" required="required"  >
			

             <br><br>
               <label class="span">QUANTIDADE:</label><br /> 
				<input type="text" class="author" name="quantidade"
					maxlength="10" required="required" >
			
             <br><br>
			<label class="span">VALOR:</label><br /> 
				<input type="text" class="author" name="valor" maxlength="10" required="required" >
			
             <br><br>
             
			
			<p>
				<input class="submit" type="submit" value="Enviar">
			</p>
		</form>
	</div>
	<div class="footer-bottom">
<div class="container">
				<ul class="footer-nav">
				<li><a href="exibirIncluirProduto">Cadastrar Produto</a></li>
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