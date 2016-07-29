<%@ page language="java" contentType="text/html; charset=UTF-8"  
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="contact">
<h3 class="m_3">Cadastrar Profissional</h3>
<div class="m_4"><span class="bottom_line"> </span></div>
<div style="text-align: center; color: red; font-size:22px "> ${mensagem} </div>

<p />


 <form action="IncluirProfissionais" method="post">
 	<span class="span">Nome do Profissional: <br /></span>
 	<input type="text" id="author" name="nome" maxlength="50" required="required"/>
 	<p />
 	<span class="span">Profissão: <br /></span>
 	<input type="text" id="author" name="profissao"  maxlength="20" required="required"/>
 	<p />
 	<span class="span">CPF: <br /></span>
 	<input type="text" id="author" name="cpf" maxlength="14" required="required"/>
 	<p />
 	<span class="span">E-mail: <br /></span>
 	<input type="text" id="author" name="email" maxlength="50" required="required"/>
 	<p />
 	<span class="span">Endereço: <br /></span>
 	<input type="text" id="author" name="endereco" maxlength="50" required="required"/>
 	<p />
 	<span class="span">Telefone: <br /></span>
 	<input type="text" id="author" name="telefone" maxlength="10" required="required"/>
 	<p />
 	<span class="span">Celular: <br /></span>
 	<input type="text" id="author" name="celular" maxlength="10" required="required"/>
 	</p>
 		
 		<input type="submit" id="submit" value="Cadastrar" name="btn-cadastrar" />
 		&nbsp;&nbsp;
 		<input type="reset" id="submit" value="Limpar" name="btn-limpar" />
 	<p />
 
 	</form>
 	</div>
</body>
</html>