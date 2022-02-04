
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
		<div class="me"> 
		<li><a class="meua" href="Dashboard.jsp">SysSchool</a></li>
		</div>
			<li><a href="Cadastrar.jsp">Voltar</a></li>
			<li><a href="Consultar.jsp">Fazer uma consulta</a></li>
		</ul>
	</nav>
	<main class="bananaMain">
		<form action="ConsultarAluno" method="post" class="consultarcurso">
			<div class="buscarnome">
				<label><strong>Nome :</strong></label><input type="text"
					name="nome">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar Aluno">
			</div>
		</form>
		<form action="ConsultarAluno" method="post">
			<div>
			<%
			if(request.getAttribute("alunos") != null){
				List<?> alunos = (List<?>) request.getAttribute("alunos");
				for(int c=0; c<(alunos.size()); c++){
					Aluno aluno = (Aluno) alunos.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + aluno.getNome()); %></span>
					<span><%out.print("NumMatricula: " + aluno.getNmatricula()); %></span>
					<span><%out.print("Status: " + aluno.getStatus()); %></span>
					<input id="Balterar" type="submit" name="salvar"
						value="Alterar">
					<input id="Bapagar" type="submit" name="salvar"
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