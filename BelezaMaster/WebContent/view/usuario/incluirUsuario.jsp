<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<h3 class="m_3">Cadastrar Usuário</h3>
		<div class="m_4"><span class="bottom_line"></span></div>
	
		<form name="form1"  action="incluirUsuario"  method="post">
				<label class="span">Nome:</label><br /> 
				
				<input type="text" class="author" name="nome" required="required" id="nome"
					maxlength="50" onkeypress='return soLetras(event)'value="${usuario.nome}"> <br>
				<form:errors path="usuario.nome" cssStyle="color:red; font-size:10px;" />
			<br>
			
				<label class="span">CPF:</label><br /> 
				<input type="text" class="author" name="cpf" required="required" id="cpf"
					maxlength="14" value="${usuario.cpf}"
					onblur="javascript: validarCPF(this.value);"> <br>
				<form:errors path="usuario.cpf"
					cssStyle="color:red; font-size:10px;" />
			<br>
		
				<label class="span">E-mail:</label><br />  
				<input type="email" class="author" name="email" required="required"
					maxlength="50" value="${usuario.email}"> <br>
				<form:errors path="usuario.email"
					cssStyle="color:red; font-size:10px;" />
			<br>
				<label class="span">Senha:</label><br /> 
				<input type="password" class="author" name="senha" required="required"
					maxlength="20"> &nbsp;&nbsp; <span style="color:red;">${confsenha}</span><br> 
				<form:errors path="usuario.senha"
					cssStyle="color:red; font-size:10px;" />
			<br>

				<label class="span">Confirmar Senha:</label><br /> 
				<input type="password" class="author" name="confSenha"
					required="required" maxlength="20">&nbsp;&nbsp; <span style="color:red;">${confsenha}</span><br>
				<form:errors path="usuario.senha"
					cssStyle="color:red; font-size:10px;" />
			<br>

				<label class="span">Telefone:</label><br /> 
				<input type="text" name="telefone" id="telefone"
					required="required" class="author" maxlength="14" value="${usuario.telefone}"><br>
				<form:errors path="usuario.telefone"
					cssStyle="color:red; font-size:10px;" />
			<br>
				
				<label class="span">Celular:</label><br /> 
				<input type="text" class="author" name="celular" id="celular"
					required="required" maxlength="15" value="${usuario.celular}">
				<br>
				<form:errors path="usuario.celular"
					cssStyle="color:red; font-size:10px;" />
			<br>
			<input type="submit" class="submit" value="Salvar">
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
	  		

	<script type="text/javascript">
		jQuery.noConflict();
		jQuery(function($) {
			$("#telefone").mask("(99)9999-9999");
			$("#cpf").mask("999.999.999-99");
			$("#celular").mask("(99)99999-9999");

		});
		
	
	</script>



</body>
</html>

