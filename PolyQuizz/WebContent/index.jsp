<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
    <!-- On ouvre la fenêtre �  la largeur de l'écran -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Intégration du CSS Bootstrap -->
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- Intégration du CSS responsive Bootstrap -->
    <link href="Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
      <div class="navbar navbar-inverse">
        <div class="navbar-inner">
          <!-- Bouton apparaissant sur les résolutions mobiles afin de faire apparaître le menu de navigation -->
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Poly Quizz</a>
          <!-- Structure du menu -->
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Connexion</a></li>
              <li><a href="#">Inscription</a></li>
              <li><a href="#">Contactez-nous</a></li>
              <!-- Menu déroulant -->
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu deroulant <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action 1</a></li>
                  <li><a href="#">Action 2</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Autres liens</li>
                  <li><a href="#">Lien 1</a></li>
                  <li><a href="#">Lien 2</a></li>
                </ul>
              </li>
            </ul>
            <!-- Champ de recherche -->
            <form class="navbar-search pull-right" action="#">
              <input type="text" class="search-query span2" placeholder="Rechercher">
            </form>
          </div>
        </div>
      </div>
     
    </div>
    
    <!-- Intégration de la libraire jQuery -->
    <script src="Bootstrap/js/jquery-1.11.1.min.js"></script>
    <!-- Intégration de la libraire de composants du Bootstrap -->
    <script src="Bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>