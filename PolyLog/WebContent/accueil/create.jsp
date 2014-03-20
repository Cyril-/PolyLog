<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="manager" 
	scope="session"
	class="manager.Manager" />
	
<%@ page import="java.util.*" %>

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
		    <legend>Informations du locataire</legend>
     		<div class="span3">
		    <label>Nom</label>
		    <input type="text" placeholder="Nom du locataire">
		    </div>
		    <label>Prénom</label>
		    <input type="text" placeholder="Prénom du locataire">
		    <div class="span3">
		    <label>Adresse</label>
		    <input type="text" placeholder="Adresse du locataire">
		    </div>
		    <label>Ville</label>
		    <input type="text" placeholder="Ville du locataire">
		    <div class="span3">
		    <label>Téléphone</label>
		    <input type="text" placeholder="Téléphone du locataire">
		    </div>
		    <legend>Informations sur l'événement</legend>
		    <div class="span3">
		     <label>Nom de l'événement</label>
		    <input type="text" placeholder="Nom de l'événement">
		    </div>
		     <label>Description</label>
		    <textarea rows="4" cols="50">Description de l'événement</textarea>
		    <div class="span3">
		     <label>Date</label>
		    <input type="text" placeholder="Date de l'événement">
		    </div>
			<label>Nombre de participants</label>
		    <input type="text" placeholder="Nombre de participants">
		    <div class="span3">
		    <label class="checkbox">
		    <input type="checkbox"> Evénement privé
		    </div><div class="span3">
		    <label>Prix</label>
		    <input type="text" placeholder="Prix de la location">
		    </div>
		    </label>
		    <legend>Informations sur l'assurance</legend>
		    <div class="span3">
		    <label>Agence d'assurance</label>
		    <input type="text" placeholder="Nom de l'agence d'assurance">
		    </div>
		    <label>Numéro de police d'assurance</label>
		    <input type="text" placeholder="Numéro de police d'assurance">
		    <div class="span3">
		    <label>Date de souscription</label>
		    <input type="text" placeholder="Date de souscription">
			</div><div class="span3">
		    <button type="submit" class="btn">Enregistrer</button>
		    </div>
		    </fieldset>
	    </form>
      
      </div>
      	<div class="span3">
      		<iframe src="https://www.google.com/calendar/embed?title=PolyLogAgenda&amp;showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=2&amp;hl=fr&amp;bgcolor=%23FFFFFF&amp;src=o71ggrtn7psip69jh6uud7fsg97i87io%40import.calendar.google.com&amp;color=%23B1365F&amp;ctz=Europe%2FParis" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe> 
		</div>
    </div>
  </div>

    