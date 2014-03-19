<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link type='text/css' href='../commun_page_menu/menu.css'	rel='stylesheet' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <title>PolyLog</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
  </head>
    
    <body>  
    
<br></br>

<div class="span12">
<iframe class="span12 offset1" src="https://www.google.com/calendar/embed?title=PolyLogAgenda&amp;showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=o71ggrtn7psip69jh6uud7fsg97i87io%40import.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe> 
  </div>
  </div> <!-- /span12 -->  
  
  </body>
 

</html>