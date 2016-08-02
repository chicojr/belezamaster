<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Serviço</title>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>


</head>

<body>

<hr>
<h1> Cadastrar Serviço </h1>
<hr>
<h3 Style="font-color:blue;" aling="center">${mensagem}</h3>
<hr>
<div id=bordaform>
<form action="incluirServico"  method="post" >

<br>
<p>Nome do Serviço:
 <input  type="text"  name="nomeServico" required="true" maxlength="30" value="${servico.nomeServico}"> <br>
<form:errors path="usuario.nomeServico" cssStyle="color:red; font-size:10px;"  />
</p>

<p>Valor:
 <input   type="text"   name="valor" required="true" value="${servico.valor}"> <br>
 <form:errors path="servico.valor" cssStyle="color:red; font-size:10px;"  />
 </p>
 
<p>Descrição:
 <textarea   type="text"  name="descricao" maxlength="50" required="true" value="${servico.descricao}"></textarea>  <br>
   <form:errors path="servico.descricao" cssStyle="color:red; font-size:10px;"  />
</p>

 

<input type="submit" value="Salvar">
</form>



</div>

</body>
</html>
