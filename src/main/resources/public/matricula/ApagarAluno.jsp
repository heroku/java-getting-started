<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>
<%@page import="br.servlets.consultarAlunoController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>SysSchool</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/styles2.css">
</head>
<body>
	<%
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("../Login.jsp");
		}	
	%>
	
	<nav class="bananaNav">
		<div class="menu">
			<ul>
				<li><img src="img/2.png" height="30px"></li>
			<div class="me"> 
			<li><a class="meua" href="Welcome.jsp">SysSchool</a></li>
			</div>
				<li><a href="Cadastrar.jsp">Voltar</a></li>
				<li><a href="Consultar.jsp">Fazer uma consulta</a></li>
			</ul>
		</div>
	</nav>
	<main class="bananaMain">
		<form action="ApagarAluno" method="post" class="bananaForm">
			<div>
				<label><strong>id:</strong></label><input type="number"
					name="idaluno">
			</div>
			<div>
				<label><strong>Nome:</strong></label><input type="text"
					name="nome">
			</div>
			<h2>OU</h2><br>
			<div>
				<label><strong>Número de matrícula:</strong></label><input type="text"
					name="numMatricula">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar Aluno">
			</div>
		</form>
	</main>
</body>
</html>