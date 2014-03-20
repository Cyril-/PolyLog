<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<<<<<<< HEAD
=======
<%@ page import="java.util.*" %>

>>>>>>> FETCH_HEAD
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Réserver un créneau</title>
<jsp:include page="../commun_page_menu/menu.jsp"></jsp:include>
</head>
<br>

  <div class="span9">
    <div class="row">
      <div class="span6">
      
      	<form>
		    <fieldset>
		    <legend>Nouvelle réservation</legend>
		    <label>Nom</label>
		    <input type="text" placeholder="Nom du locataire">
		    <label>Prénom</label>
		    <input type="text" placeholder="Prénom du locataire">
		    <label>Adresse</label>
		    <input type="text" placeholder="Adresse du locataire">
		    <label>Téléphone</label>
		    <input type="text" placeholder="Téléphone du locataire">
		     <label>Nom de l'événement</label>
		    <input type="text" placeholder="Nom de l'événement">
		     <label>Description</label>
		    <textarea rows="4" cols="50">Description de l'événement</textarea> 
		     <label>Date</label>
		    <input type="text" placeholder="Date de l'événement">
		    <label class="checkbox">
		    <input type="checkbox"> Evénement privé
		    </label>
		    <label>Nombre de participants</label>
		    <input type="text" placeholder="Nombre de participants">
		    <label>Prix</label>
		    <input type="text" placeholder="Prix de la location">
		    <label>Agence d'assurance</label>
		    <input type="text" placeholder="Nom de l'agence d'assurance">
		    <label>Numéro de police d'assurance</label>
		    <input type="text" placeholder="Numéro de police d'assurance">
		    <label>Date de souscription</label>
		    <input type="text" placeholder="Date de souscription">

		    <button type="submit" class="btn">Submit</button>
		    </fieldset>
	    </form>
      
      </div>
      	<div class="span3">
      		<iframe src="https://www.google.com/calendar/embed?title=PolyLogAgenda&amp;showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=o71ggrtn7psip69jh6uud7fsg97i87io%40import.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe> 
		</div>
    </div>
  </div>

    