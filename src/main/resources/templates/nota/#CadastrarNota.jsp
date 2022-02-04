<%@page import="java.util.List" %>
<%@page import="Model.Curso"%>
<%@page import="Model.Semestre"%>
<%@page import="Model.Disciplina"%>
<%@page import="Model.Professor"%>
<%@page import="Model.Aluno"%>
<%@page import="Model.Matricula"%>
<%@page import="br.servlets.buscarNota.buscarNotaController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="br.servlets.cadastro.cadastrarMatriculaAlunoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Nota</title>
	<link rel="shortcut icon" href="../img/2.png">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
	<%
	String usuario = (String) session.getAttribute("usuario");
	String professor= (String) session.getAttribute("professor");
	if(usuario == null && professor == null){
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
	<main class="matriculaDisMain">
    <div class="modal">
		<img src="../img/sucess3.gif" alt="sucesso">
    </div>
		<form action="../buscarNota" method="post"  class="DisForm">
			<div>
				<h2>Cadastrar Nota</h2><br> 
			</div>
			<div>
				<label><strong>CPF:</strong></label><input type="text"
					name="nome">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Buscar Aluno">
			</div>
		</form>
	</main>
<script src="../css/script.js"></script>
</body>
</html>