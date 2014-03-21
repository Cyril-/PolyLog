<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
    
<%


	int ok = -1;	
	int alert=-1;
	String ident = request.getParameter("ident");
	String pwd = request.getParameter("pwd");
	

	if(manager.getServeur().connexion(ident, pwd)){
		manager.setIdentifie(true);
		manager.setNom(ident);
		ok = 1;
	}
	
	if (ok == 1) {
	response.sendRedirect("../accueil/accueil.jsp");
	}	%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<title>Connexion</title>
	<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>

<body style="background-color: #f5f5f5;">
<br>
<div class="container">
<div class=" span4 offset4">
      <form class="form-signin" method="post" action="../connexion/identification.jsp">
        <h3 class="form-signin-heading">Connectez-vous</h3>
        <input type="text" name="ident" class="input-block-level" placeholder="Email">
        <input type="password" name="pwd"  class="input-block-level" placeholder="Password">
        <button class="btn btn-large btn-primary" type="submit">Connexion</button>
      </form>
      </div>

      </body>