<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="modele.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Poly'Quizz</title>
<!-- On ouvre la fenÃªtre Ã  la largeur de l'Ã©cran -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- IntÃ©gration du CSS Bootstrap -->
<link href="../Bootstrap/css/bootstrap.css" rel="stylesheet"
	media="screen">
<!-- IntÃ©gration du CSS responsive Bootstrap -->
<link href="../Bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div class="row-fluid">
			<img class="imgAutoSize" src="../img/banniere_sous_menu.png" /> <br />
		</div>
		<!-- FIN DU MENU -->
		<h2>Vos parties en cours</h2>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Vos quizzs</strong>
				</h3>
			</div>
			<div class="panel-body">
				<!-- LISTE DES INSCRITS POUR INVITATION : -->
				<div class="row-fluid">
					<div class="wapperindex">
						<table class="table table-striped">
							<thead>
								<tr>
									<th><center>Joueur</center></th>
									<th><center>Reprendre</center></th>
									<th><center>Déjà rencontré</center></th>
									<th><center>Round actuel :</center></th>
								</tr>
							</thead>
							<tbody>

								<%
									if (session.getAttribute("joueur") == null) {
										response.sendRedirect("/PolyQuizz/index.jsp");
										return;
									}
									Joueur joueurConnecte = (Joueur) session.getAttribute("joueur");
									List<Joueur> joueursPartieEnCours = JoueurRepository
											.joueursPartieEnCours(joueurConnecte);
									Joueur joueurReprendre = null;

									for (Joueur j : joueursPartieEnCours) {

										String iconRencontre = new String();
										boolean dejaRencontre = PartieRepository.dejaRencontre(
												joueurConnecte, j);
										if (dejaRencontre) {
											iconRencontre = "ok";
										} else {
											iconRencontre = "remove";
										}

										int nbVictoires = PartieRepository
												.nbVictoires(joueurConnecte, j);
										int nbDefaites = PartieRepository.nbDefaites(joueurConnecte, j);
								%>

								<tr>
									<td><center>j.getPseudo()</center></td>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-success"
													name="<%=j.getPseudo()%>Reprendre">Reprendre</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-<%=iconRencontre%>"></span>
										</center></td>
									<td><center>
											<span class="badge-bleu">1</span>
										</center></td>
								</tr>
								<%
									}

									if (joueursPartieEnCours != null) {
										JoueurRepository.invite(joueurConnecte, joueursPartieEnCours);
										response.sendRedirect("/PolyQuizz/Connected_Zone/invitation.jsp");
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- IntÃ©gration de la libraire jQuery -->
	<script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
	<!-- IntÃ©gration de la libraire de composants du Bootstrap -->
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
