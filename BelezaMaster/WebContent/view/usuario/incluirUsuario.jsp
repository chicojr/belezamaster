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


</head>
<body class="bg-dark-2">

<c:import url="../menu/menu.jsp"></c:import>


<br><br><br><br><br><br>




  <div id="loginbox" style="margin-top:50px;" class=" col-md-6 col-md-offset-3 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Cadastre-se</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" action="incluirUsuario" method="post" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="nome" type="text" class="form-control" name="nome" placeholder="Digite seu nome"  onkeypress='return soLetras(event)'
				value="${usuario.nome}">  
				<form:errors path="usuario.nome"
				cssStyle="color:red; font-size:10px;" />                                      
                                    </div>
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-cc" aria-hidden="true"></i></span>
                                        <input id="cpf" type="text" class="form-control" name="cpf" value="${usuario.cpf}" placeholder="Digite seu CPF">
                                        <onblur="javascript: validarCPF(this.value);">                                        
                                    </div>
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input id="email" type="text" class="form-control" name="email" value="${usuario.email}" placeholder="Digite seu E-mail"/> 
                                        <form:errors path="usuario.email" cssStyle="color:red; font-size:10px;" />                                       
                                    </div>
                            
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="senha" type="password" class="form-control" name="senha" placeholder="Digite sua senha">
                                        <form:errors path="usuario.senha" cssStyle="color:red; font-size:10px;" />
                                    </div>
                                    
                                     <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="confSenha" type="password" class="form-control" name="confSenha" placeholder="Confirme senha">
                                        <form:errors path="usuario.senha" cssStyle="color:red; font-size:10px;" />
                                    </div>
                                    
                                     <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone-square" aria-hidden="true"></i></span>
                                        <input id="telefone" type="tel" class="form-control" name="telefone" placeholder="Digite seu telefone">
                                        <form:errors path="usuario.telefone" cssStyle="color:red; font-size:10px;" />
                                    </div>
                                    
                                     <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-mobile fa-2x" aria-hidden="true"></i></span>
                                        <input style="height: 42px;" id="celular" type="tel" class="form-control" name="celular" placeholder="Digite seu celular">
                                       <form:errors path="usuario.celular" cssStyle="color:red; font-size:10px;" />
                                    </div>
                               
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls" align="center"">
                                      <a id="btn-login" href="#" class="btn btn-success" style="padding:10px 100px 10px 100px;">Confirmar</a>
                                     

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Já é cadastrado? 
                                        <a href="exibirIndex" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Faça seu login
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     
                            
          

                        </div>                     
                    </div>  
                    
                    
                    
        </div>
        
        
        
   

	<!--  <div class="msg">${mensagem}</div>
	<div class="contact">
		<h3 class="m_3">Cadastrar Usuário</h3>
		<div class="m_4">
			<span class="bottom_line"></span>
		</div>

		<form name="form1" action="incluirUsuario" method="post">
			<label class="span">Nome:</label><br /> <input type="text"
				class="author" name="nome" required="required" id="nome"
				maxlength="50" onkeypress='return soLetras(event)'
				value="${usuario.nome}"> <br>
			<form:errors path="usuario.nome"
				cssStyle="color:red; font-size:10px;" />
			
			
			
			<br> <label class="span">CPF:</label><br /> <input type="text"
				class="author" name="cpf" required="required" id="cpf"
				maxlength="14" value="${usuario.cpf}"
				onblur="javascript: validarCPF(this.value);"> <br>
			<form:errors path="usuario.cpf" cssStyle="color:red; font-size:10px;" />
			
			
			<br> <label class="span">E-mail:</label><br /> <input
				type="email" class="author" name="email" required="required"
				maxlength="50" value="${usuario.email}"> <br>
			<form:errors path="usuario.email"
				cssStyle="color:red; font-size:10px;" />
				
				
				
			<br> <label class="span">Senha:</label><br /> <input
				type="password" class="author" name="senha" required="required"
				maxlength="20"> &nbsp;&nbsp; <span style="color: red;">${confsenha}</span><br>
			<form:errors path="usuario.senha"
				cssStyle="color:red; font-size:10px;" />
				
				
			<br> <label class="span">Confirmar Senha:</label><br /> <input
				type="password" class="author" name="confSenha" required="required"
				maxlength="20">&nbsp;&nbsp; <span style="color: red;">${confsenha}</span><br>
			<form:errors path="usuario.senha"
				cssStyle="color:red; font-size:10px;" />
				
				
			<br> <label class="span">Telefone:</label><br /> <input
				type="text" name="telefone" id="telefone" required="required"
				class="author" maxlength="14" value="${usuario.telefone}"><br>
			<form:errors path="usuario.telefone"
				cssStyle="color:red; font-size:10px;" />
				
				
			<br> <label class="span">Celular:</label><br /> <input
				type="text" class="author" name="celular" id="celular"
				required="required" maxlength="15" value="${usuario.celular}">
			<br>
			<form:errors path="usuario.celular"
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
		</div> -->
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

