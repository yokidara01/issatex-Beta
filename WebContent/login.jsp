<%@page import="beans.Employer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="connexion.Singleton"%>
<%@page import="beans.Ilot"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.ClientDao"%>
<%@page import="beans.Client"%>
<%@page import="beans.Presence"%>
<%@page import="dao.PresenceDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="<%=request.getContextPath()%>/Dashboard/assets/img/metis-tile.png" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Dashboard/dist/assets/css/main.min.css">
  </head>
  <body class="login">
    <div class="form-signin">
      <div class="text-center">
        <img src="<%=request.getContextPath()%>/Dashboard/dist/assets/img/logo.png" alt="Metis Logo">
      </div>
      <hr>
      <div class="tab-content">
        <div id="login" class="tab-pane active">
          <form  name="form" action="Login" method="post">
            <p class="text-muted text-center">
              Taper votre nom d'utilisateur et mot de passe
            </p>
            <input type="text" placeholder="Username" name="nom" class="form-control top">
            <input type="password" name="mdp" placeholder="Password" class="form-control bottom">
            <div class="checkbox">
              <label>
                <input type="checkbox"> Se souvenir de moi
              </label>
            </div>
            <button onclick="document.forms['form'].submit(); return false;" class="btn btn-lg btn-primary btn-block"  type="submit">Se connecter</button>
        
    
          </form>
        </div>
       
        <div id="signup" class="tab-pane">
          <form action="Inscription" method="get" name="form1">
            <input type="text" placeholder="Nom" class="form-control top" name="nom">
            <input type="text" placeholder="Prenom" class="form-control top" name="prenom">
            <input type="email" placeholder="E-mail" class="form-control middle" name="adresse">
            <input type="text" placeholder="Pays" class="form-control top" name="pays">
            <input type="text" placeholder="Reference douaine" class="form-control top" name="refDouane">
            <input type="text" placeholder="Téléphone" class="form-control top" name="tel">
            <input type="password" placeholder="Mot de passe" class="form-control middle" name="mdp">
          
            <button class="btn btn-lg btn-success btn-block" type="submit" onclick="document.forms['form1'].submit(); return false;">S'inscrire</button>
          </form>
        </div>
      </div>
      <hr>
      <div class="text-center">
        <ul class="list-inline">
          <li> <a class="text-muted" href="#login" data-toggle="tab">Se connecter</a>  </li>
          <li> <a class="text-muted" href="#signup" data-toggle="tab">S'inscrire</a>  </li>
        </ul>
      </div>
    </div>

    <!--jQuery -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <!--Bootstrap -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      (function($) {
        $(document).ready(function() {
          $('.list-inline li > a').click(function() {
            var activeForm = $(this).attr('href') + ' > form';
            //console.log(activeForm);
            $(activeForm).addClass('animated fadeIn');
            //set timer to 1 seconds, after that, unload the animate animation
            setTimeout(function() {
              $(activeForm).removeClass('animated fadeIn');
            }, 1000);
          });
        });
      })(jQuery);
    </script>
  </body>
</html>