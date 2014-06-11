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
    <link href="../../Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

    <!-- Intégration du CSS responsive Bootstrap -->
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
		<h1>Hello, world!</h1>
  		<p>...</p>
  		<p><a class="btn btn-primary btn-lg">Learn more</a></p>
	</div>


	 <!-- Liste des joueurs -->
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Inviter un joueur</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
			<table class="table table-striped">  
        <thead>  
          <tr>  
            <th><center>Joueur</center></th>  
            <th><center>Action</center></th>  
            <th><center>D�j� rencontr�</center></th>  
            <th><center>Victoire / D�faite</center></th>  
          </tr>  
        </thead>  
        <tbody>  
          <tr>  
            <td><center>Aur�lien</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">Inviter</button>
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge">3</span> <span class="badge">1</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Giovanny</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">Inviter</button>
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-remove"></span></center></td>  
            <td><center><span class="badge">2</span> <span class="badge">0</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Francine</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">Inviter</button>
				</div>
            </center></td>   
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge">4</span> <span class="badge">1</span></center></td>  
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