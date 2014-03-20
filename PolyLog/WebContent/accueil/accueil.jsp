<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />

<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Accueil</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>

 <div class="hero-unit">
              <h1 style=" color:grey;">Mairie De Chamigny</h1>
              <center>
              	<p><h3>Vous en avez marre de vous déplacer a la mairie pour rien ???</h3> alors regardez vite si la salle est libre sur notre emploi du temps en ligne</p>
              	<p><a class="btn btn-primary btn-large" href="../accueil/polyLog.jsp">Voir l'EDT</a></p>
              </center>
            </div>    
    