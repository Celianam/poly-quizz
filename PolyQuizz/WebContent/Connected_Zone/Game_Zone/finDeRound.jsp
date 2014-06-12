<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="modele.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% Partie p = PartieRepository.find(Integer.parseInt(session.getAttribute("idPartieEnCours").toString()));
   int numRound = PartieRepository.getRoundJoueurCourant(p);
%>
<title><%= session.getAttribute("joueur") %> - R�sultat du round <%= numRound%> </title>
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
		 	<jsp:include page="menu.jsp" />
		 </div><br/><br/>
		
		
		<% 
		String text, link;
		String over = "";
		
		if (PartieRepository.getRoundJoueurCourant(p) < PartieRepository.getRoundAdversaire(p)) {
				text = "Round suivant";
				link = "ChoiceTheme.jsp";
		}
		else {
				text = "Retour � l'accueil";
				link = "../index.jsp";
		}
		
		PartieRepository.incrementerRoundJoueurCourant(p);	
		%>
		<div class="jumbotron">
			<h2>R�sultat du round <%= numRound%> : </h2>
	  		<p>Score : <%= PartieRepository.getScoreJoueurCourant(p) %>/9</p><br/>
	  		<p><%= over %></p>
		</div>
	

		<!-- Button round suivant -->
		<div class="row">
		   <div class="col-sm-offset-2 col-sm-10">
		      <a href="<%= link%>"><button class="btn btn-default"><%= text%></button></a>
		   </div>
		</div>
		
		<% 
		// Fin de partie
		if(PartieRepository.getRoundJoueurCourant(p) == PartieRepository.getRoundAdversaire(p) && PartieRepository.getRoundJoueurCourant(p) == 4)
		{
			if(PartieRepository.getScoreJoueurCourant(p) > PartieRepository.getScoreJoueurAdversaire(p))
				over = "Partie termin�e ! Vous avez gagn� !";
			else if(PartieRepository.getScoreJoueurCourant(p) < PartieRepository.getScoreJoueurAdversaire(p))
				over = "Partie termin�e ! Vous avez perdu...";
			else if(PartieRepository.getScoreJoueurCourant(p) == PartieRepository.getScoreJoueurAdversaire(p))
				over = "Partie termin�e ! Match nul !";
		}
		else
		{ // Ce n'est pas une fin de partie
			
			if(PartieRepository.getRoundJoueurCourant(p) == PartieRepository.getRoundAdversaire(p)) {
				// On cr�e un nouveau round 
				Round r = new Round();
				r.setPartie(p);
				RoundRepository.save(r);
				p.setRoundCourant(r);
			}
			else if(PartieRepository.getRoundAdversaire(p) < PartieRepository.getRoundJoueurCourant(p)) {
				// C'est au tour de l'adversaire de jouer au round
				p.setJoueurCourant(PartieRepository.getAdversaire(p));
			}	
		}
		PartieRepository.update(p);
		%>
    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>