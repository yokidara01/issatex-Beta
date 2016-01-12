<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="panel panel-default">
  <div class="panel-heading">Inscription</div>
  <div class="panel-body" style="max-width: 50%">
   <form action="Inscription" method="get" name="form">
   <div class="input-group">
  
  <span class="input-group-addon" id="basic-addon1"   >Nom</span>
  <input name="nom" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Prénom</span>
  <input name="prenom" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Adresse</span>
  <input name="adresse" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span  class="input-group-addon" id="basic-addon1">Pays</span>
  <input name="pays" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Tel</span>
  <input name="tel" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Réference Douane</span>
  <input name="refDouane" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Mot de pass</span>
  <input name="mdp" type="password" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Vérifier mot de pass</span>
  <input name="mdpv" type="password" class="form-control" placeholder="" aria-describedby="basic-addon1">
</div>
  </div>
  <a href="#" onclick="document.forms['form'].submit(); return false;" class="button-0">S'inscrire</a>

<style type="text/css">
.button-0 {
    position: relative;
    padding: 10px 40px;
    margin: 0px 10px 10px 0px;
    float: left;
    border-radius: 10px;
    font-family: 'Helvetica', cursive;
    font-size: 25px;
    color: #FFF;
    text-decoration: none;  
    background-color: #3498DB;
    border-bottom: 5px solid #2980B9;
    text-shadow: 0px -2px #2980B9;
    /* Animation */
    transition: all 0.1s;
    -webkit-transition: all 0.1s;
}

.button-0:hover, 
.button-0:focus {
    text-decoration: none;
    color: #fff;
}

.button-0:active {
    transform: translate(0px,5px);
    -webkit-transform: translate(0px,5px);
    border-bottom: 1px solid;
}
</style>
  </form>
</div>
</body>
</html>