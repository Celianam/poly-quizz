<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	 </div><br/><br/>
	 
	<!-- Question -->
	<div class="jumbotron">
		<h2>Question 1</h2>
  		<p>Combien j'ai sur mon compte en banque ?</p>
  		<p>0/0</p>
	</div>


	 <!-- R�ponses -->
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>R�ponses</strong></h3></div>
		<div class="panel-body">
			<!-- LISTE DES INSCRITS POUR INVITATION : -->
			<div class="row-fluid">
			<table class="table table-striped">  
        <tbody>  
          <tr>  
<!--             <td><center>10000</center></td>
            <td><center>15000</center></td>
            <td><center>100</center></td>
            <td><center>Plus rien, je suis pauvre.</center></td> 
          </tr> -->  
          <tr>  
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">10000</button>
				</div>
            </center></td>
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">15000</button>
				</div>
            </center></td>
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">100</button>
				</div>
            </center></td>
            <td><center>
            	<div class="btn-group">
	  				<button type="button" class="btn btn-default">Plus rien, je suis pauvre.</button>
				</div>
            </center></td>  
          </tr> 
        </tbody>  
      </table>
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