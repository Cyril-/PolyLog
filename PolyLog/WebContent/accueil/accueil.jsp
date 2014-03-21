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
<body>

 <div class="hero-unit"  style=" background-image:url(../images/salle.jpg);">
              <h1 style=" color:grey;">Mairie De Chamigny</h1>
              <center>
              	<p><h3>Vous voulez verifier si la salle est libre sans vous déplacer en Mairie ?</h3> alors regardez vite sur l'agenda en ligne</p>
              	<p><a class="btn btn-primary btn-large" href="../accueil/polyLog.jsp">Voir Agenda</a></p>
              </center>
                     <br>  
            </div>    

  </body>          
<jsp:include page="../commun_page_menu/footer.jsp"></jsp:include>