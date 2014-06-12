<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="modele.*"%>
<%@page import="hibernate.HibernateUtil"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%=session.getAttribute("joueur")%></title>
<!-- On ouvre la fenêtre �  la largeur de l'écran -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Intégration du CSS Bootstrap -->
<link href="../../Bootstrap/css/bootstrap.css" rel="stylesheet"
	media="screen">

<!-- Intégration du CSS responsive Bootstrap -->
<link href="../../Bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">
</head>

<%
	if (session.getAttribute("joueur") == null) {
		response.sendRedirect("/PolyQuizz/index.jsp");
		return;
	}
	int idJoueur = ((Joueur) session.getAttribute("joueur")).getId();
	Joueur joueurCourant = JoueurRepository.find(idJoueur);

	Partie partieCourante = PartieRepository.find(Integer
			.parseInt(session.getAttribute("idPartieEnCours")
					.toString()));//Recoit l'id de la partie
	//System.out.println("Partie : " + partieCourante.getId());
	Round roundCourant = partieCourante.getRoundCourant();
	//System.out.println("Round : "+roundCourant.getId());
	java.util.Set<Question> listeQuestions = roundCourant
			.getQuestions();
%>

<%
	boolean bonneReponse = false;
	int cpt = 1;
	int nbTotal = listeQuestions.size();
	if (request.getParameter("cpt") != null) {
		cpt = Integer.parseInt(request.getParameter("cpt").toString()) + 1;
	}

	String color = "black";
	int score = PartieRepository.getScoreJoueurCourant(partieCourante);
%>

<body>
	<!-- Conteneur principal -->
	<div class="container">

		<!-- Barre de navigation -->
		<div>
			<jsp:include page="menu.jsp" />
		</div>
		<br /> <br />

		<!-- Question -->
		<div class="jumbotron">
			<h2>
				Question
				<%=cpt%></h2>
			<%
				System.out.println("Cpt:" + cpt);

				Question q = null;
				int j = 1;
				for (Question question : listeQuestions) {
					if (j == cpt) {
						q = question;
					}
					j++;
				}

				if (request.getParameter("A") != null) {
					if (request.getParameter("A").equals(
							request.getParameter("bonneRep"))) {
						bonneReponse = true;
						score = PartieRepository
								.incrementerScoreJoueurCourant(roundCourant
										.getPartie());
						System.out.println("Score a " + score);
					}
				}
				if (request.getParameter("B") != null) {
					System.out.println("B");
					if (request.getParameter("B").equals(
							request.getParameter("bonneRep"))) {
						bonneReponse = true;
						score = PartieRepository
								.incrementerScoreJoueurCourant(roundCourant
										.getPartie());
						System.out.println("Score b " + score);
					}
				}
				if (request.getParameter("C") != null) {
					System.out.println("C");
					if (request.getParameter("C").equals(
							request.getParameter("bonneRep"))) {
						bonneReponse = true;
						score = PartieRepository
								.incrementerScoreJoueurCourant(roundCourant
										.getPartie());
						System.out.println("Score c " + score);
					}
				}
				if (request.getParameter("D") != null) {
					System.out.println("D");
					if (request.getParameter("D").equals(
							request.getParameter("bonneRep"))) {
						bonneReponse = true;
						score = PartieRepository.incrementerScoreJoueurCourant(roundCourant
								.getPartie());
						System.out.println("Score d " + score);
					}
				}
				if (request.getParameter("color") != null) {
					if (bonneReponse) {
						color = "green";
					} else {
						color = "red";
					}
				}
				
				if (q == null) {	
					response.sendRedirect("finDeRound.jsp");
					return;
				}
				
				String rA = q.getReponseA();
				String rB = q.getReponseB();
				String rC = q.getReponseC();
				String rD = q.getReponseD();
				String bonneRep = q.getBonneReponse();

				System.out.println("Bonne reponse " + bonneRep);
			%>

			<p><%=q.getQuestion()%>
			</p>
			<p><%=cpt%>/<%=nbTotal%></p>
			<span style="color:<%=color%>">Score : <%=score%></span>
		</div>
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
								<input type="hidden" name="color" value="<%=color%>">
								<input type="hidden" name="cpt" value="<%=cpt%>">
								<input type="hidden" name="bonneRep" value="<%=bonneRep%>">
								<tr>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-default" name="A"
													value="<%=rA%>"><%=rA%></button>
											</div>
										</center></td>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-default" name="B"
													value="<%=rB%>"><%=rB%></button>
											</div>
										</center></td>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-default" name="C"
													value="<%=rC%>"><%=rC%></button>
											</div>
										</center></td>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-default" name="D"
													value="<%=rD%>"><%=rD%></button>
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