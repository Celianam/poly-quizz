<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modele.*"%>
<%@page import="hibernate.HibernateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= session.getAttribute("joueur") %> - Modification de mot de passe</title>
    <!-- On ouvre la fenÃªtre Ã  la largeur de l'Ã©cran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- IntÃ©gration du CSS Bootstrap -->
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- IntÃ©gration du CSS responsive Bootstrap -->
    <link href="../Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
      <jsp:include page="menu.jsp" />
      <div class="row-fluid">
      <img class="imgAutoSize" src="../img/banniere_sous_menu.png"/>
      </br>
      </div>
	      <!-- Barre de navigation -->
		 
		 <div class="row-fluid">
		 	<h2>Modification de votre mot de passe</h2>
		 </div>
		 
		 <div class="row-fluid">
		 	<span>Vous n'avez plus confiance en votre mot de passe ? Changez-le ici !</span>
		 </div><br/><br/>
		 <div class="row-fluid">
		 <%
		 		// Recupération du joueur courant : 
		 		Joueur j = (Joueur)session.getAttribute("joueur");
		 		// Verification si nous avons cliqué sur le bouton submit
		 		
		 		if(request.getParameter("envois")!=null)
		 		{
		 			System.out.println(request.getParameter("actualpswd"));
		 			System.out.println(request.getParameter("newpassword"));
		 			System.out.println(request.getParameter("passwordConf"));
		 			
		 			if(request.getParameter("actualpswd")!=null && request.getParameter("newpassword")!=null && request.getParameter("passwordConf")!=null && request.getParameter("passwordConf").toString().equals(request.getParameter("newpassword").toString()))
		 			{
		 				String mdp = request.getParameter("actualpswd");
						byte[] mdpConvertiEnByte = mdp.getBytes();
						boolean verifOk = JoueurRepository.exist(j.getPseudo(), mdp.getBytes());
		 				// Si verif Ok est true alors le champ ancien mdp correspond bien à celui dans la base
		 				// on peut donc lancer un un update pour le nouveau mot de passe.
		 				if(verifOk)
		 				{	
		 					// EFFECTUER LE CHANGEMENT DE MOT DE PASSE ICI
		 					response.sendRedirect("index.jsp");
							return;
		 				}
		 			}else
		 			{
		 				// show error
		 			}
		 		}
		 %>
 			<form role="form" method="post" action="pswd_change.jsp">
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="actualpswd">Mot de passe actuel</label>
                       <input class="form-control" type="password" name="actualpswd" placeholder="Mot de passe actuel">
                   </div>
               </div>
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="newpassword">Nouveau mot de passe</label>
                       <input class="form-control" type="password" name="newpassword" placeholder="Entrer le nouveau mot de passe">
                   </div>
               </div>
               <div class="row">
                   <div class="form-group col-xs-6">
                       <label for="passwordConf">Confirmation</label>
                       <input class="form-control" type="password" name="passwordConf" placeholder="Confirmation du nouveau mot de passe">
                   </div>
               </div>
               <br>
               <div class="row-fluid">
                   <div class="form-group col-xs-12">
                       <!-- <button type="submit" class="btn btn-lg btn-success">Changer</button> -->
                       <button name="envois" type="submit" class="btn">Changer</button>
                   </div>
               </div>
           </form>
		</div>
    </div>
    
    <!-- IntÃ©gration de la libraire jQuery -->
    <script src="../Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- IntÃ©gration de la libraire de composants du Bootstrap -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
