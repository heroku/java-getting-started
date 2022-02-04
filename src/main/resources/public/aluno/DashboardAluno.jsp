<%@page import="Dao.dashboardDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/styles1.css">
    <link rel="stylesheet" href="../css/style-login.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" type="text/javascript"></script>
   </head>
<body>
	<%
	String aluno = (String) session.getAttribute("aluno");
		if(aluno == null){
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
      <div class="login100-pic js-tilt" data-tilt>
      	<img src="../img/bemvindo-15.gif"  alt="IMG">
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

	<footer>
		<p>© Sistema desenvolvido por 
			<a href="https://github.com/icaro2222" target="_blank">
				<i class="fab fa-github"></i> Ícaro Dias</a>
		</p>
	</footer>
<!--===============================================================================================-->	
	<script src="../lo/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="../lo/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
</body>
</html>