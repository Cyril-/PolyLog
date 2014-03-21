<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
<%
if(manager.isIdentifie()){	
%>
         <div class="footer">
        	 	<p>&copy; PolyLog 2014 </p>
     	 </div>
     

</html>
<%
}else{
%>
         <div class="footer">
    
        	 	<p><a href="../connexion/identification.jsp" style='text-align:center'>Connexion</a>   &copy; PolyLog 2014 </p>
     	 </div>
     

</html>
<%
}
%>    
