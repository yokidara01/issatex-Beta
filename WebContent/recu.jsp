<%@page import="dao.ClientDao"%>
<%@page import="beans.Client"%>
<%@page import="beans.OF"%>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<title>Demande envoyé</title>
</head>
<body>
<%
OF of = (OF) request.getAttribute("of");
ClientDao dc = new ClientDao(); 
Client c = dc.getClientWithId(of.getIdClient()); 

%>
<center>
<div class="page-header">
  <h1>  Notification d’enregistrement<small>Votre demande a eté envoyer</small></h1>
 </div>
<b>Opération</b> : 55 <b>Ref OF</b> : <%=of.getRefOF() %> <b>Date Réception OF</b> :<%=of.getDateOF() %><br>
<%String n= c.getNom()+"";%>
<b>Client </b>:<%=n %> <b>Pays</b> : <%=c.getPays() %><br>
 Client Prioritaire Approuvé<br>
<b>Article</b> : <%=of.getRefArt()%><br>
<%
int total=0; 
total= Integer.parseInt(of.getQteM())+Integer.parseInt(of.getQteL())+Integer.parseInt(of.getQteXL());
%>
<b>Quantité M </b>:<%=of.getQteM() %><b> Quantité L </b>: <%=of.getQteL() %> <b>Quantité XL </b>: <%=of.getQteXL() %> <b>Total</b> :<%=total%><br>
<% String qa="pas de cout additionel" ;
%>
<b>Coût Additionnel sur l'ordre :<%=qa %></b><br>
<br>
<button onclick="myFunction()">Imprimer</button>

<script>
function myFunction() {
    window.print();
}
</script>
</center>
</body>
</html>