<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="modele.*"%>

<ul class="nav nav-tabs">
  <li><a href="index.jsp">Accueil</a></li>
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      Jeu <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
    <%
    if (session.getAttribute("joueur") == null) {
		response.sendRedirect("/PolyQuizz/index.jsp");
		return;
	}
	int id = ((Joueur) session.getAttribute("joueur")).getId();
	Joueur joueurCourant = JoueurRepository.find(id);
	java.util.Set<Joueur> liste = joueurCourant.getInvitations();
	int nbInvitations = liste.size();
    %>
      <li><a href="invitation.jsp">Invitations <span class="badge-bleu"><%=nbInvitations %></span></a></li>
      <li><a href="historic.jsp">Historique de jeu</a></li>
    </ul>
  </li>
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      Mon compte <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
      <li><a href="pswd_change.jsp">Changer mot de passe</a></li>      
    </ul>
  </li>
  <li>
  	<form role="form" action="menu.jsp" method="post">
  		<button type="submit" name="disconnect" class="btn btn-primary">Deconnexion</button>
  	</form>
  </li>  	
  		
		<%
			if (request.getParameter("disconnect") != null) {
				session.removeAttribute("joueur");
				response.sendRedirect("/PolyQuizz/index.jsp");			
			}
		%>
</ul>