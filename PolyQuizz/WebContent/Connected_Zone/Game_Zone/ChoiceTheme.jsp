<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modele.*"%>
<%@page import="hibernate.HibernateUtil"%>
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
	 	<jsp:include page="menu.jsp" />
	 </div>
	 
	<!-- Question -->
	<div class="jumbotron">
		<h2>Choix du th�me</h2>
  		<p>Choisissez un th�me pour votre prochain round</p>
	</div>
	<%  // Ce if n'est jamais cens� arriv� :
		if (session.getAttribute("idPartieEnCours") == null) {
 			response.sendRedirect("../index.jsp");
			return; 
		}else
		{
			// Je recupere la partie en cours
			Partie p = PartieRepository.find(Integer.parseInt(session.getAttribute("idPartieEnCours").toString()));//Recoit l'id de la partie
			String themeChoisi = null;
			boolean _estChoisi = false;
		
			if(request.getParameter("Cinema")!=null)
			{
				themeChoisi = "Cinema";
				_estChoisi = true;
			}
			if(request.getParameter("Histoire")!=null)
			{
				themeChoisi = "Histoire";
				_estChoisi = true;
			}
			if(request.getParameter("Musique")!=null)
			{
				themeChoisi = "Musique";
				_estChoisi = true;
			}
			if(request.getParameter("JVideo")!=null)
			{
				themeChoisi = "JVideo";
				_estChoisi = true;
			}
			if(request.getParameter("Technologie")!=null)
			{
				themeChoisi = "Technologie";
				_estChoisi = true;
			}
			if(request.getParameter("Litterature")!=null)
			{
				themeChoisi = "Litterature";
				_estChoisi = true;
			}
			// Si un th�me � �t� choisi, on affecte au round courant 3 questions et on redirige vers la page des questions
			if(_estChoisi = true)
			{
				Theme t = ThemeRepository.find(themeChoisi);
				//ThemeRepository.save(t);
				boolean testquestion = QuestionRepository.random3Questions(t, p.getRoundCourant());
				if(testquestion==true)
				{
					response.sendRedirect("roundplay.jsp");
					return;
				}
			}
		}
	%>

	 <!-- R�ponses -->
	 <form role="form" action="ChoiceTheme.jsp" method="post">
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Sur quel th�me allez-vous vous affronter ?</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
			<table class="table table-striped">  
        <tbody>  
          <tr>  
	       <td><center><input type="submit" value="" name="Cinema" style="BACKGROUND-IMAGE: url(../../img/Cinema_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
            <td><center><input type="submit" value="" name="Histoire" style="BACKGROUND-IMAGE: url(../../img/Histoire_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
            <td><center><input type="submit" value="" name="Litterature" style="BACKGROUND-IMAGE: url(../../img/Litterature_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
          </tr>
          <tr>  
	       <td><center><input type="submit" value="" name="Musique" style="BACKGROUND-IMAGE: url(../../img/Musique_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
            <td><center><input type="submit" value="" name="Technologie" style="BACKGROUND-IMAGE: url(../../img/Technologie_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
            <td><center><input type="submit" value="" name="JVideo" style="BACKGROUND-IMAGE: url(../../img/jvideo_icone.png) ; HEIGHT: 200px; WIDTH: 200px"/></center></td>
          </tr>
        </tbody>  
      </table>
	 </div>
	 </div>
	</div>
	</form>



    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>