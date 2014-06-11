<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= session.getAttribute("joueur") %> - Changement de mot de passe</title>
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
		 	<span>Vous n'avez plus confiance en votre mot de passe ? Changez-le ici !</span><br/><br/>
		 </div>
		 <div class="row-fluid">
 			<form role="form">
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="actualpswd">Mot de passe actuel</label>
                       <input class="form-control" type="password" name="actualpswd" placeholder="Mot de passe actuel">
                   </div>
               </div>
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="newpassword">Nouveau mot de passe</label>
                       <input class="form-control" type="password" name="newpassword" placeholder="Entrer le nouveau mot de passe">
                   </div>
               </div>
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="passwordConf">Confirmation</label>
                       <input class="form-control" type="password" name="passwordConf" placeholder="Confirmation du nouveau mot de passe">
                   </div>
               </div>
               <br>
               <div class="row-fluid">
                   <div class="form-group col-xs-12">
                       <!-- <button type="submit" class="btn btn-lg btn-success">Changer</button> -->
                       <button type="submit" class="btn">Changer</button>
                   </div>
               </div>
           </form>
		</div>
    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>