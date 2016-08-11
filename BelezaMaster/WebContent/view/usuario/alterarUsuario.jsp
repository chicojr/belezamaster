<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alterar Usuário</title>
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
<div class="msg"> ${msg} </div>
	<div class="contact">
		<h3 class="m_3">Alterar Usuário</h3>
		<div class="m_4"><span class="bottom_line"></span></div>

<form action="alterarUsuario" method="post">
			
  				
				<input type="hidden" name="id" >
				
				<div class="form-group">
    				<label class="span" for="inputNome">Nome</label><br />
    				<input type="text" class="form-control author"  name="nome" style="width: 500px;"  required="required" value="${usuario.nome}">
  				</div>
  				<br />
  				<div class="form-group">
					<label class="span" for="inputEmail">E-mail</label><br />
					<input type="email" id="inputEmail" class="form-control author" name="email" style="width: 500px;"  required="required" value="${usuario.email}" /> 
				</div>
				<br />
				<div class="form-group">
    				<label class="span" for="inputLogin">Telefone</label><br />
    				<input type="text" class="form-control author" id="telefone" name="telefone" style="width: 300px;"  required="required" value="${usuario.telefone}">
  				</div>
  				<br />
  				<div class="form-group">
    				<label class="span" for="inputSenha">Celular</label><br />
    				<input type="text" class="form-control author" id="celular" name="celular" style="width: 300px;"  required="required" value="${usuario.celular}">
  				</div>
               
                <div class="form-group">
    				<label class="span" for="inputSenha"></label><br />
    				<input type="hidden" class="form-control author" id="cpf" name="cpf" style="width: 300px;"  value="${usuario.cpf}">
  				</div>
				<br/>
  				
  				<a href="incluirUsuario" class="btn btn-danger submit link-password-02">Cancelar</a> &nbsp;
  				<button type="reset" class="btn btn-default submit"> &nbsp; Limpar &nbsp; </button> &nbsp;
  				<button type="submit" class="btn btn-warning submit"> &nbsp; Alterar &nbsp; </button>
  				
			</form>
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
<script type="text/javascript">
		jQuery.noConflict();
		jQuery(function($) {
			$("#telefone").mask("(99)9999-9999");
			$("#celular").mask("(99)99999-9999");
			$("#cpf").mask("999.999.999-99");


		});
	</script>



</body>
</html>