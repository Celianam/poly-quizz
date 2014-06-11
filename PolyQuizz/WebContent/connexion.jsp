<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="misc.FormValidation" %>
    
<% 
	String pseudo = request.getParameter("exampleInputPseudo");
	String mdp = request.getParameter("exampleInputPassword1");
	String excepPseudo = "";
	String excepMDP = "";
	boolean pseudoOK = false;
	boolean mdpOK = false;
	
	if(pseudo != null) {
		try {
			FormValidation.validationPseudo(pseudo);
			pseudoOK = true;
		}
		catch (Exception e) {
			excepPseudo = e.getMessage();
		}
	}
	if(mdp != null) {
		try {
			FormValidation.validationPassword(mdp);
			mdpOK = true;
		}
		catch (Exception e) {
			excepMDP = e.getMessage();
		}
	}
	
	// Vérifier la correspondance dans la BDD //
	//
	//
	
	
	// Si joueur reconnu, redirection page joueur
	if(pseudoOK && mdpOK) {
		session.setAttribute("joueur", pseudo);
		response.sendRedirect("/PolyQuizz/testConnexionOK.jsp");
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Connexion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="Bootstrap/js/jquery-1.11.1.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
      <jsp:include page="menu.jsp" />
      <!-- Page de Connexion : -->
<div class="col-md-4 col-md-offset-4">
    <div class="panel panel-default">
  <div class="panel-heading"><h3 class="panel-title"><strong>Connexion </strong></h3></div>
  <div class="panel-body">
   <form role="form" action="connexion.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Pseudo</label>
    <input type="text" class="form-control" style="border-radius:0px" name="exampleInputPseudo" placeholder="Entrer votre pseudo">
    &nbsp;
    <span style="color:red""><%= excepPseudo %></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" style="border-radius:0px" name="exampleInputPassword1" placeholder="Password">
    &nbsp;
    <span style="color:red"><%= excepMDP %></span>
    
  </div>
  <button type="submit" class="btn btn-sm btn-default">Sign in</button>
</form>
  </div>
</div>
</div>
</div>
 		
  </body>
</html>