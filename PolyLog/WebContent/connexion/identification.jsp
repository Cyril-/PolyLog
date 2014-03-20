<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
    
<%


	int ok = -1;	
	int alert=-1;
	String ident = "";
	String pwd = "";
	

	if(manager.getServeur().connexion(ident, pwd)){
		manager.setIdentifie(true);
		manager.setNom(ident);
		ok = 1;
	}
	
	if (ok == 1) {
	response.sendRedirect("../accueil/accueil.jsp");
	}	%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<title>Réserver un créneau</title>
	<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>

        <form class="navbar-form pull-right" method="post" action="../connexion/identification.jsp">
          <input name="ident" class="span2" type="text" placeholder="Email">
          <input name="pwd" class="span2" type="password" placeholder="Password">
          <button type="submit" class="btn">Connexion</button>
        </form>
