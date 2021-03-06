<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@ page import="java.util.*" %>
<%@ page import="beans.Reservation" %>

<% System.out.println("CREATE "+manager.getReserv()); %>
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
		$( "#infoLoc" ).slideDown();
		$("#prixE").val("100");
		
		$("select").change(function () {
			var leSelect= $(this).val();
			if(leSelect==0)$("#prixE").val(100);
			if(leSelect==1)$("#prixE").val(100*0.80);
			if(leSelect==2)$("#prixE").val(100*0.75);
			if(leSelect==3)$("#prixE").val(100*1.25);
			if(leSelect==4)$("#prixE").val(100*0.50);
	        });
		
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
							title: 'Anniversaire 80 ans Nesonson',
							start: '2014-03-20 8:30:00',
							end: '2014-03-20 15:45:00',
							allDay: false,
							participant:100,
							description:" LE super anniversaireeeeeeeeeee du Nesonson",
							prix:32
						}, 
						{
							id: 2,
							title: 'Anniversaire 20 ans Le Prig',
							start: new Date(y, m, 28, 8, 0),
							end: new Date(y, m, 28, 9, 45),
							allDay: false,
							participant:200,
							description:" LE super anniversaireeeeeeeeeee du Prig",
							prix:'54'
						}
					],
				      backgroundColor: 'green',
				      borderColor: 'green',
				      textColor: 'yellow',
				      dayClick: function(date, allDay, jsEvent, view) {
				    	  $('#calendar').fullCalendar( 'gotoDate',date );
				     	  $('#calendar').fullCalendar( 'changeView', "agendaDay" );
				      },
				      eventClick: function(calEvent, jsEvent, view) {
				    	  var start = $.fullCalendar.formatDate(calEvent._start, 'dd.MM.yyyy HH:mm:ss');
				    	  var end = $.fullCalendar.formatDate(calEvent._end, 'dd.MM.yyyy HH:mm:ss');
				    	  $("#nameE").val(calEvent.title);
				    	  $("#participantE").val(calEvent.participant);
				    	  $("#descriptionE").val(calEvent.description);
				    	  $("#dateEE").val(start);
				    	  $("#dateES").val(end);
				    	  $("#prixE").val(prix);
				      },
				      
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
<hr>


    <div class="container offset1">
          	<div class="span7 " id="calendar">
		</div>
      <div class="span4" id="formulaire">
      
      	<form method="post" action="../BDD">
      	
		   <div id="locataire"><ul class="nav nav-tabs"> Informations Locataire </ul></div>
		    
     		<div id="infoLoc" class="span4">

		    <label>Nom</label>
		    <input type="text" name="nom">
		    <label>Prénom</label>
		    <input type="text" name="prenom">
		    <label>Type de locataire</label>
		    <select id="selectL">
		    <option value="0" selected>Selectionnez un type</option>
		    <option value="1" >Habitant de la commune</option>
		    <option value="2">Association</option>
		    <option value="3">Extérieur</option>
		    <option value="4">privée</option>
		    </select>
		    <label>Adresse</label>
		    <input type="text" name="adresse">
		    <label>Ville</label>
		    <input type="text" name="ville">
		    <label>Téléphone</label>
		    <input type="text" name="tel">

		     </div>	    
		    		    
		    <div id="evenement"><ul class="nav nav-tabs"> Informations Evènement </ul></div>

			<div id="infoEve" class="span4">
		    <label>Nom de l'événement</label>

		    <input type="text" id="nameE" name="nomEvent">
			<label>Description</label>
		    <textarea rows="4" cols="50" id="descriptionE" style="resize:none" name="desc"></textarea>
		    <label>Date Debut</label>
		    <input type="text" id="dateEE" name="dateDebut">
		    <label>Date Fin</label>
		    <input type="text" id="dateES" name="dateFin">
			<label>Nombre de participants</label>
		    <input type="text" id="participantE" name="nbPart">
		    <label>Prix</label>
		    <input type="text" id="prixE" name="prix">

		    </div>  
		    
		    <div id="assurance"><ul class="nav nav-tabs"> Informations Assurance </ul></div>
		    
		   	
		    <div id="infoAss" class="span4">

		    <label>Agence d'assurance</label>
		    <input type="text" name="nomAssur">
		    <label>Numéro de police d'assurance</label>
		    <input type="text" name="nbAssur">
		    <label>Date de souscription</label>
		    <input type="text" name="dateSous">
		    </div>
		    <label class="checkbox">
		    <input type="checkbox" name="prereservation"> Pré-réservation
		    </label>
		    <button type="submit" class="btn">Enregistrer</button>
		    <a href="../ConventionPDF" class="btn">Imprimer Convention</a>
	    </form>

	    <form method="post" action="../FacturePDF">
	    <button type="submit" class="btn">Imprimer Facture</button>
	    </form>
      </div>
      
      

    </div>
<!--  span 12 -->
  
  
 
    