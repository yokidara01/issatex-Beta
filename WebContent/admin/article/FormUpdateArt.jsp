<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ArticleDao"%>
<%@page import="dao.ClientDao"%>
<%@page import="beans.Client"%>
<%@page import="beans.Article"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    try{
    	
    
    if(session.getAttribute("Role")!="Admin")
    {
    	%><jsp:forward page="../index.jsp"/>
    <% }
    }catch(Exception ex)
    {
    	ex.printStackTrace();
    }
    
    Client c  ; 
    ClientDao cdao  = new ClientDao(); 

    c=cdao.getClientWithId(session.getAttribute("id")+"") ;
    
    ArticleDao artdao = new ArticleDao();
    ArrayList<Article> ListArticle = new ArrayList<Article>();
    ListArticle = artdao.GetAllArticle();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link href="dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    
    #checkEtat{
   
    
    color: red;
    
    
    }
    
    </style>
  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the 
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |  
  |---------------------------------------------------------|
  
  -->
  <body class="skin-blue">
  
  <%Article art = (Article) request.getAttribute("art"); %>
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="/admin/AdminPanel.jsp" class="logo"><b>Administration</b>LTE</a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
         
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
           
            <div class="pull-left info">
              <p><%=c.getNom() %></p>
              <!-- Status -->
            
            </div>
          </div>

          <!-- search form (Optional) -->
          
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">Gerer les articles</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><a href="addarticle.jsp"><span>creer</span></a></li>
             <li class="active"><a href="ModifArticle.jsp"><span>modifier</span></a></li>
              <li class="active"><a href="deleteArticle.jsp"><span>supprimer</span></a>  </li>
               <li class="active"><a href="validerArticle.jsp"><span>valider</span></a>  </li>
              <li class="header">gerer les ilots</li>
              <li class="active"><a href="addilot.jsp"><span>creer</span></a></li>
              <li class="active"><a href="modifierilot.jsp"><span>modifier</span></a></li>
               <li class="active"><a href="deleteilot.jsp"><span>supprimer</span></a></li>
                <li class="header">Planification</li>
              <li class="active"><a href="planifier.jsp"><span>Planifier pour cette semaine</span></a></li>
               <li class="header">Rendement</li>
              <li class="active"><a href="rendementj.jsp"><span>Rendement Journalier</span></a></li>
              <li class="active"><a href="rendementh.jsp"><span>Rendement Hebdomadaire</span></a></li>
              	<li class="header">Ordre de Fabrication</li>
              <li class="active"><a href="clientProp.jsp"><span>Modifier</span></a></li>
              <li class="active"><a href="clientNorm.jsp"><span></span></a></li>
              	<li class="header">Types des Clients</li>
              <li class="active"><a href="admin/clientProp.jsp"><span>Les Clients Privilégiés</span></a></li>
              <li class="active"><a href="admin/clientNorm.jsp"><span>Les Clients Normales</span></a></li>		
              </ul>
            </li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
   <center>
   
   <h1>Modifier l'article</h1>
   
   		<form action="ArtModifie" method="post">
   		
   		<label for="refart">Rer Article : </label>
   			<input type="text" name="refart" readonly="readonly" value="<%=art.getRefArt()%>">
   		<label for="libart"> Désignation : </label>
   			<input type="text" name="libart" value="<%=art.getLibArt()%>">
   		<label for="tempU"> Temps Unitaire : </label>
   			<input type="text" name="tempu" value="<%=art.getTempsUnitaire()%>">
   		<label for="pumoy"> Prix Moyen : </label>
   			<input type="text" name="prixmoy" value="<%=art.getPUMoy()%>">
   		<label for="temp">Etat : </label>
   			<input type="text" name="etat" readonly="readonly" value="<%=art.getTemp()%>">
   			<input type="submit" name="btnsubmit" value="Modifier">
   			<input type="reset" name="btnreset" value="annuler">
   		
   		</form>
   
   
   </center>
      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
       
        </div>
        <!-- Default to the left --> 
       
      </footer>

    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->
    
    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    
    <!-- Optionally, you can add Slimscroll and FastClick plugins. 
          Both of these plugins are recommended to enhance the 
          user experience -->
  </body>
</html>