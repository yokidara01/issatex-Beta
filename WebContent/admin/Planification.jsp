<%@page import="dao.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="connexion.Singleton"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%
    try{
    	
    
    if(session.getAttribute("Role")=="Utilisateur")
    {
    	%><jsp:forward page="../dashuser.jsp"/>
    <% }
    else if ((session.getAttribute("Role")!="Utilisateur")&& (session.getAttribute("Role")!="Admin"))
    {   
    	request.setAttribute("Msg","Acces interdit! ");
    	%><jsp:forward page="../404.jsp"/>
        <%
    }
    
    }catch(Exception ex)
    {
    	ex.printStackTrace();
    }
    
    Client c  ; 
    ClientDao cdao  = new ClientDao(); 

    c=cdao.getClientWithId(session.getAttribute("id")+"") ;
    %>

<!doctype html>
<html class="no-js">
  <head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Dashboard/dist/assets/css/main.min.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/metisMenu/1.1.3/metisMenu.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.5/fullcalendar.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
      <script src="assets/lib/html5shiv/html5shiv.js"></script>
      <script src="assets/lib/respond/respond.min.js"></script>
      <![endif]-->

    <!--For Development Only. Not required -->
    <script>
      less = {
        env: "development",
        relativeUrls: false,
        rootpath: "../assets/"
      };
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Dashboard/dist/assets/css/style-switcher.css">
    <link rel="stylesheet/less" type="text/css" href="<%=request.getContextPath()%>/Dashboard/src/assets/less/theme.less">
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.2.0/less.min.js"></script>

    <!--Modernizr-->
    <script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
  </head>
  <body class="  ">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <!-- .navbar -->
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container-fluid">

            <!-- Brand and toggle get grouped for better mobile display -->
            <header class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
              </button>
              <a href="index.html" class="navbar-brand">
                <img src="<%=request.getContextPath()%>/Dashboard/dist/assets/img/logo.png" alt="">
              </a> 
            </header>
            <div class="topnav">
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip" class="btn btn-default btn-sm" id="toggleFullScreen">
                  <i class="glyphicon glyphicon-fullscreen"></i>
                </a> 
              </div>
              <div class="btn-group">
               
              </div>
              <div class="btn-group">
                <a href="<%=request.getContextPath()%>/logout" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                  <i class="fa fa-power-off"></i>
                </a> 
              </div>
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="Show / Hide Left" data-toggle="tooltip" class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                  <i class="fa fa-bars"></i>
                </a> 
                
              </div>
            </div>
          
          </div><!-- /.container-fluid -->
        </nav><!-- /.navbar -->
        <header class="head">
       
          <div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp; Dashboard</h3>
          </div><!-- /.main-bar -->
        </header><!-- /.head -->
      </div><!-- /#top -->
      <div id="left">
        <div class="media user-media bg-dark dker">
          <div class="user-media-toggleHover">
            <span class="fa fa-user"></span> 
          </div>
          <div class="user-wrapper bg-dark">
            <a class="user-link" href="">
              <img class="media-object img-thumbnail user-img" alt="User Picture" src="<%=request.getContextPath()%>/Dashboard/dist/assets/img/user.png">
              <span class="label label-danger user-label"><%=c.getNom() %></span> 
            </a> 
           
          </div>
        </div>

        <!-- #menu -->
        <ul id="menu" class="bg-blue dker">
          <li class="nav-header">Menu</li>
          <li class="nav-divider"></li>
          <li class="active">
            <a href="admin/dashboard.jsp">
              <i class="fa fa-dashboard"></i><span class="link-title">&nbsp;Dashboard</span> 
            </a> 
          </li>
          <li class="">
            <a href="javascript:;">
              <i class="fa fa-building "></i>
              <span class="link-title">Articles</span> 
              <span class="fa arrow"></span> 
            </a> 
            <ul>
              <li>
                <a href="addarticle.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Ajouter </a> 
              </li>
              <li>
                <a href="modifArticle.jsp">
                  <i class="fa fa-angle-right"></i>Modifier </a> 
              </li>
              <li>
                <a href="deleteArticle.jsp">
                  <i class="fa fa-angle-right"></i>Supprimer</a> 
              </li>
              <li>
                <a href="validerArticle.jsp">
                  <i class="fa fa-angle-right"></i>Valider</a> 
              </li>
              
                  <li>
                <a href="fixed-header-menu.html">
                  <i class="fa fa-angle-right"></i>Liste</a> 
              </li>
         
            </ul>
          </li>
          <li class="">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span class="link-title">Ilots</span> 
              <span class="fa arrow"></span> 
            </a> 
            <ul>
              <li>
                <a href="admin/ilot/Ajouterilot.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Ajouter </a> 
              </li>
              <li>
                <a href="admin/ilot/modifierilot.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Modifier </a> 
              </li>
              <li>
                <a href="admin/ilot/deleteilot.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Supprimer </a> 
              </li>
             
            </ul>
          </li>
          <li class="">
            <a href="javascript:;">
              <i class="fa fa-pencil"></i>
              <span class="link-title">
            Rendement
	  </span> 
              <span class="fa arrow"></span> 
            </a> 
            <ul>
              <li>
                <a href="rendementj.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Rendement Journalier </a> 
              </li>
              <li>
                <a href="rendementh.jsp">
                  <i class="fa fa-angle-right"></i>&nbsp; Rendement Hebdomadaire </a> 
              </li>
              
            </ul>
          </li>
          <li>
            <a href="admin/Planification.jsp">
              <i class="fa fa-table"></i>
              <span class="link-title">Planification</span> 
            </a> 
          </li>
          <li>
            <a href="admin/pointage.jsp">
              <i class="fa fa-file"></i>
              <span class="link-title">
      Pointage
          </span> 
            </a> 
          </li>
          
          
         
               
      
        </ul><!-- /#menu -->
      </div><!-- /#left -->
      <div id="content">
        <div class="outer">
          <div class="inner bg-light lter">
            <div class="text-center">
              <div class="box">
                  <header>
                    <h5>Planifier</h5>
                  </header>
                  </div>

  <form action="../../" methode="post">
              <p>chaque ilot a un temp de travail de 8 heurs maximum , chaque
					OF / OFur aura le minimum des liste des ilot pour les affecter .
					vueillez choisire les ilot correspondant a chaque OF / OFur</p>
				<%
 
	ResultSet res = null ;
	Connection cn = Singleton.getInstance() ; 
	ArrayList<Ilot> li =new ArrayList<Ilot>() ; 
	try {
		Statement st= cn.createStatement(); 
		String req="select * from ilot where codeilot>1"  ;
		System.out.println(req) ;
		res =st.executeQuery(req);
		while(res.next())
		{
			Ilot i = new Ilot(); 
		i.codeIlot=res.getInt(1);
		i.nbreEmploy�s=res.getInt(2);
		i.nbreMachines=res.getInt(3);
		li.add(i) ;
		
		}
	} catch (SQLException ex) {
		// TODO Auto-generated catch block
		ex.printStackTrace();
	}
	
	
	
	ArrayList<OF> lof =new ArrayList<OF>() ; 
	try {
		Statement st= cn.createStatement(); 
		String req="select * from of "  ;
		System.out.println(req) ;
		res =st.executeQuery(req);
		while(res.next())
		{
			OF of = new OF();
		of.setQteL(res.getString("qtel")) ;
		of.setQteM(res.getString("qtem")) ;
		of.setQteXL(res.getString("qtexl")) ; 
		of.setRefArt(res.getString("refart")) ; 
		of.setRefOF(res.getString("refof")) ;
		lof.add(of) ;
		
		}
	} catch (SQLException ex) {
		// TODO Auto-generated catch block
		ex.printStackTrace();
	}
	int i = 1;
	OFDao ofdao = new OFDao() ; 
	
for(OF of : lof)
{	
		%>

				<% 
	
	out.println("<input type='hidden' name='iof' value='"+i+"'>");
	 out.println("<p>R�ference de OF : "+of.getRefOF()+" temp total estim� : "+"<div id='esttime"+i+"'>"+ofdao.getEstimatedTime(Integer.parseInt(of.getRefOF()))+"</div>"+"</p>"+" selectionn� les ilot pour ce OF : idIlot=<br> ");
	 for(int r = 1; r <= ofdao.getMinTeamRequired(Integer.parseInt(of.getRefOF()))/60; r++)
	
	 {
		 
		 
	 				out.println(" - <select>") ;
					for(Ilot ilot : li)
					{
						 out.println( "<option value='"+ilot.codeIlot+"' name='"+"ilot"+of.getRefOF()+"-"+r+"'>"+ilot.codeIlot+"</option>");
					}
					
					out.print("</select>"+" ~ ");
					i++;
					}
	 
}
					 %>
					 
					 <button  class="btn btn-lg"  type="submit">Valider</button>
              </form>
            </div>
          
            <div class="text-center">
              <div class="box">
                  <header>
                    <h5>Racourcis</h5>
                  </header>
                  </div>
              <a class="quick-btn" href="#">
                <i class="fa fa-bolt fa-2x"></i>
                <span>default</span> 
                <span class="label label-default">2</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-check fa-2x"></i>
                <span>danger</span> 
                <span class="label label-danger">2</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-building-o fa-2x"></i>
                <span>No Label</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-envelope fa-2x"></i>
                <span>success</span> 
                <span class="label label-success">-456</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-signal fa-2x"></i>
                <span>warning</span> 
                <span class="label label-warning">+25</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-external-link fa-2x"></i>
                <span>π</span> 
                <span class="label btn-metis-2">3.14159265</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-lemon-o fa-2x"></i>
                <span>é</span> 
                <span class="label btn-metis-4">2.71828</span> 
              </a> 
              <a class="quick-btn" href="#">
                <i class="fa fa-glass fa-2x"></i>
                <span>φ</span> 
                <span class="label btn-metis-3">1.618</span> 
              </a> 
            </div>
         
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <h5>Calendrier</h5>
                  </header>
                  <div id="calendar_content" class="body">
                    <div id='calendar'></div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- /.inner -->
        </div><!-- /.outer -->
      </div><!-- /#content -->
      
    </div><!-- /#wrap -->
    <footer class="Footer bg-dark dker">
      <p> M1GLDRA � Copyright 2016 Tous droits r�serv�s.</p>
    </footer><!-- /#footer -->

    <!-- #helpModal -->
 

    <!--jQuery -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.5/fullcalendar.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.18.4/js/jquery.tablesorter.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-sparklines/2.1.2/jquery.sparkline.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.selection.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.resize.min.js"></script>

    <!--Bootstrap -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <!-- MetisMenu -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/metisMenu/1.1.3/metisMenu.min.js"></script>

    <!-- Screenfull -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/screenfull.js/2.0.0/screenfull.min.js"></script>

    <!-- Metis core scripts -->
    <script src="<%=request.getContextPath()%>/Dashboard/dist/assets/js/core.min.js"></script>

    <!-- Metis demo scripts -->
    <script src="<%=request.getContextPath()%>/Dashboard/dist/assets/js/app.js"></script>
    <script>
      $(function() {
        Metis.dashboard();
      });
    </script>
    <script src="<%=request.getContextPath()%>/Dashboard/dist/assets/js/style-switcher.min.js"></script>
  </body>