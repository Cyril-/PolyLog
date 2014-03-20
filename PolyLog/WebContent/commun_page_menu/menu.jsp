<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link type='text/css' href='../commun_page_menu/menu.css'	rel='stylesheet' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="../accueil/polyLog.jsp">PolyLog</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="../accueil/accueil.jsp">Home</a></li>
              <li class="active"><a href="../accueil/create.jsp">Ajout Reservation</a></li>
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
   <!--/.nav-collapse > 

<div class="container">
      <div class="masthead">
        <div class="navbar navbar-inverse navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">
                <li><a href="../accueil/accueil.jsp" title="Accueil">Accueil</a><span class="spacer"></span></li>
                <li><a href="../Bateaux/listerBateau.jsp" title="Liste Des Bateaux">Lister Les Bateaux</a><span class="spacer"></span></li><%
	//if(manager.isIdentifie()) {
//%>                  
				<li><a href="../Bateaux/ajouterBateau.jsp" title="Ajouter Un Bateau">Ajouter Un Bateau</a><span class="spacer"></span></li>

				             
</ul>
<ul class="nav nav-pills pull-right"> 
<li><a title="Nom">Bonjour <%= manager.getNom() %></a><span class="spacer"></span></li>
<li><a href="../connexion/deconnexion.jsp" title="Deconnexion">Decccccnnexion</a><span class="spacer"></span></li></ul>

<%
//	}else{
%>

</ul>
<ul class="nav nav-pills pull-right btn-sm">

<li><a href="../connexion/identification.jsp" title="Connexion">Cdsqddqsdonnexion</a><span class="spacer"></span></li></ul>
<%
//	}
%>         


            </div>
          </div>
        </div><!-- /.navbar -->
        
   
  <!--    
  </div>
  </div>
  
  
  
  
  
  
  
  <div class="container">

      <div class="jumbotron">
        <h1>WikiBoatia</h1>
        <p class="lead"></p>

      </div>
      
		<hr>  -->  