<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@ page import="java.util.*" %>


 <script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
	$( "#infoEve" ).slideUp();
	$( "#infoAss" ).slideUp();
	
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
	
	$( "#locataire" ).click(function() {
	$( "#infoEve" ).slideUp();
	$( "#infoAss" ).slideUp();
	$( "#infoLoc" ).slideDown();
	});
	
	$( "#evenement" ).click(function() {
		$( "#infoEve" ).slideDown();
		$( "#infoAss" ).slideUp();
		$( "#infoLoc" ).slideUp();
		});
	
	$( "#assurance" ).click(function() {
		$( "#infoEve" ).slideUp();
		$( "#infoAss" ).slideDown();
		$( "#infoLoc" ).slideUp();
		});
});

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Réserver un créneau</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>
<br>



  <div class="span12 offset1">

    <div class="container">
      <div class="span3" id="formulaire">
      
      	<form action="../ConventionPDF">
      	
		   <div id="locataire"><ul class="nav nav-tabs">Informations Locataire</ul></div>
		    
     		<div id="infoLoc" class="span3">

		    <label>Nom</label>
		    <input type="text" name="nom">
		    <label>Prénom</label>
		    <input type="text" name="prenom">
		    <label>Adresse</label>
		    <input type="text" name="adresse">
		    <label>Ville</label>
		    <input type="text" name="ville">
		    <label>Téléphone</label>
		    <input type="text" name="tel">

		     </div>
		    		    
		    		    
		    <div id="evenement"><ul class="nav nav-tabs">Informations Evénement</ul></div>

			<div id="infoEve" class="span3">
		    <label>Nom de l'événement</label>

		    <input type="text" name="nomEvent">
			<label>Description</label>
		    <textarea rows="4" cols="50" style="resize:none" name="desc"></textarea>
		    <label>Date</label>
		    <input type="text" name="date">
			<label>Nombre de participants</label>
		    <input type="text" name="nbPart">
		    <label class="checkbox">
		    <input type="checkbox" name="prive"> Evénement privé
		    </label>
		    <label>Prix</label>
		    <input type="text" name="prix">

		    </div>  
		    
		    <div id="assurance"><ul class="nav nav-tabs">Informations Assurance</a></div>
		    
		   	
		    <div id="infoAss" class="span3">

		    <label>Agence d'assurance</label>
		    <input type="text" name="nomAssur">
		    <label>Numéro de police d'assurance</label>
		    <input type="text" name="nbAssur">
		    <label>Date de souscription</label>
		    <input type="text" name="dateSous">
		    </div>
		    <button type="submit" class="btn">Réservation</button>
		    <button type="submit" class="btn">Pré-réservation</button>

		       
		    </fieldset>
	    </form>
      </div>
      
      
      	<div class="span8" id="calendar">
		</div>
    </div>
  </div> <!--  span 12 -->
 
    