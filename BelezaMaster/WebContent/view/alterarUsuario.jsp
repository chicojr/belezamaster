<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="alterarUsuario" method="post">
			
  				
				<input type="hidden" name="id" >
				
				<div class="form-group">
    				<label for="inputNome">Nome</label>
    				<input type="text" class="form-control" id="inputNome" name="nome" style="width: 500px;"  required="required" value="${usuario.nome}">
  				</div>
  				
  				<div class="form-group">
					<label for="inputEmail">E-mail</label>
					<input type="text" id="inputEmail" class="form-control" name="email" style="width: 500px;"  required="required" value="${usuario.email}" /> 
				</div>
				
				<div class="form-group">
    				<label for="inputLogin">Telefone</label>
    				<input type="text" class="form-control" id="inputLogin" name="telefone" style="width: 300px;"  required="required" value="${usuario.telefone}">
  				</div>
  				
  				<div class="form-group">
    				<label for="inputSenha">Celular</label>
    				<input type="text" class="form-control" id="inputSenha" name="celular" style="width: 300px;"  required="required" value="${usuario.celular}">
  				</div>

				<br />
  				
  				<a href="incluirUsuario" class="btn btn-danger">Cancelar</a> &nbsp;
  				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
  				<button type="submit" class="btn btn-warning"> &nbsp; Alterar &nbsp; </button>
  				
			</form>




</body>
</html>