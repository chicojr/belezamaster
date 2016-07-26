<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<hr>
<h1> Cadastrar Usuário </h1>
<hr>


<div id=bordaform>
<form action="incluirUsuario"  method="post">

<br>
<p>Nome:
 <input  type="text"  name="nome" required="true" maxlength="70"> <br>
</p>
<p>CPF:
 <input   type="text"   name="cpf" required="true" maxlength="14"> <br>
 </p>
 <p>E-mail:
  <input  type="text"  name="email" required="true" maxlength="30">  <br>
</p>
<p>Login:
 <input   type="text"  name="nomeUsuario"required="true" maxlength="15">  <br>
</p>
<p>Senha:
 <input  type="password"  name="senha" required="true" maxlength="10"> <br>
</p>
<p>Confirmar Senha:
 <input  type="password"  name="senha" required="true" maxlength="10"> <br>
 </p>
 <p>Telefone:
 <input  type="text"  name="telefone" required="true" maxlength="10"><br>
 </p>
 <p>Celular:
  <input   type="text"  name="celular" required="true" maxlength="10"; > <br>
 </p>
 

<input type="submit" value="Salvar">
</form>

</div>


</body>
</html>

