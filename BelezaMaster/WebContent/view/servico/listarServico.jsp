<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div class="contact">
		<h3 class="m_3">Listar Serviço</h3>
		<div class="m_4"><span class="bottom_line"></span></div>
	</div>
	<table border='1' style='width: 100%;'>
		<tr style='background-color: #383838; font-weight: bold;'>
			<td class="span"> NOME DO SERVIÇO </td>
			<td class="span"> DESCRIÇÃO </td>
			<td class="span"> VALOR </td>
			<td class="span"> OPÇÔES</td>
		</tr>
	
	<c:forEach var="servico" items="${listaServico}">
		<tr>
	    	<td class="span"> ${servico.nome} </td>
	    	<td class="span"> ${servico.descricao} </td>
	    	<td class="span"> ${servico.valor} </td>
            <td><a color="white"href="removerServico?codigo=${servico.codigo}">Remover</a></td>
	    	
	    </tr>
	</c:forEach>
	</table>
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
</body>
</html>