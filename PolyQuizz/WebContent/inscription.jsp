<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Connexion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="Bootstrap/js/jquery-1.11.1.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Conteneur principal -->
    <div class="container">
      
      <!-- Barre de navigation -->
      <jsp:include page="menu.jsp" />
      <!-- Page de Connexion : -->
<div class="col-md-4 col-md-offset-4">
    <div class="panel panel-default">
  <div class="panel-heading"><h3 class="panel-title"><strong>Enregistrement </strong></h3></div>
  <div class="panel-body">
   <form role="form">
  <div class="form-group">
    <label for="exampleInputEmail1">Pseudo</label>
    <input type="email" class="form-control" style="border-radius:0px" id="exampleInputPseudo" placeholder="Entrer votre pseudo">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password <a href="/sessions/forgot_password">(forgot password)</a></label>
    <input type="password" class="form-control" style="border-radius:0px" id="exampleInputPassword1" placeholder="Password">
        <label for="exampleInputPassword1">Password Confirmation</label>
    <input type="password" class="form-control" style="border-radius:0px" id="exampleInputPassword2" placeholder="Confirmation Password">
  </div>
  <button type="submit" class="btn btn-sm btn-default">Sign in</button>
</form>
  </div>
</div>
</div>
</div>
 		
  </body>
</html>