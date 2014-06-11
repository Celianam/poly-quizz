<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="modele.Joueur"%>
<%@ page import="modele.JoueurRepository"%>
<%@ page import="modele.Partie"%>
<%@ page import="modele.PartieRepository"%>

<%@ page import="java.util.List"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%=session.getAttribute("joueur")%></title>
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
      <img class="imgAutoSize" src="../img/banniere_sous_menu.png"/>
      </br>
      </div>
	 </div>
	 <!-- Liste invitations recues -->
	 <h2>Gestionnaire d'invitations</h2>
	 <div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Invitation(s) recu(s)</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
			<div class="achievements-wrapper">
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
          <tr>  
            <td><center>Aurélien</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-success">Accepter</button>
	  				<button class="btn btn-danger">Refuser</button>  
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-vert">3</span> <span class="badge-rouge">1</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Stephanie</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-success">Accepter</button>
	  				<button class="btn btn-danger">Refuser</button>  
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-remove"></span></center></td>  
            <td><center><span class="badge-vert">3</span> <span class="badge-rouge">1</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Celine</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-success">Accepter</button>
	  				<button class="btn btn-danger">Refuser</button>  
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-vert">3</span> <span class="badge-rouge">1</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Giovanny</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-success">Accepter</button>
	  				<button class="btn btn-danger">Refuser</button>
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-remove"></span></center></td>  
            <td><center><span class="badge-vert">2</span> <span class="badge-rouge">0</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Francine</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-success">Accepter</button>
	  				<button class="btn btn-danger">Refuser</button>
				</div>
            </center></td>   
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-vert">4</span> <span class="badge-rouge">1</span></center></td>  
          </tr>  
        </tbody>  
      </table>
      </div>
			</div>
			<div class="panel-body">
				<!-- LISTE DES INSCRITS POUR INVITATION : -->
				<div class="row-fluid">
					<div class="achievements-wrapper">
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
								<tr>
									<td><center>Aurélien</center></td>
									<td><center>
											<div class="btn-group">
												<button class="btn btn-success">Accepter</button>
												<button class="btn btn-danger">Refuser</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-ok"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">3</span> <span class="badge-rouge">1</span>
										</center></td>
								</tr>
								<tr>
									<td><center>Stephanie</center></td>
									<td><center>
											<div class="btn-group">
												<button class="btn btn-success">Accepter</button>
												<button class="btn btn-danger">Refuser</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-remove"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">3</span> <span class="badge-rouge">1</span>
										</center></td>
								</tr>
								<tr>
									<td><center>Celine</center></td>
									<td><center>
											<div class="btn-group">
												<button class="btn btn-success">Accepter</button>
												<button class="btn btn-danger">Refuser</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-ok"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">3</span> <span class="badge-rouge">1</span>
										</center></td>
								</tr>
								<tr>
									<td><center>Giovanny</center></td>
									<td><center>
											<div class="btn-group">
												<button class="btn btn-success">Accepter</button>
												<button class="btn btn-danger">Refuser</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-remove"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">2</span> <span class="badge-rouge">0</span>
										</center></td>
								</tr>
								<tr>
									<td><center>Francine</center></td>
									<td><center>
											<div class="btn-group">
												<button class="btn btn-success">Accepter</button>
												<button class="btn btn-danger">Refuser</button>
											</div>
										</center></td>
									<td><center>
											<span class="glyphicon glyphicon-ok"></span>
										</center></td>
									<td><center>
											<span class="badge-vert">4</span> <span class="badge-rouge">1</span>
										</center></td>
								</tr>
							</tbody>
						</table>
					</div>
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
										Joueur joueurCourant = (Joueur) session.getAttribute("joueur");
										List<Joueur> joueurs = JoueurRepository.findAll();
										String iconRencontre = "";
										for (Joueur j : joueurs) {

											if (!j.equals(joueurCourant)) {

												List<Partie> parties = PartieRepository.rencontre(
														joueurCourant.getId(), j.getId());
												if (!parties.isEmpty()) {
													iconRencontre = "ok";
												} else {
													iconRencontre = "remove";
												}

												/*         	for(Partie p : parties) {
												 if(p.getRounds().size() ==)
												 } */
									%>


									<tr>
										<td><center><%=j.getPseudo()%></center></td>
										<td><center>
												<div class="btn-group">
													<input class="btn btn-primary" type="submit" name="<%=j.getPseudo() %>"
														value="Inviter" />
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
										}	
										
										for (Joueur j : joueurs) {										
										
											if (request.getParameter(j.getPseudo()) != null) {
												System.out.println(j.getPseudo());
											}
											
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
