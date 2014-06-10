<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=""%>
    
<%
String pseudo = request.getParameter("pseudo");
String mdp = request.getParameter("motdepasse");

// Vérification joueur

// Ajout du joueur dans la session
session.setAttribute( "pseudo", pseudo );

// Redirection page joueur



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Poly'Quizz</title>
</head>
<body>
<h1>Connexion</h1>

<FORM NAME="form1" ACTION="connexion.jsp" METHOD="POST">
	<fieldset>
	    <legend>Connexion</legend>
	    <p></p>
	    
	    <label for="pseudo">Pseudo</label>
	    <input type="text" id="pseudo" name="pseudo" value="" size="20" maxlength="20" />
	    <br />
	
	    <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
	    <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
	    <br />
	
	    <input type="submit" value="Connexion" class="sansLabel" />
	    <br />
	</fieldset>
</FORM>


</body>
</html>