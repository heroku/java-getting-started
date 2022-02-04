
<%@page import="Dao.alunoDao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>
<%@page import="br.servlets.consultarAlunoController"%>
<%@page import="br.servlets.alterarAlunoController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultar Aluno</title>
	<link rel="shortcut icon" href="img/2.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<%
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("Login.jsp");
		}
		Aluno aluno = new Aluno();
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
		<form class="modal">
			<img src="img/sucess3.gif" alt="sucesso">
		</form>
		<form action="ConsultarAluno" method="post" class="consultarcurso">
			<div>
				<h2>Consulta Aluno</h2>
			</div>
			<br>
			<div class="buscarnome">
				<label><strong>CPF :</strong></label><input type="text"  minlength="11" spacehoder="cpf" 
					name="cpf"  min="0" maxlength="14" required="required">
			</div>
			<br>
			<div>
				<input id="Button" type="submit" name="salvar"
					value="Consultar Aluno">
			</div>
		</form>
		<form nome="excluirAluno">
			<div>
			<%
			if(request.getAttribute("alunos") != null){
				List<?> alunos = (List<?>) request.getAttribute("alunos");
				for(int c=0; c<(alunos.size()); c++){
					aluno = (Aluno) alunos.get(c);
					request.setAttribute("idaluno", aluno.getCdaluno());
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + aluno.getNome()); %></span>
					<span><%out.print("Número de Matricula: " + aluno.getNmatricula()); %></span>
					<span><%out.print("Status: " + aluno.getStatus()); %></span>
					<div class="submit">
						<input onclick="validarAlterarAluno();" id="Balterar" name="alterar"
							value="Alterar">
						<input onclick="validarExcluirAluno();" id="Bapagar" name="apagar"
							value="Apagar">
					</div>
				</div>
			</div>
			<%}}else {%>
			<div>
				<div class="fo">
					<span><%out.print("CPF Inválido, Por favor verifique o CPF e tente novamente.");%></span>
				</div>
			</div>
			<%} %>
			</div>
		</form>
	</main>
    <div class="modal-excluir">
		<form action="ApagarAluno" method="post" class="modalexcluir">
			<h2>Tem Certeza que deseja excluir?</h2><br>
			<div>
				<input type="hidden" name="idaluno" value="<%out.print(aluno.getCdaluno()); %>">
				<input id="Button" onclick="validar();" type="submit" name="sim"
					value="Sim">
			</div>
			<div>
				<input id="Button" type="submit" name="nao"
					value="Não">
			</div>
		</form>
    </div>
    <div class="modal-alterar">
		<form action="AlterarAluno" method="post" class="matAlunoForm">
			<h2>Alterar Aluno</h2><br>
			<div>
			<%
			if(request.getAttribute("alunos") != null){
				List<?> alunos = (List<?>) request.getAttribute("alunos");
				for(int c=0; c<(alunos.size()); c++){
					aluno = (Aluno) alunos.get(c);
					request.setAttribute("idaluno", aluno.getCdaluno());
			%>
			<div>
				<label><strong>Nome:</strong></label>
				<input type="hidden" name="idaluno" value="<%out.print(aluno.getCdaluno()); %>">
				<input type="text" name="nome" placeholder="Nome" value="<%out.print(aluno.getNome()); %>" required></input>
			</div>
			<div>
				<label><strong>Cpf:</strong></label>
				<input type="text" name="cpf" placeholder="Cpf"  min="0" minlength="9" maxlength="14"value="<%out.print(aluno.getCpf()); %>" required></input>
			</div>
			<div>
				<label><strong>dataNascimento:</strong></label>
				<input type="date" name="datanascimento" placeholder="dataNascimento" value="<%out.print(aluno.getDataNascimento()); %>" required></input>
			</div>
			<div>
				<label><strong>estado:</strong></label>
				<input type="text" name="estado" placeholder="estado" value="<%out.print(aluno.getEstado()); %>" required></input>
			</div>
			<div>
				<label><strong>cidade:</strong></label>
				<input type="text" name="cidade" placeholder="cidade" value="<%out.print(aluno.getCidade()); %>" required></input>
			</div>
			<div>
				<label><strong>estadoCivil:</strong></label>
				<input type="text" name="estadocivil" placeholder="estadoCivil" value="<%out.print(aluno.getEstadoCivil()); %>" required></input>
			</div>
			<%}}
			%>
			</div>
			<div class="flex-row">
				<input onclick="validarMatricula();" type="submit" id="Balterar" name="alterar"
							value="Alterar">
			</div>
		</form>
    </div>
<script src="css/script.js"></script>
</body>
</html>