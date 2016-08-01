<%@ page language="java" contentType="text/html; charset=UTF-8"  
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro do Profissional | Beleza Master</title>
</head>
<body>


<center>
<div class="contact">
<h3 class="m_3">Cadastrar Profissional</h3>
<div class="m_4"><span class="bottom_line bottom_line2"> </span></div>
<div style="text-align: center; color: red; font-size:22px "> ${mensagem} </div>

<p />


 <form action="IncluirProfissionais" method="post">
 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="span">Nome do Profissional:</label> <br />
 	<input type="text" class="text" id="author" name="nome" maxlength="50" required="required"/>
 	<p />
 	<label class="span">Profissão:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="profissao"  maxlength="20" required="required"/>
 	<p />
 	<label class="span">CPF:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="cpf" maxlength="14" required="required"/>
 	<p />
 	<label class="span">E-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="email" maxlength="50" required="required"/>
 	<p />
 	<label class="span">Endereço:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="endereco" maxlength="50" required="required"/>
 	<p />
 	<label class="span">Telefone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="telefone" maxlength="10" required="required"/>
 	<p />
 	<label class="span">Celular:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <br />
 	<input type="text" id="author" name="celular" maxlength="10" required="required"/>
 	</p>
 		
 		<input type="reset" id="btn" value="Limpar" name="btn-limpar" />
 		&nbsp;&nbsp;
 		<input type="submit" id="btn" class="btn2" value="Cadastrar" name="btn-cadastro" />&nbsp;&nbsp;
 	<p />
 
 	</form>
 	</div>
 	</center>
</body>
</html>