<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@page import="Bean.Group" %>
<%@ page import="java.util.*" %>




<%
ArrayList<Group> rs = new ArrayList<Group>();
rs=manager.getIsr().recupSelectG();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Identification</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>

 <div class="hero-unit">
              <h1>Hello, world!</h1>
              <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
              <p><a class="btn btn-primary btn-large">Learn more</a></p>
            </div>    
    