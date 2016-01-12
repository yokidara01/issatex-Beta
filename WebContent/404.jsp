<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>404</title>
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="<%=request.getContextPath()%>/Dashboard/dist/assets/img/metis-tile.png" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Dashboard/dist/assets/css/main.min.css">
  </head>
  <body class="error">
    <div class="container">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <div class="logo">
          <h1>404</h1>
          
        </div>
        <p class="lead text-muted"><% out.print(request.getAttribute("Msg") ); %></p>
        <div class="clearfix"></div>
     
        <div class="clearfix"></div>
        <br>
        <div class="col-lg-6 col-lg-offset-3">
          <div class="btn-group btn-group-justified">
            <a href="../login.jsp" class="btn  btn-info">Se connecter</a> 
  
          </div>
        </div>
      </div><!-- /.col-lg-8 col-offset-2 -->
    </div>
  </body>
</html>