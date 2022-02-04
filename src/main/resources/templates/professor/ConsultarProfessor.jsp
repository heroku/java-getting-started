<%@page import="Dao.dashboardDao"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.List" %>
<%@page import="Model.Curso"%>
<%@page import="Model.Turma"%>
<%@page import="Model.Professor"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
	<title>Consultar Professor</title>
	<link rel="shortcut icon" href="../img/2.png">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/styles1.css">
    <link rel="stylesheet" href="../css/style-login.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" type="text/css" href="../styles/consultar/styles-consultar-aluno.css">
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
          <a href="../Consultar.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultas</span>
          </a>
        </li>
        <li>
          <a href="../Dashboard.jsp">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="../aluno/ConsultarAluno.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Aluno</span>
          </a>
        </li>
        <li>
          <a href="../curso/ConsultarCurso.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Curso</span>
          </a>
        </li>
        <li>
          <a href="../turma/ConsultarTurma.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Turma</span>
          </a>
        </li>
        <li>
          <a href="../professor/ConsultarProfessor.jsp" class="active">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Professor</span>
          </a>
        </li>
        <li>
          <a href="../semestre/ConsultarSemestre.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Semestre</span>
          </a>
        </li>
        <li>
          <a href="../disciplina/ConsultarDisciplina.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar Disciplina</span>
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
        <span class="dashboard">Consultar Professor</span>
      </div>
    </nav>
    <div class="home-content">
      <div class="overview-boxes">
      <div>
		<form action="../ConsultarProfessor" method="post" class="consultarcurso">
			<div>
				<h2>Consultar Professor</h2>
			</div>
			<div>
				<label><strong>CPF:</strong></label><input type="text"
					name="cpf" min="0" minlength="9" maxlength="14" required="required">
			</div>
			<br>
			<div>
				<input id="Button" type="submit" name="salvar"
					value="Consultar Professor">
			</div>
		</form>
		<form action="../ConsultarProfessor" method="post">
			<div>
			<%
			if(request.getAttribute("professors") != null){
				List<?> professors = (List<?>) request.getAttribute("professors");
				for(int c=0; c<(professors.size()); c++){
					Professor professor = (Professor) professors.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + professor.getNome()); %></span>
					<input id="Button" type="submit" name="salvar"
						value="Alterar">
					<input id="Button" type="submit" name="salvar"
						value="Apagar">
				</div>
			</div>
			<%
			}
			}
			%>
			</div>
		</form>
      </div>
      </div>
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