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
	
	ident=request.getParameter("ident");
	pwd=request.getParameter("pwd");
	if(manager.getServeur().connexion(ident, pwd)){
		manager.setIdentifie(true);
		manager.setNom(ident);
		ok = 1;
	}
	
	if (ok == 1) {
	}
	response.sendRedirect("../accueil/accueil.jsp");
		
	
%>