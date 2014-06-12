<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="modele.*"%>
<%@page import="hibernate.HibernateUtil"%>

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

	<!-- Conteneur principal -->
	<div class="container">

		<!-- Barre de navigation -->
		<div>
			<jsp:include page="menu.jsp" />
			<div class="row-fluid">
				<img class="imgAutoSize" src="../img/banniere_sous_menu.png" /> <br />
			</div>
		</div>
	</div>
	<!-- Liste invitations recues -->
	<h2>Gestionnaire d'invitations</h2>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>Invitation(s) recue(s)</strong>
			</h3>
		</div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
				<div class="achievements-wrapper">
					<form role="form" action="invitation.jsp" method="post">
						<table class="table table-striped">
							<thead>
								<tr>
									<th><center>Joueur</center></th>
									<th><center>Action</center></th>
									<th><center>Déjà rencontré</center></th>
									<th><center>Victoire / Défaite</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									if (session.getAttribute("joueur") == null) {
										response.sendRedirect("/PolyQuizz/index.jsp");
										return;
									}
									int id = ((Joueur) session.getAttribute("joueur")).getId();
									Joueur joueurCourant = JoueurRepository.find(id);
									java.util.Set<Joueur> liste = joueurCourant.getInvitations();
									boolean accepter = false;
									boolean refuser = false;

									Joueur hote = null;

									for (Joueur j : liste) {
										
										String iconRencontre = new String();
										boolean rencontre = PartieRepository.dejaRencontre(
												joueurCourant, j);
										if (rencontre) {
											iconRencontre = "ok";
										} else {
											iconRencontre = "remove";
										}
								%>
								<tr>
									<td><center><%=j.getPseudo()%></center></td>
									<td><center>
											<div class="btn-group">
												<button type="submit" class="btn btn-success"
													name="<%=j.getPseudo()%>accepter">Accepter</button>

												<button type="submit" class="btn btn-danger"
													name="<%=j.getPseudo()%>refuser">Refuser</button>
												<%
													if (request.getParameter(j.getPseudo() + "accepter") != null) {
															hote = j;
															accepter = true;
															// response.sendRedirect("/PolyQuizz/Connected_Zone/Game_Zone/ChoiceTheme.jsp");
														}
														if (request.getParameter(j.getPseudo() + "refuser") != null) {
															hote = j;
															refuser = true;
															//JoueurRepository.removeInvitation(joueurCourant, j);
														}
												%>
											</div>
										</center></td>
									<td><center>
												<span class="glyphicon glyphicon-<%=iconRencontre%>"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">3</span> <span class="badge-rouge">1</span>
										</center></td>
								</tr>
								<%
									}
									if (hote != null) {
										System.out.println("accepter = " + accepter);
										System.out.println("refuser = " + refuser);
										if (accepter) {
											Partie p = new Partie();
											p.setJoueur1(joueurCourant);
											p.setJoueur2(hote);
											p.setJoueurCourant(joueurCourant);
											PartieRepository.save(p);

											Round r = new Round();
											r.setPartie(p);
											RoundRepository.save(r);

											p.setRoundCourant(r);
											JoueurRepository.removeInvitation(joueurCourant, hote);
											//liste.remove(hote);
											//JoueurRepository.update(joueurCourant);
											PartieRepository.update(p);
											accepter = false;
											response.sendRedirect("/PolyQuizz/Connected_Zone/Game_Zone/ChoiceTheme.jsp");
										} else if (refuser) {
											JoueurRepository.removeInvitation(joueurCourant, hote);
											refuser = false;
											response.sendRedirect("/PolyQuizz/Connected_Zone/invitation.jsp");
										}
									}
								%>

							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>


		<!-- Liste des joueurs -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Inviter un joueur</strong>
				</h3>
			</div>
			<div class="panel-body">
				<!-- LISTE DES INSCRITS POUR INVITATION : -->
				<div class="row-fluid">
					<div class="achievements-wrapper">
						<form role="form" action="invitation.jsp" method="post">
							<table class="table table-striped">
								<thead>
									<tr>
										<th><center>Joueur</center></th>
										<th><center>Action</center></th>
										<th><center>Déjà rencontré</center></th>
										<th><center>Victoire / Défaite</center></th>
									</tr>
								</thead>
								<tbody>
									<%
										if (session.getAttribute("joueur") == null) {
											response.sendRedirect("/PolyQuizz/index.jsp");
											return;
										}
										Joueur joueurConnecte = (Joueur) session.getAttribute("joueur");
										List<Joueur> joueursLibres = JoueurRepository
												.joueursLibres(joueurConnecte);
										Joueur joueurInvite = null;

										for (Joueur j : joueursLibres) {
											String iconRencontre2 = new String();
											boolean rencontre = PartieRepository.dejaRencontre(
													joueurConnecte, j);
											if (rencontre) {
												iconRencontre2 = "ok";
											} else {
												iconRencontre2 = "remove";
											}
									%>


									<tr>
										<td><center><%=j.getPseudo()%></center></td>
										<td><center>
												<div class="btn-group">
													<input class="btn btn-primary" type="submit"
														name="inviter<%=j.getPseudo()%>" value="Inviter" />
													<%
														if (request.getParameter("inviter" + j.getPseudo()) != null) {
																joueurInvite = j;
															}
													%>
												</div>
											</center></td>
										<td><center>
												<span class="glyphicon glyphicon-<%=iconRencontre2%>"></span>
											</center></td>
										<td><center>
												<span class="badge-vert">3</span> <span class="badge-rouge">1</span>
											</center></td>
									</tr>


									<%
										}

										if (joueurInvite != null) {
											JoueurRepository.invite(joueurConnecte, joueurInvite);
											response.sendRedirect("/PolyQuizz/Connected_Zone/invitation.jsp");
										}
									%>
								</tbody>
							</table>
						</form>
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

