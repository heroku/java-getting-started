
<%@page import="br.servlets.curso.consultarCursoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Curso</title>
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
		<form action="../CadastrarCurso" name="curso" method="post" class="cadastrarCursoForm">
			<div>
				<h2>Cadastrar Curso</h2>
			</div>
			<div>
				<label><strong>Nome do Curso:</strong></label><input type="text"
					name="nomecurso"  required maxlength="40">
			</div>
			<div>
				<label><strong>Valor do curso</strong></label><input type="number"
					name="valor"  required maxlength="40">
			</div>
			<br>
			<div>
				<input onclick="validarCurso()" id="bananaButton" type="submit" name="salvar"
					value="Cadastrar Curso">
			</div>
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>