<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenu(e) <%= session.getAttribute("joueur") %></title>
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
	 <!-- FIN DU MENU -->
		 <h2>Vos parties en cours</h2>
		 	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Vos quizzs</strong></h3></div>
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
          <tr>  
            <td><center>Aurélien</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-primary">Reprendre</button>
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-bleu">1</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Giovanny</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-primary">Reprendre</button>
				</div>
            </center></td>  
            <td><center><span class="glyphicon glyphicon-remove"></span></center></td>  
            <td><center><span class="badge-bleu">0</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Francine</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-primary">Reprendre</button>
				</div>
            </center></td>   
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-bleu">3</span></center></td>  
          </tr>  
          <tr>  
            <td><center>Stephanie</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-primary">Reprendre</button>
				</div>
            </center></td>   
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-bleu">1</span></center></td>  
          </tr> 
          <tr>  
            <td><center>Celine</center></td>  
            <td><center>
            	<div class="btn-group">
	  				<button class="btn btn-primary">Reprendre</button>
				</div>
            </center></td>   
            <td><center><span class="glyphicon glyphicon-ok"></span></center></td>  
            <td><center><span class="badge-bleu">2</span></center></td>  
          </tr> 
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