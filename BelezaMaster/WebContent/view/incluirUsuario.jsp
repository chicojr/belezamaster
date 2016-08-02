<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cadastrar usuário</title>
<script type="text/javascript" src="view/js/validaCPF.js"></script>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>

</head>
<body>

	<hr>
	<h1>Cadastrar Usuário</h1>
	<hr>
	<h3 Style="font-color: blue;">${mensagem}</h3>

	<div id=bordaform>
		<form action="incluirUsuario" method="post">

			<br>
			<p>
				Nome: <input type="text" name="nome" required="true" id="nome"
					maxlength="50" value="${usuario.nome}"> <br>
				<form:errors path="usuario.nome" cssStyle="color:red; font-size:10px;" />
			</p>
			<p>
				CPF: <input type="text" name="cpf" required="required" id="cpf"
					maxlength="14" value="${usuario.cpf}"
					onblur="javascript: validarCPF(this.value);"> <br>
				<form:errors path="usuario.cpf"
					cssStyle="color:red; font-size:10px;" />
			</p>
			<p>
				E-mail: <input type="email" name="email" required="true"
					maxlength="50" value="${usuario.email}"> <br>
				<form:errors path="usuario.email"
					cssStyle="color:red; font-size:10px;" />
			</p>
			<p>
				Login: <input type="text" name="nomeUsuario" required="true"
					maxlength="20" value="${usuario.nomeUsuario}" > <br>
				<form:errors path="usuario.nomeUsuario"
					cssStyle="color:red; font-size:10px;" />
			</p>

			<p>
				Senha: <input type="password" name="senha" required="true"
					maxlength="20"> &nbsp;&nbsp; <span style="color:red;">${confsenha}</span><br> 
				<form:errors path="usuario.senha"
					cssStyle="color:red; font-size:10px;" />
			</p>

			<p>
				Confirmar Senha: <input type="password" name="confSenha"
					required="true" maxlength="20">&nbsp;&nbsp; <span Style="font-color:red;">${confsenha}</span><br>
				<form:errors path="usuario.senha"
					cssStyle="color:red; font-size:10px;" />
			</p>

			<p>
				Telefone: <input type="text" name="telefone" id="telefone"
					required="true" maxlength="14" value="${usuario.telefone}"><br>
				<form:errors path="usuario.telefone"
					cssStyle="color:red; font-size:10px;" />
			</p>
			<p>
				Celular: <input type="text" name="celular" id="celular"
					required="true" maxlength="15" value="${usuario.celular}">
				<br>
				<form:errors path="usuario.celular"
					cssStyle="color:red; font-size:10px;" />
			</p>
			<input type="submit" value="Salvar">
		</form>


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

