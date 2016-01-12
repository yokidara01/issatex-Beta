<%@page import="dao.ClientDao"%>
<%@page import="java.util.Date"%>
<%@page import="beans.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html style="background-color: gray;">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%ArrayList<Article> ar =(ArrayList<Article>) request.getAttribute("la") ;  %>
 <script language="JavaScript" type="text/javascript">
function test() {
    var x = document.getElementById("mySelect").value;
  
    var jsArray = [<% for (int i = 0; i < ar.size(); i++) { %>"<%=ar.get(i).getLibArt()%>"<%= i + 1 < ar.size() ? ",":"" %><% } %>];
	
				  document.getElementById("demo").value = "You selected: " + jsArray[x-1];
				
		
  
    
}

</script> 


</head>
<body>
<center>
 <%  
 Client c  ; 
  ClientDao cdao  = new ClientDao(); 

  c=cdao.getClientWithId(session.getAttribute("id")+"") ;
  
  
 %>
<form action="addOF" method="post">
Saisie OF 
Client Authentifié : 
<h3>Votre OF :</h3>
<%
String refOF=c.getNom()+c.getPrénom()+"-"+Math.random();
%>
Date OF : <input type="date" name="dateOF"> RefOF : <input type="text" disabled="disabled" name="refOF" value="<%=refOF%>"> <br>
Ref Article :     <select id="mySelect" onchange="test()" name="refArticle">
<% 
for(Article b : ar)
{
	out.print("<option value='"+b.getRefArt()+"'>"+b.getRefArt()+"</option>");
}
%>


 </select>
 <br>
 Désination : <input type="text" name="desArticle" disabled="disabled" id="demo">
 <br>
 <a href="AddArticle">ajouter un article</a>
 Tailles a Confectionner : Taille M : <input type="number" name="tailleM" > Taille L <input type="number" name="tailleL" > Taille XL <input type="number" name="tailleXL" >
 <br>
 <h3>Détails OF</h3>
 Prix Unitaire proposé: <input type="text" name="prixP">EUR<br>
 Temps Unitaire:<input type="text" name="tempUnit">
 <br>
 <input type="hidden" value="<%=c.getIdClient()%>" name="IdClient">
 <input type="submit" value="Soummetre OF">
 <input type="reset" value="Annuler">
 </form>
</center>
</body>

</html>
