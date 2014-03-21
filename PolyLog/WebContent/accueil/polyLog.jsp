<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>		
<script type='text/javascript' src='../bootstrap/js/fullcalendar.js'></script>
<link href="../bootstrap/css/fullcalendar.css" rel="stylesheet" media="screen">
<link href="../bootstrap/css/fullcalendar.print.css" rel="stylesheet" media="screen">
<link href="../bootstrap/css/jquery.ui.datepicker.css" rel="stylesheet" media="screen">
<%
if(manager.isIdentifie()){
%>
		<script>
$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();	
	$('#calendar').fullCalendar({
		header: {
			left: 'today prev,next',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		timeFormat: 'H(:mm)',
		theme: false,
		editable: false,
		height: 500,
		buttonText:
		{
		    today:    'Aurjourd"hui',
		    month:    'mois',
		    week:     'semaine',
		    day:      'jour'
		},
		monthNames:['Janvier', 'Fevier', 'Mars', 'Avril', 'Mai', 'Juin','Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
		dayNames:['Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'],
		titleFormat:{
		    month: 'MMMM yyyy',                             // September 2009
		    week: "MMMM d[ yyyy]{ '&#8212;'[ MMM] d yyyy}", // Sep 7 - 13 2009
		    day: 'dddd d MMMM yyyy',                  // Tuesday, Sep 8, 2009
		},
		events: [
					{
						id: 1,
						title: 'Anniversaire 80 ans Babau',
						start: '2014-03-20 8:30:00',
						end: '2014-03-20 15:45:00',
						allDay: false
					}, 
					{
						id: 2,
						title: 'Anniversaire 20 ans Le Prig',
						start: new Date(y, m, 28, 8, 0),
						end: new Date(y, m, 28, 8, 45),
						allDay: false
					}
				],
			      backgroundColor: 'green',
			      borderColor: 'green',
			      textColor: 'yellow',
			      dayClick: function(date, allDay, jsEvent, view) {
			    	  $('#calendar').fullCalendar( 'gotoDate',date );
			    	  $('#calendar').fullCalendar( 'changeView', "agendaDay" );
			      },
	});
});

</script>	
<%
}else{
%>

		<script>
$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();	
	$('#calendar').fullCalendar({
		header: {
			left: 'today prev,next',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		timeFormat: 'H(:mm)',
		theme: false,
		editable: false,
		height: 500,
		buttonText:
		{
		    today:    'Aurjourd"hui',
		    month:    'mois',
		    week:     'semaine',
		    day:      'jour'
		},
		monthNames:['Janvier', 'Fevier', 'Mars', 'Avril', 'Mai', 'Juin','Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
		monthNamesShort:['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin','Juil', 'Aout', 'Sept', 'Oct', 'Nov', 'Déc'],
		dayNames:['Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'],
		dayNamesShort:['Lun','Mar','Mer','Jeu','Ven','Sam','Dim'],
		titleFormat:{
		    month: 'MMMM yyyy',                             // September 2009
		    week: "MMMM d[ yyyy]{/[ MMM] d}", // Sep 7 - 13 2009
		    day: 'ddd d MMM',                  // Tuesday, Sep 8, 2009
		},
		events: [
					{
						id: 1,
						start: '2014-03-20 8:30:00',
						end: '2014-03-20 15:45:00',
						allDay: false
					}, 
					{
						id: 2,
						start: new Date(y, m, 28, 8, 0),
						end: new Date(y, m, 28, 9, 45),
						allDay: false
					}
				],
			      backgroundColor: 'green',
			      borderColor: 'green',
			      textColor: 'yellow',
			      dayClick: function(date, allDay, jsEvent, view) {
			    	  $('#calendar').fullCalendar( 'gotoDate',date );
			     	  $('#calendar').fullCalendar( 'changeView', "agendaDay" );
			      },
	});
});

</script>

<%
}
%>

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
    <hr></hr>
<div class="container">
<div class="span12" id="calendar">
</div>
</div>
  
<jsp:include page="../commun_page_menu/footer.jsp"></jsp:include> 