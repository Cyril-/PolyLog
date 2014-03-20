<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>		
<script type='text/javascript' src='../bootstrap/js/fullcalendar.js'></script>
<link href="../bootstrap/css/fullcalendar.css" rel="stylesheet" media="screen">
<link href="../bootstrap/css/fullcalendar.print.css" rel="stylesheet" media="screen">

<script>
$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev today,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		theme: true,
		editable: false,
		events: [
					{
						id: 1,
						title: 'Aller sur Yriase.fr',
						start: new Date(y, m, 28,8,30),
						end: new Date(y, m, 28,11,45),
						allDay: false
					},
					{
						id: 2,
						title: 'Nourrir le chat !',
						start: new Date(y, m, 28, 8, 0),
						end: new Date(y, m, 28, 8, 45),
						allDay: false
					}
				],
			      backgroundColor: 'green',
			      borderColor: 'green',
			      textColor: 'yellow'
	});
	
});

</script>	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link type='text/css' href='../commun_page_menu/menu.css'	rel='stylesheet' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PolyLog</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
  </head>
    
    <body>  
    
<br></br>

<div class="span12 offset2" id="calendar">
</div>
  
  </body>
 

</html>