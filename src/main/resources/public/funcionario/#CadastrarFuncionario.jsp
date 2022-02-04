
<%@page import="br.servlets.funcionario.cadastrarFuncionarioController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar Funcionário</title>
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
		<form action="../CadastrarFuncionario" name="funcionario" method="post" class="cadastrarFuncionarioForm">
			<h2>Cadastrar Funcionário</h2>
			<br>
			<div>
				<label><strong>Nome:</strong></label><input type="text"
					name="nomefuncionario"  required maxlength="40">
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
				<label><strong>Email:</strong></label><input type="email"
					name="email"  required maxlength="40">
			</div>
			
	        <h2>Configurar Senha</h2>
			<br>
			<div>
	        	<input type="password" name="senha" placeholder="Senha" id="password" minlength="8" required>
	        	<input type="password" name="senha2" placeholder="Confirme Senha"  minlength="8" id="confirm_password" required>
	        </div>
			<br>
			<div>
			<input onclick="validarFuncionario()" id="bananaButton" type="submit" name="salvar"
				value="Cadastrar Funcionário">
		</form>
	</main>
	
<script src="../css/script.js"></script>
</body>
</html>