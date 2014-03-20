<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@ page import="java.util.*" %>

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
			left: 'today prev,next',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
	    title: "Mon Agenda",
		theme: false,
		editable: false,
		height: 500,
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Réserver un créneau</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>
<br>

  <div class="span12">
    <div class="row">
      <div class="span6" id="formulaire">
      
      	<form action="../ConventionPDF">
		    <fieldset>
		    <legend>Informations du locataire</legend>
     		<div class="span3">
		    <label>Nom</label>
		    <input type="text">
		    </div>
		    <label>Prénom</label>
		    <input type="text">
		    <div class="span3">
		    <label>Adresse</label>
		    <input type="text">
		    </div>
		    <label>Ville</label>
		    <input type="text">
		    <div class="span3">
		    <label>Téléphone</label>
		    <input type="text">
		    </div>
		    <legend>Informations sur l'événement</legend>
		    <div class="span3">
		     <label>Nom de l'événement</label>
		    <input type="text">
		    </div>
		     <label>Description</label>
		    <textarea rows="4" cols="50" style="resize:none"></textarea>
		    <div class="span3">
		     <label>Date</label>
		    <input type="text">
		    </div>
			<label>Nombre de participants</label>
		    <input type="text">
		    <div class="span3">
		    <label class="checkbox">
		    <input type="checkbox"> Evénement privé
		    </div><div class="span3">
		    <label>Prix</label>
		    <input type="text">
		    </div>
		    </label>
		    <legend>Informations sur l'assurance</legend>
		    <div class="span3">
		    <label>Agence d'assurance</label>
		    <input type="text">
		    </div>
		    <label>Numéro de police d'assurance</label>
		    <input type="text">
		    <div class="span3">
		    <label>Date de souscription</label>
		    <input type="text">
			</div><div class="span3">
		    <button type="submit" class="btn">Réservation</button>
		    <button type="submit" class="btn">Pré-réservation</button>
		    </div>   
		    </fieldset>
	    </form>
      </div>
      
      
      	<div class="span3">
      		<div id="calendar">
      		</div>
		</div>
    </div>
  </div> <!--  span 12 -->
 
    