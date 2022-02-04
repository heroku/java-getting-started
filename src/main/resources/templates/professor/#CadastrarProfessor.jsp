
<%@page import="br.servlets.curso.consultarCursoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Professor</title>
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
		<form action="../CadastrarProfessor" name="professor" method="post" class="alterarAlunoForm">
			<h2>Cadastrar Professor</h2>
			<br>
			<br>
			<div>
				<label><strong>Nome:</strong></label><input type="text"
					name="nomeprofessor"  required maxlength="40">
			</div>
			<div>
				<label><strong>Cpf:</strong></label>
				<input type="text" name="cpf" placeholder="Cpf" required></input>
			</div>
			<div>
				<label><strong>dataNascimento:</strong></label>
				<input type="date" name="datanascimento" placeholder="dataNascimento" required></input>
			</div>
			<div>
				<label><strong>estado:</strong></label>
				<input type="text" name="estado" placeholder="estado" required></input>
			</div>
			<div>
				<label><strong>cidade:</strong></label>
				<input type="text" name="cidade" placeholder="cidade" required></input>
			</div>
			<div>
				<label><strong>estadoCivil:</strong></label>
				<input type="text" name="estadocivil" placeholder="estadoCivil" required></input>
			</div>
			<br>
			<div>
				<input onclick="validarProfessor()" id="bananaButton" type="submit" name="salvar"
					value="Cadastrar Professor">
			</div>
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>