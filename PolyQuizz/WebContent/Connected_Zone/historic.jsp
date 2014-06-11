<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= session.getAttribute("joueur") %> - Votre historique</title>
    <!-- On ouvre la fenêtre �  la largeur de l'écran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Intégration du CSS Bootstrap -->
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

    <!-- Intégration du CSS responsive Bootstrap -->
    <link href="../Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<!-- Conteneur principal -->
  <div class="container">
      
      <!-- Barre de navigation -->
      <div>
	 <jsp:include page="menu.jsp" />
	       <div class="row-fluid">
      <img class="imgAutoSize" src="../img/banniere_sous_menu.png"/>
      </br>
      </div>
	 </div>
	 <div class="row">
	 	<h2>Historique de vos parties</h2>
	 	<span>Besoin de v�rifier que vous �tes bien le BOSS de DuelQuizz ?</span>
	 	<span>Dans cette page, vous pouvez retrouver le r�sultat de vos derni�res parties.</span>
	 </div><br/><br/>
	 <!-- Liste invitations recues -->
	 <div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Derni�res partie jou�es</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
				<table class="table table-striped">  
			        <thead>  
			          <tr>  
			            <th><center>Adversaire</center></th>  
			            <th><center>Score</center></th>
			          </tr>
			        </thead>  
			        <tbody>  
			          <tr>  
			            <td><center>Aur�lien</center></td> 
			            <td><center><span class="badge-vert">9</span> <span> / </span> <span class="badge">7</span></center></td>
			            <td><center><span class="glyphicon glyphicon-ok"> Victoire</span></center></td>
			          </tr>  
			          <tr>  
			            <td><center>Giovanny</center></td> 
			            <td><center><span class="badge-rouge">0</span> <span> / </span> <span class="badge">15</span></center></td>
			            <td><center><span class="glyphicon glyphicon-remove"> D�faite</span></center></td>
			          </tr>   
			          <tr>  
			            <td><center>Francine</center></td> 
			            <td><center><span class="badge-vert">13</span> <span> / </span> <span class="badge">12</span></center></td>
			            <td><center><span class="glyphicon glyphicon-ok"> Victoire</span></center></td>
			          </tr>    
			        </tbody>  
      			</table>
			</div>
	  	</div>
	</div>
  </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>