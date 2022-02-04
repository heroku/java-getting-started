
<%@page import="br.servlets.semestre.cadastrarSemestreController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Semestre</title>
	<link rel="shortcut icon" href="../img/2.png">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
	<%
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("../Login.jsp");
		}	
	%>
	
	<nav class="bananaNav">
		<ul>
			<li><img src="../img/2.png" height="30px"></li>
			<div class="meuh1"> 
				<li><a class="meua" href="../Dashboard.jsp">SysSchool</a></li>
			</div>
			<li><a href="../Deslogar.jsp">Log out</a></li>
			<li><img src="../img/LogOut.png" height="30px"></li>
		</ul>
	</nav>
	<main class="bananaMain">
    <div class="modal">
		<img src="../img/sucess3.gif" alt="sucesso">
    </div>
		<form action="../CadastrarSemestre" name="semestre" method="post" class="cadastrarCursoForm">
			<div>
				<h2>Cadastrar Semestre</h2>
			</div>
			<div>
				<label><strong>Ano e semestre:</strong></label><input type="text"
					name="ano" placeholder="Ex: 2020.1" required maxlength="40" >
			</div>
			<br>
			<div>
				<input onclick="validarSemestre()" id="bananaButton" type="submit" name="salvar"
					value="Cadastrar Semestre">
			</div>
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>