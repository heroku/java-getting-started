<%@page import="java.util.List"%>
<%@page import="Model.Disciplina"%>
<%@page import="br.servlets.disciplina.consultarDisciplinaController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html> 
<head>
	<title>Consultar Disciplina</title>
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
		<form action="../ConsultarDisciplina" method="post" class="consultarcurso">
			<div>
				<h2>Consultar Disciplina</h2>
			</div>
			<div>
				<label><strong>Nome:</strong></label><input type="text"
					name="nomedisciplina">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar Disciplina">
			</div>
		</form>
		<form action="../ConsultarDisciplina" method="post">
			<div>
			<%
			if(request.getAttribute("disciplinas") != null){
				List<?> disciplinas = (List<?>) request.getAttribute("disciplinas");
				for(int c=0; c<(disciplinas.size()); c++){
					Disciplina disciplina = (Disciplina) disciplinas.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + disciplina.getNome()); %></span>
					<input id="bananaButton" type="submit" name="salvar"
						value="Alterar">
					<input id="bananaButton" type="submit" name="salvar"
						value="Apagar">
				</div>
			</div>
			<%
			}
			}
			%>
			</div>
		</form>
	</main>
</body>
</html>