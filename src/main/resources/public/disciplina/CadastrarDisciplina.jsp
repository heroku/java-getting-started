<%@page import="Model.Professor"%>
<%@page import="Model.Disciplina"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="br.servlets.disciplina.cadastrarDisciplinaController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
	<title>Cadastrar Disciplina</title>
	<link rel="shortcut icon" href="../img/2.png">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/styles1.css">
    <link rel="stylesheet" href="../css/style-login.css">
    <link rel="stylesheet" href="../styles/cadastrar/styles-cadastrar-disciplina.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" type="text/javascript"></script>
   </head>
<body>
	<%
	String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("Login.jsp");
		}
	%>
	

  <div class="sidebar">
    <div class="logo-details">
      <i><img src="../img/2.png"height="30px"></i>
      <span class="logo_name">SysSchool</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="../Cadastrar.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastros</span>
          </a>
        </li>
        <li>
          <a href="../Dashboard.jsp">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="../matricula/CadastrarMatriculaAluno.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Aluno</span>
          </a>
        </li>
        <li>
          <a href="../curso/CadastrarCurso.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Curso</span>
          </a>
        </li>
        <li>
          <a href="../turma/CadastrarTurma.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Turma</span>
          </a>
        </li>
        <li>
          <a href="../professor/CadastrarProfessor.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Professor</span>
          </a>
        </li>
        <li>
          <a href="../semestre/CadastrarSemestre.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Semestre</span>
          </a>
        </li>
        <li>
          <a href="../disciplina/CadastrarDisciplina.jsp" class="active">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Disciplina</span>
          </a>
        </li>
        <li>
          <a href="../nota/CadastrarNota.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Nota</span>
          </a>
        </li>
        <li>
          <a href="../matriculaDisciplina/CadastrarMatriculaDisciplina.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Matrícular Aluno</span>
          </a>
        </li>
        <li>
          <a href="../funcionario/CadastrarFuncionario.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar Funcionário</span>
          </a>
        </li>
        <li class="log_out">
          <a href="../Deslogar.jsp">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Cadastrar Disciplina</span>
      </div>
    </nav>

    <div class="home-content">
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
    </div>
  </section>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>


<!--===============================================================================================-->	
	<script src="../lo/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="../lo/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<script src="../css/script.js"></script>
</body>
</html>