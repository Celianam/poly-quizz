<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "controle.FormValidation"%>
 
<%@ page import="java.io.IOException"%>

<% 
/*  // Récupération des champs du formulaire. 
String pseudo = request.getParameter("InputPseudo");
String motDePasse = request.getParameter("InputPassword");
String confirmation = request.getParameter("InputPasswordConf");


String excepPseudo = "";
String excepMDP = "";

boolean pseudoOK = false;
boolean mdpOK = false;


// Validation du champ pseudo. 
if(pseudo != null && pseudo != "") {
	try {
		FormValidation.validationPseudo(pseudo);
		pseudoOK = true;
		System.out.println("ok");
	}
	catch (Exception e) {
		excepPseudo = e.getMessage();
	}
}
if(motDePasse != null && motDePasse != "" && confirmation != null && confirmation != "") {
	try {
		FormValidation.validationPassword(motDePasse,confirmation);
		mdpOK = true;
	}
	catch (Exception e) {
		excepMDP = e.getMessage();
	}
	System.out.println("Succès de l'inscription");
	
	try{
		FormValidation.ajoutNouvelUtilisateur(pseudo,motDePasse);
	} catch (Exception e) {
		excepPseudo = e.getMessage();
	}
} */

%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
    <!-- On ouvre la fenetre a  la largeur de l'ecran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- IntÃ©gration du CSS Bootstrap -->
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- IntÃ©gration du CSS responsive Bootstrap -->
    <link href="Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
      <jsp:include page="menu.jsp" />
      
      <!-- Formulaire d'inscription -->
      <form role="form" action="inscription" method="post">
      <h2>Création de votre compte joueur</h2><br/>
	      <div class="form-horizontal" role="form">
	      	<div class="form-group">
			   <label for="InputPseudo" class="col-sm-2 control-label">Pseudo : </label>
			   <div class="col-sm-10">
			      <input type="text" class="form-control" name="InputPseudo"
			         placeholder="Entrer votre pseudo" >
			      <span class="erreur" style="color:red">${erreurs['InputPseudo']}</span>
			   </div>
			</div>
			<div class="form-group">
			   <label for="InputPassword" class="col-sm-2 control-label">Mot de passe : </label>
			   <div class="col-sm-10">
			      <input type="password" class="form-control" name="InputPassword"
			         placeholder="Saississez votre mot de passe">
			      <span class="erreur" style="color:red" >${erreurs['InputPassword']}</span>
			   </div>
			</div>
			<div class="form-group">
			   <label for="InputPasswordConf" class="col-sm-2 control-label">Confirmation : </label>
			   <div class="col-sm-10">
			      <input type="password" class="form-control" name="InputPasswordConf" 
			         placeholder="Retaper votre mot de passe">
			      <span class="erreur" style="color:red"></span>
			   </div>
			</div>
		<div class="form-group">
		   <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Créer</button>
		   </div>
		</div>
	</div>
    </div>
    </form>
    
    <!-- IntÃ©gration de la libraire jQuery -->
    <script src="Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- IntÃ©gration de la libraire de composants du Bootstrap -->
    <script src="Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>