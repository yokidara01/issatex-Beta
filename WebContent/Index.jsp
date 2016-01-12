<%@page import="beans.Client"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<script src="bootstrap/js/bootstrap.js"></script>
<title>Welcome to Issatex</title>
</head>
<body>
	<header>
	<ul class="nav nav-pills">
		<li role="presentation" class="active"><a href="Index.jsp">Home</a></li>
		<%
 
 
  if (session.getAttribute("Role")=="Utilisateur")
  {
	  out.print("<li role='presentation'><a href='Profil.jsp'>Profil</a></li>") ;
	  out.print("<li role='presentation'><a href='logout'>Deconnection</a></li>") ;
	  
	  out.print("<h2>Hello"+session.getAttribute("Nom")+"</h1>");
	  
  } 
  else if(session.getAttribute("Role")=="Admin")
  {
	  out.print("<li role='presentation'><a href='Profil.jsp'>Profil</a></li>") ;
	  out.print("<li role='presentation'><a href='admin/dashboard.jsp'>Administration</a></li>") ;
	  out.print("<li role='presentation'><a href='logout'>Deconnection</a></li>") ;
	  
	  out.print("<h2>Hello"+session.getAttribute("Nom")+"</h1>");
  }
  
  
  
  
  
  else{
	  
 
  
  
  
  
  
	  out.print("<li role='presentation'><a href='Inscription.jsp'>Inscription</a></li>");
	  out.print("<li role='presentation'><a href='login.jsp'>login</a></li>");

  }
%>

	</ul>

	</header>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<img src="logo.png">
	</center>
</body>
</html>