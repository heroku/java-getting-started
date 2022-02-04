
<%@page import="Model.Professor"%>
<%@page import="Model.Disciplina"%>
<%@page import="java.util.List" %>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="br.servlets.disciplina.cadastrarDisciplinaController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Disciplina</title>
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
		<form action="../CadastrarDisciplina" name="disciplina" method="post" class="cadastrarDisciplinaForm">
			<div>
				<h2>Cadastrar Disciplina</h2>
			</div>
			<div>
				<label><strong>Nome da Discipplina:</strong></label><input type="text"
					name="nomedisciplina" placeholder="Ex: nome" required maxlength="40">
			</div>
			<div>
				<label><strong>Valor da Disciplina:</strong></label><input type="number"
					name="valor" placeholder="Ex: 100,00"  required maxlength="6" min="1">
			</div>
			<div>
				<label><strong>Professor:</strong></label>
			<select name="cdprofessor">
			<%
				List<?> professores  = new Professor().consultar("");
				for(int c=0; c<(professores.size()); c++){
					Professor professor = (Professor) professores.get(c);
					%>
					<option value="<%out.print(professor.getCdprofessor());%>"><%out.print(professor.getNome()); %></option>
			<%} %>
			</select>
			</div>
			<br>
			<div>
				<input onclick="validarDisciplina()" id="bananaButton" type="submit" name="salvar"
					value="Cadastrar Disciplina">
			</div>
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>