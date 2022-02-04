
<%@page import="java.util.List" %>
<%@page import="Model.Curso"%>
<%@page import="Model.Semestre"%>
<%@page import="Model.Turma"%>
<%@page import="Model.Professor"%>
<%@page import="Model.Aluno"%>
<%@page import="Model.Matricula"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="br.servlets.cadastro.cadastrarMatriculaAlunoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Aluno</title>
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
		<form action="../CadastrarMatriculaAluno" name="matricula" method="post"  class="cadastrarAlunoForm">
			<div>
				<h2>Dados do aluno</h2><br>
			</div>
			<div>
				<label><strong>Nome:</strong></label>
				<input type="text" name="nome" placeholder="Nome" required></input>
			</div>
			<div>
				<label><strong>CPF:</strong></label>
				<input type="text" name="cpf" placeholder="Cpf" required></input>
			</div>
			<div>
				<label><strong>Data de Nascimento:</strong></label>
				<input type="date" name="datanascimento" placeholder="dataNascimento" required></input>
			</div>
			<div>
				<label><strong>Estado:</strong></label>
				<input type="text" name="estado" placeholder="estado" required></input>
			</div>
			<div>
				<label><strong>Cidade:</strong></label>
				<input type="text" name="cidade" placeholder="cidade" required></input>
			</div>
			<div>
				<label><strong>Estado Civil:</strong></label>
				<input type="text" name="estadocivil" placeholder="estadoCivil" required></input>
			</div>
			<br>
			<div>
				<h2>Dados da Matrícula</h2><br>
			</div>
			<div>
				<label><strong>Curso:</strong></label>
			<select name="cdcurso">
				<%ArrayList<?> cursos = new Curso().consultarPorId(-1);
				for(int s=0; s<(cursos.size()) && s<6; s++){
				Curso curso = (Curso) cursos.get(s); 
				%>
				<option value="<%out.print(curso.getCdcurso());%>"><%out.print(curso.getNomecurso()); %></option>
				<%} %>
			</select>
				<label><strong>Turma:</strong></label>
				<select name="cdturma">
				<%ArrayList<?> turmas = new Turma().consultarPorId(-1);
				for(int s=0; s<(turmas.size()) && s<6; s++){
				Turma turma = (Turma) turmas.get(s); 
				%>
				<option value="<%out.print(turma.getCdturma());%>"><%out.print(turma.getNometurma()); %></option>
				<%} %>
			</select > 
			</div>
			<br>
			<div>
				<input onclick="validarMatricula()" id="bananaButton" type="submit" name="salvar"
					value="Cadastrar Aluno">
			</div>
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>