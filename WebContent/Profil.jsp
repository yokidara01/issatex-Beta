<%@page import="beans.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<header>
<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="Index.jsp">Home</a></li>
  <%
 
  //System.out.println("***********************session attribut id : "+(String) session.getAttribute("id"));
  if (session.getAttribute("Role")=="Utilisateur")
  {
	  out.print("<li role='presentation'><a href='Profil.jsp'>Profil</a></li>") ;
	  out.print("<li role='presentation'><a href='logout'>Deconnection</a></li>") ;
	  
	  out.print("<h2>Hello"+session.getAttribute("Nom")+"</h1>");
	  
  } 
  else if(session.getAttribute("Role")=="Admin")
  {
	  out.print("<li role='presentation'><a href='Profil.jsp'>Profil</a></li>") ;
	  out.print("<li role='presentation'><a href='AdminPanel.jsp'>Administration</a></li>") ;
	  out.print("<li role='presentation'><a href='logout'>Deconnection</a></li>") ;
	  
	  out.print("<h2>Hello"+session.getAttribute("Nom")+"</h1>");
  }
  
  
  
  
  
  else{
	  
 
  
  
  
  
  
	  out.print("<li role='presentation'><a href='Inscription.jsp'>Inscription</a></li>");
	  out.print("<li role='presentation'><a href='Authentif.jsp'>login</a></li>");

  }
%>
</ul>
</header>
<%
if (true)
  { %>
  
<a href="preparerOF" class="navbar-link">creé une ordre de fabrication </a><br>
<%if(true) {
%>
<a href="AddOFUrgent" class="navbar-link">creé une ordre de fabrication Urgent </a><br>
<%} %>
	
<a href="#" class="navbar-link">Gerer des Ordres</a><br>
<% 	}
%>
</body>
</html>