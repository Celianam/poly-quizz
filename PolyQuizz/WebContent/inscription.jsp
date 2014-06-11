<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "hibernate.Inscription"
 %>

<%
String resultat = null;
/* Récupération des champs du formulaire. */
String pseudo = request.getParameter("pseudo");
String motDePasse = request.getParameter("password");
String confirmation = request.getParameter("passwordConf");

int nbErreurs = 0;

/* Validation du champ pseudo. */
try {
	Inscription.validationPseudo( pseudo );
} catch ( Exception e ) {
	//erreurs.put( pseudo, e.getMessage() );
}

/* Validation des champs mot de passe et confirmation. */
try {
	Inscription.validationPassword( motDePasse, confirmation );
} catch ( Exception e ) {
	erreurs.put( motDePasse, e.getMessage() );
}

if (erreurs.isEmpty())
{
	resultat = "Succès de l'inscription";
	Inscription.ajoutNouvelUtilisateur(pseudo,motDePasse);
}
else 
{
	resultat = "Echec de l'inscription";
	System.out.println("Echec de l'inscription");
}
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
      <form action="inscription" method="post" enctype="multipart/form-data">
      <h2>Création de votre compte joueur</h2><br/>
	      <div class="form-horizontal" role="form">
	      	<div class="form-group">
			   <label for="pseudo" class="col-sm-2 control-label">Pseudo : </label>
			   <div class="col-sm-10">
			      <input type="text" class="form-control" id="pseudo" 
			         placeholder="Entrer votre pseudo">
			      <span class="erreur">${erreurs['pseudo']}</span>
			   </div>
			</div>
			<div class="form-group">
			   <label for="password" class="col-sm-2 control-label">Mot de passe : </label>
			   <div class="col-sm-10">
			      <input type="text" class="form-control" id="password" 
			         placeholder="Saississez votre mot de passe">
			      <span class="erreur">${erreurs['password']}</span>
			   </div>
			</div>
			<div class="form-group">
			   <label for="passwordConf" class="col-sm-2 control-label">Confirmation : </label>
			   <div class="col-sm-10">
			      <input type="text" class="form-control" id="passwordConf" 
			         placeholder="Retaper votre mot de passe">
			      <span class="erreur">${erreurs['passwordConf']}</span>
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