
<%@page import="java.util.List"%>
<%@page import="Model.Semestre"%>
<%@page import="br.servlets.semestre.consultarSemestreController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultar Semestre</title>
	<link rel="shortcut icon" href="img/2.png">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<%
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("Login.jsp");
		}	
	%>
	
	<nav class="bananaNav">
		<ul>
			<li><img src="img/2.png" height="30px"></li>
			<div class="meuh1"> 
				<li><a class="meua" href="Dashboard.jsp">SysSchool</a></li>
			</div>
			<li><a href="Deslogar.jsp">Log out</a></li>
			<li><img src="img/LogOut.png" height="30px"></li>
		</ul>
	</nav>
	<main class="bananaMain">
		<form action="ConsultarSemestre" method="post" class="consultarcurso">
			<div>
				<h2>Consultar Semestre</h2>
			</div>
			<div class="buscarnome">
				<label><strong>Ano :</strong></label><input type="text"
					name="ano">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar semestre">
			</div>
		</form>
		<form action="ConsultarSemestre" method="post">
			<div>
			<%
			if(request.getAttribute("semestres") != null){
				List<?> semestres = (List<?>) request.getAttribute("semestres");
				for(int c=0; c<(semestres.size()); c++){
					Semestre semestre = (Semestre) semestres.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + semestre.getAno()); %></span>
					<input id="Balterar" type="submit" name="salvar"
						value="Alterar">
					<input id="Bapagar" type="submit" name="salvar"
						value="Apagar">
				</div>
			</div>
			<%
			}
			}else{
			%>
			
			<div>
				<div class="fo">
					<h2>Semestre não encontrado!</h2>
				</div>
			</div>
			<%} %>
			</div>
		</form>
	</main>
</body>
</html>