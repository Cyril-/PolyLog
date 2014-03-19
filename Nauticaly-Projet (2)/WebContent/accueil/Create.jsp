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
<br>

  <div class="span9">
    <div class="row">
      <div class="span6"></div>
      	<div class="span3">
      		<iframe src="https://www.google.com/calendar/embed?title=PolyLogAgenda&amp;showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=o71ggrtn7psip69jh6uud7fsg97i87io%40import.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe> 
		</div>
    </div>
  </div>

    