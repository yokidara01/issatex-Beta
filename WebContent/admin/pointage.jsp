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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="en">
    <head>
    <script type="text/javascript">
    function ShowDiv() {
    document.getElementById("dival").style.display = "block";
}
</script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
        
        <link rel="shortcut icon" href="./img/favicon.ico">

   

        <link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="../css/prettify-1.0.css" rel="stylesheet">
        <link href="../css/base.css" rel="stylesheet">
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
		<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
			<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
			<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/src/js/bootstrap-datetimepicker.js"></script>
            <link href="../css/signin.css" rel="stylesheet">
    </head>

    

   
     
<form class="form-signin"  method="post" action="../AddPresence">
 
  <div class="form-group">

<br> 
<%
 
	ResultSet res = null ;
	Connection cn = Singleton.getInstance() ; 
	ArrayList<Employer> li =new ArrayList<Employer>() ; 
	try {
		Statement st= cn.createStatement(); 
		String req="select * from employer"  ;
		System.out.println(req) ;
		res =st.executeQuery(req);
		while(res.next())
		{
			Employer emp = new Employer(); 
	    emp.nom=res.getString(2);
	    emp.ilot=res.getInt(3);
		emp.id=res.getInt(1);
		
		li.add(emp) ;
		
		}
	} catch (SQLException ex) {
		// TODO Auto-generated catch block
		ex.printStackTrace();
	}
	
	
	
 %>


<select  class="form-control placeholder" name="emp">
 <%for( Employer emp: li){ %>
 <option value="<%=emp.id%>" ><%=emp.nom %></option>
 
 <%} %>
 </select>
    

       
       
               




   

 
 <!--data time picker  -->        

                 <div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" name="Date" placeholder="Date" value="<?php echo @$_POST['datedebut'] ;?>"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
       
     
        <script type="text/javascript" >
            $(function () {
                $('#datetimepicker2').datetimepicker({
                    locale: 'fr'
                });
            });
        </script>







        


     
           
       <!-- end data time picker  -->   
   
 


  

 

  </div>
<div class='slider-example'>
      <h3>Nombre d'heures de travail</h3>
    
      <div class="well">
      <input id="ex14" type="text" name="NbHeures"/>
      </div>

	</div>
	   
    <link href="../spinner/css/bootstrap-slider.css" rel="stylesheet">
	<script type='text/javascript' src="../spinner/js/modernizr.js"></script>

    <script type='text/javascript' src="../spinner/js/bootstrap-slider.js"></script>
    <script type='text/javascript'>
    	$(document).ready(function() {
    		

			/* Example 14 */
			$("#ex14").slider({
				ticks: [0, 2, 4, 6, 8],
				ticks_labels: ['0H', '2H', '4H', '6H', '8H'],
				
				ticks_snap_bounds: 20,
				value: 8,
				reversed: false
			});

			
		});
    </script>

  <button type="submit" class="btn btn-default" name="Submit1">Enregistrer</button>
</form>
       
  
 

         

       


        <script src="./js/prettify-1.0.min.js"></script>
        <script src="./js/base.js"></script>
		<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-47462200-1', 'eonasdan.github.io');
		ga('send', 'pageview');
		</script>
    </body>
</html>