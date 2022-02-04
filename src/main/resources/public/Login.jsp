<%@page import="com.sun.nio.sctp.MessageInfo"%>
<%@page import="Model.Funcionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="shortcut icon" href="img/2.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style-login.css">
</head>
<body>

	<%
	String user= (String) session.getAttribute("usuario");
	String aluno = (String) session.getAttribute("aluno");
	String professor= (String) session.getAttribute("professor");
	if(user != null){
		response.sendRedirect("Dashboard.jsp");
	}
	if(professor != null){
		response.sendRedirect("professor/DashboardProfessor.jsp");
	}
	if(aluno != null){
		response.sendRedirect("aluno/DashboardAluno.jsp");
	}
	%>
	<main>
		<form method="post">
		<div class="main-login">
			<div class="left-login">
				<h1>SysSchool</h1>
				<img alt="sysschool" src="img/sysSchool.svg" class="left-image-login">
			</div>
			<div class="right-login">
				<div class="card-login">
					<h1>LOGIN</h1>
					<div class="textfield">
						<label for="email">E-mail</label>
		            	<input type="email" name="email" placeholder="E-mail" autofocus required>
					</div>
					<div class="textfield">
						<label for="senha">Senha</label>
		            	<input type="password" name="senha" placeholder="Senha" required>
					</div>
					<input class="btn-login" id="login-Button" type="submit" name="salvar" value="Entrar">
				</div>
			</div>	
		</div>
	</form>
		<%
			String usuario = request.getParameter("email");
			String senha = request.getParameter("senha");
			Funcionario funcionario = new Funcionario(usuario, senha);
			//funcionario.CriptografarSenha(senha);
			int validar = funcionario.validarFuncionario();
			if( validar == 1){
				session.setAttribute("admin", usuario);
				session.setAttribute("usuario", usuario);
				response.sendRedirect("Dashboard.jsp");
			}else if( validar == 2){
				session.setAttribute("funcionario", usuario);
				response.sendRedirect("Dashboard.jsp");
			}else if( validar == 3){
				session.setAttribute("professor", usuario);
				response.sendRedirect("Dashboard.jsp");
			}else if( validar == 4){
				session.setAttribute("aluno", usuario);
				response.sendRedirect("aluno/DashboardAluno.jsp");
			}
		
		%>
	
	</main>
</body>
	<footer>
		<p>© Sistema desenvolvido por 
			<a href="https://github.com/icaro2222" target="_blank">
				<i class="fab fa-github"></i> Ícaro Dias</a>
		</p>
	</footer>
</html>