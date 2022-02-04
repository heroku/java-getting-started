<%@page import="Dao.dashboardDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
	<title>Dashboard</title>
	<link rel="shortcut icon" href="../img/2.png">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/styles1.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" type="text/javascript"></script>
   </head>
<body>
	<%
	String usuario = (String) session.getAttribute("usuario");
	String professor= (String) session.getAttribute("professor");
		if(usuario == null && professor == null){
			response.sendRedirect("Login.jsp");
		}
		double valor[] = new dashboardDao().dados();
	%>
	

  <div class="sidebar">
    <div class="logo-details">
      <i><img src="../img/2.png"height="30px"></i>
      <span class="logo_name">SysSchool</span></a>
    </div>
      <ul class="nav-links">
        <li>
          <a href="#" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="Cadastrar.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Cadastrar</span>
          </a>
        </li>
        <li>
          <a href="Consultar.jsp">
            <i class='bx bx-search' ></i>
            <span class="links_name">Consultar</span>
          </a>
        </li>
        <li class="log_out">
          <a href="Deslogar.jsp">
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
        <span class="dashboard">Dashboard</span>
      </div>
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Alunos</div>
            <div class="number"><%out.print(valor[1]); %></div>
            <div class="indicator">
              <span class="text">Quantidade de Alunos</span>
            </div>
          </div>
          <i class='bx bx-book-reader cart'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Professores</div>
            <div class="number"><%out.print(valor[2]); %></div>
            <div class="indicator">
              <span class="text">Quantidade de Professores</span>
            </div>
          </div>
          <i class='bx bxs-user-detail cart two' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Média Escolar</div>
            <div class="number"><%out.print(valor[0]); %></div>
            <div class="indicator">
              <span class="text">Média de todos Alunos</span>
            </div>
          </div>
          <i class='bx bx-bar-chart-alt-2 cart three' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Disciplinas</div>
            <div class="number"><%out.print(valor[3]); %></div>
            <div class="indicator">
              <span class="text">Quantidades de Disciplinas</span>
            </div>
          </div>
          <i class='bx bxs-book-alt cart' ></i>
        </div>
	<canvas id="myChart" width="0.1vw" height="0.1vh"></canvas>
      </div>
    </div>
    <%
    	
    
    %>
<script>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['', '', '', '', '', '', '', '', '', '', ''],
        datasets: [{
            label: 'Fluxo da média dos alunos',
            data: [
            <%for(int cont=13;cont>=4;cont--){
            	if(valor[cont] < 0){
            		out.print(0+",");
            	}else{
            		out.print(valor[cont]+",");}}%>
            ],
            backgroundColor: ['rgba(54, 162, 235, 0.2)'],
            borderColor: ['rgba(54, 162, 235, 1)'],
            borderWidth: 10 
            }]},
    options: {
    }
});
</script>
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

</body>
	<footer>
		<p>© Sistema desenvolvido por 
			<a href="https://github.com/icaro2222" target="_blank">
				<i class="fab fa-github"></i> Ícaro Dias</a>
		</p>
	</footer>
</body>
</html>