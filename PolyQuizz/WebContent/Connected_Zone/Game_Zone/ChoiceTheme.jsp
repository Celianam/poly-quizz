<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%= session.getAttribute("joueur") %></title>
    <!-- On ouvre la fenÃªtre Ã  la largeur de l'Ã©cran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- IntÃ©gration du CSS Bootstrap -->
    <link href="../../Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

    <!-- IntÃ©gration du CSS responsive Bootstrap -->
    <link href="../../Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
     <div>
	 	<jsp:include page="../menu.jsp" />
	 </div>
	 
	<!-- Question -->
	<div class="jumbotron">
		<h2>Choix du thème</h2>
  		<p>Choisissez un thème pour votre prochain round</p>
	</div>


	 <!-- Réponses -->
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Sur quel thème allez-vous vous affronter ?</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
			<table class="table table-striped">  
        <tbody>  
          <tr>  
	       <td><center><img src="../../img/Cinema_icone.png"/></center></td>
            <td><center><img src="../../img/Histoire_icone.png"/></center></td>
            <td><center><img src="../../img/Litterature_icone.png"/></center></td>
          </tr>
          <tr>  
	       <td><center><img src="../../img/Musique_icone.png"/></center></td>
            <td><center><img src="../../img/Technologie_icone.png"/></center></td>
            <td><center><img src="../../img/jvideo_icone.png"/></center></td>
          </tr>
        </tbody>  
      </table>
			</div>
	  </div>
	</div>



    </div>
    
    <!-- IntÃ©gration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- IntÃ©gration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>