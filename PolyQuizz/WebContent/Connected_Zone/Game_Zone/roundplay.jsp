<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="modele.*"%>
<%@page import="hibernate.HibernateUtil"%>	
<%@page import="java.util.Iterator"%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%= session.getAttribute("joueur") %></title>
<!-- On ouvre la fenêtre �  la largeur de l'écran -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Intégration du CSS Bootstrap -->
<link href="../../Bootstrap/css/bootstrap.css" rel="stylesheet"
	media="screen">

<!-- Intégration du CSS responsive Bootstrap -->
<link href="../../Bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">
</head>

<%!
	int cpt = 1;
	int nbTotal = 3;
	int score  = 0;
	String color = "black";
%>

<body>
	<!-- Conteneur principal -->
	<div class="container">

		<!-- Barre de navigation -->
		<div>
			<jsp:include page="menu.jsp" />
		</div>
		<br /> <br />

		<%
		int idJoueur = ((Joueur) session.getAttribute("joueur")).getId();
		Joueur joueurCourant = JoueurRepository.find(idJoueur);
		
		int id = ((Round) session.getAttribute("round")).getId();
		Round roundCourant = RoundRepository.find(id);
		java.util.Set<Question> listeQuestions = roundCourant.getQuestions();
		%>
		<!-- Question -->
		<div class="jumbotron">
			<h2>Question <%=cpt%></h2>
			<%
			Question q;
			Object elem = new Object();
			int j;
			Iterator i;
			for(i=listeQuestions.iterator(), j=0; i.hasNext() && j<cpt; elem=i.next(),j++)
			{
			   elem=i.next();
			}
			q = (Question)elem;
			%>
			<p><%=q.getQuestion() %> </p>
			<p><%=cpt%>/<%=nbTotal %></p>
			<span style="color:<%="color"%>"><%= score%></span>
		</div>


		<%
		String rA = q.getReponseA();
		String rB = q.getReponseB();
		String rC = q.getReponseC();
		String rD = q.getReponseD();
		String bonneRep = q.getBonneReponse();
		
		if(session.getAttribute("A") != null)
		{
			if(rA.equals(bonneRep))
			{
				color = "green";
				score++;
			}
			else{
				color = "red";
			}
		}
		if(session.getAttribute("B") != null)
		{
			if(rB.equals(bonneRep))
			{
				color = "green";
				score++;
			}
			else{
				color = "red";
			}
		}
		if(session.getAttribute("C") != null)
		{
			if(rC.equals(bonneRep))
			{
				color = "green";
				score++;
			}
			else{
				color = "red";
			}
		}
		if(session.getAttribute("D") != null)
		{
			if(rD.equals(bonneRep))
			{
				color = "green";
				score++;
			}
			else {
				color = "red";
			}
		}
		%>
		<!-- R�ponses -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>R�ponses</strong>
				</h3>
			</div>
			<div class="panel-body">
				<div class="row-fluid">
				<form role="form" action="roundplay.jsp" method="post">
					<table class="table table-striped">
						<tbody>
							<td><center>
									<div class="btn-group">
										<button type="submit" class="btn btn-default" name="A"><%=rA%></button>

									</div>
								</center></td>
							<td><center>
									<div class="btn-group">
										<button type="submit" class="btn btn-default" name="B"><%=rB%></button>
									</div>
								</center></td>
							<td><center>
									<div class="btn-group">
										<button type="submit" class="btn btn-default" name="C"><%=rC%></button>
									</div>
								</center></td>
							<td><center>
									<div class="btn-group">
										<button type="submit" class="btn btn-default" name="D"><%=rD%></button>
									</div>
								</center></td>
							</tr>
						</tbody>
					</table>
					</form>
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