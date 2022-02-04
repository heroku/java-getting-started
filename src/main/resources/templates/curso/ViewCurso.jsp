
<%@page import="Model.Aluno"%>
<%@page import="java.util.Currency"%>
<%@page import="java.util.List"%>
<%@page import="Model.Curso"%>
<%@page import="br.servlets.curso.consultarCursoController"%>
<%@page import="br.servlets.curso.alterarCursoController"%>
<%@page import="br.servlets.curso.apagarCursoController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultar Curso</title>
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
		int cdcurso = 0;
		Curso curso = new Curso();
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
		<form action="ConsultarCurso" method="post" class="consultarcurso">
			<div class="buscarnome">
				<h2>Consultar Curso</h2>
			</div>
			<br>
			<div class="buscarnome">
				<label><strong>Nome :</strong></label><input type="text"
					name="nomecurso" required="required">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar Curso">
			</div>
		</form>
		<form nome="excluirAluno">
			<div>
			<%
			if(request.getAttribute("cursos") != null){
				List<?> cursos = (List<?>) request.getAttribute("cursos");
				for(int c=0; c<(cursos.size()); c++){
					curso = (Curso) cursos.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + curso.getNomecurso()); %></span>
					<span><%out.print("Valor: " + curso.getValor()); %></span>
					<div class="submit">
						<%cdcurso = curso.getCdcurso(); %>
						<input onclick="validarAlterarAluno();" id="Balterar" name="alterar"
							value="Alterar">
						<input onclick="validarExcluirAluno();" id="Bapagar" name="apagar"
							value="Apagar">
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
			</div>
		</form>
	</main>
    <div class="modal-excluir">
		<form action="ApagarCurso" method="post" class="modalexcluir">
			<h2>Tem Certeza que deseja excluir?</h2><br>
			<div>
				<input type="hidden" name="cdcurso" value="<%out.print(curso.getCdcurso());%>">
				<input id="bananaButton" onclick="validar();" type="submit" name="sim"
					value="Sim">
			</div>
			<div>
				<input id="bananaButton" type="submit" name="nao"
					value="Não">
			</div>
		</form>
    </div>
    <div class="modal-alterar">
		<form action="AlterarCurso" method="post" class="alterarAlunoForm">
			<h2>Alterar Curso</h2><br>
			<div>
			<%
			if(request.getAttribute("cursos") != null){
				List<?> cursos = (List<?>) request.getAttribute("cursos");
				for(int c=0; c<(cursos.size()); c++){
					curso = (Curso) cursos.get(c);
					if(cdcurso == curso.getCdcurso()){
					request.setAttribute("idcurso", curso.getCdcurso());
			%>
			<div>
				<label><strong>Nome:</strong></label>
				<input type="hidden" name="idaluno" value="<%out.print(curso.getCdcurso()); %>">
				<input type="text" name="nome" placeholder="Nome" value="<%out.print(curso.getNomecurso()); %>" required></input>
			</div>
			<div>
				<label><strong>Valor:</strong></label>
				<input type="text" name="cpf" placeholder="Ex: 100,00" value="<%out.print(curso.getValor()); %>" required></input>
			</div>
			<%}}}
			%>
			</div>
			<div class="flex-row">
				<input onclick="validar();" type="submit" id="Balterar" name="alterar"
							value="Alterar">
			</div>
		</form>
    </div>
<script src="css/script.js"></script>
</body>
</html>