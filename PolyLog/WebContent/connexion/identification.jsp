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
	
	System.out.println(ident);
	System.out.println(pwd);
	if(manager.getBase().identification(ident,pwd)){
		ok = 1;
		alert=1;
		
	}else{
		alert=0;
	}
			
	
	if (ok == 1) {
	}
	response.getHeader("../accueil/accueil.jsp");
		
	
%>