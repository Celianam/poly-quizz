<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%= session.getAttribute("joueur") %></title>
    <!-- On ouvre la fenêtre �  la largeur de l'écran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Intégration du CSS Bootstrap -->
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- Intégration du CSS responsive Bootstrap -->
    <link href="../Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
      <jsp:include page="menu.jsp" />
	      <!-- Barre de navigation -->
		 
		 <div class="row-fluid">
			<ul class="list-group">
			    <li class="list-group-item">Toi vs Giovanny <span class="badge">Round 2</span></li>
			    <li class="list-group-item">Toi vs Aur�lien <span class="badge">Round 0</span></li>        
			    <li class="list-group-item">Toi vs St�phanie <span class="badge">Round 0</span></li>
			    <li class="list-group-item">Toi vs Francine <span class="badge">Round 5</span></li>
			</ul>
		</div>
    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>