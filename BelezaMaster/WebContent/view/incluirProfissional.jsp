<%@ page language="java" contentType="text/html; charset=UTF-8"  
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Profissional</title>
</head>
<body>
<hr>
<fieldset style="background-color: aqua;">
<h1 align="center">Cadastrar Profissional</h1><br><br>
<div style="text-align: center; color: red; font-size:40px "> ${mensagem} </div>
</fieldset>
<hr>
<fieldset style="background-color:gray ; ">
<center>
 <form action="incluirProfissional" method="post">
   <br>
 	NOME DO PROFISSIONAL: <br />
 	<input type="text" name="nome" maxlength="50" required="required"/>
 	<br>
 	
 	<br>
 	PROFISSÃO:<br>
 	<input type="text" name="profissao"  maxlength="20" required="required"/>
 	<br>
 	
 	<br>
 	CPF: <br />
 	<input type="text" name="cpf" maxlength="14" required="required"/>
 	<br>
 	
 	<br>
 	E-MAIL: <br>
 	<input type="email" name="email" maxlength="50" required="required"/>
 	<br>
 	
 	<br>
 	ENDEREÇO: <br />
 	<input type="text" name="endereco" maxlength="50" required="required"/>
 	<br>
 	
 	<br>
 	TELEFONE: <br />
 	<input type="text" name="telefone" maxlength="10" required="required"/>
 	<br>
 	
 	<br>
 	CELULAR: <br />
 	<input type="text" name="celular" maxlength="10" required="required"/>
 	<br>
 	<br>
 	<br>
 	
 	<input type="submit" value="Confirmar" name="btn-cadastroProfissional"/>
 	</form>
 	</center>
 	</fieldset>
</body>
</html>