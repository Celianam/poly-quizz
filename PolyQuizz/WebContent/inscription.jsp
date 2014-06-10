<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
    <!-- On ouvre la fenêtre �  la largeur de l'écran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Intégration du CSS Bootstrap -->
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- Intégration du CSS responsive Bootstrap -->
    <link href="Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
      <jsp:include page="menu.jsp" />
      
      <!-- Formulaire d'inscription -->
      <h2>Cr�ation de votre compte joueur</h2><br/>
      <div class="form-horizontal" role="form">
      	<div class="form-group">
		   <label for="pseudo" class="col-sm-2 control-label">Pseudo : </label>
		   <div class="col-sm-10">
		      <input type="text" class="form-control" id="pseudo" 
		         placeholder="Entrer votre pseudo">
		   </div>
		</div>
		<div class="form-group">
		   <label for="password" class="col-sm-2 control-label">Mot de passe : </label>
		   <div class="col-sm-10">
		      <input type="text" class="form-control" id="password" 
		         placeholder="Saississez votre mot de passe">
		   </div>
		</div>
		<div class="form-group">
		   <label for="passwordConf" class="col-sm-2 control-label">Confirmation : </label>
		   <div class="col-sm-10">
		      <input type="text" class="form-control" id="passwordConf" 
		         placeholder="Retaper votre mot de passe">
		   </div>
		</div>
		<div class="form-group">
		   <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Cr�er</button>
		   </div>
		</div>
	</div>
     
    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>