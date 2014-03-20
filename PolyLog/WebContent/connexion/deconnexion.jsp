<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />

<%	
			manager.setIdentifie(false);
			manager.setNom("");
			response.sendRedirect("../accueil/accueil.jsp");
%>
