<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Citoyen.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/modern-business.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/resources/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/Utilisateur.css"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style.css"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/sweetalert.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/supprimer.css"/>
 
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style1.css"/>
   
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/afficher_cacher_div.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/print.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sweetalert.min.js"></script>

<title>Insert title here</title>
</head>
<body class="bodyclass" ng-app ng-init="afficher=false" ng-app ng-init="affichersup=false">
<div id='cssmenu1'>
<ul>
   <li class='active'><a href="#"  ><span>Gestion des patients</span></a>
      <ul>
       <li class='has-sub'><a href='#ajouter'><span>Ajout des patients</span></a>
         
         </li>
         <li class='has-sub'><a href="#cible" ng-click="afficher=true"><span>Management des patients</span></a>
         </li>
      </ul>
   </li>
   <li ><a onclick="afficher_cacher('classpat')" ><span>Gestion des citoyens</span></a>
   
    <ul>
       <li class='has-sub'><a href="#ajoutercit"><span>Ajout des citoyens</span></a>
         
         </li>
         <li class='has-sub'><a href="#supcit" ng-click="affichersup=true"><span>Supprimer des citoyens</span></a>
         </li>
      </ul>
   </li>
    <li class='active'><a href="#cible"  onclick="javascript:afficher_cacher('classpat');"><span>Statistiques des maladies au Maroc</span></a></li>
   <li ><a onclick="printinfo('classpat')" href='<c:url value= "/GestionUtilisateur"/>'><span>Impression des données</span></a></li>
</ul>
</div>


<!-- Afficher le tableau des patients -->


<div id="classpat"  class="classpat2" ng-show="afficher" >
<table class="table table-hover" >
<c:if test="${not empty GestionForme.patients}">
<tr>
<th>code patient</th><th>Nom</th><th>Prénom</th><th>Adresse</th><th>Date d'entrée</th><th>Etat</th>
<th>Modifier </th><th>Supprimer </th>
</tr>

<c:forEach items="${GestionForme.patients }" var="pat">

<tr>
<td>${pat.getCode_patient()}</td>

<td>${pat.getNom_patient()}</td>
<td>${pat.getPrenom_patient()}</td>
<td>${pat.getAddress_patient()}</td>
<td>${pat.getDate_entrée()}</td>
<td>${pat.getDate_entrée()}</td>
<td>${pat.getDate_entrée()}</td>
<td ><a href="#${pat.getCode_patient()}">visualiser</a></td>
<td ><a href="#${pat.getCode_patient()}edi">Modifier</a></td>
<td ><a href="#${pat.getCode_patient()}del" data-toggle="modal" data-target="#${pat.getCode_patient()}del">Supprimer</a></td>

<%-- onclick="javascript:afficher_cacher('${pat.getCode_patient()}del'); --%>
</tr>
<div class="test" id="${pat.getCode_patient()}">
<div class="modal-container">
<p>${pat.getEtat().getDescription()}</p>
<a href="#">close</a>
</div>
</div>
<!-- message de confirmation de la suppression -->
<%-- <div  class="confirm" id="${pat.getCode_patient()}del"> --%>
<!--   <h1>Confirm your action</h1> -->
<!--   <p>  Are you really <em>really</em> <strong>really</strong> sure that you want to exit this awesome application?</p> -->
  
<!--   <button>Cancel</button> -->
<!--   <button autofocus>Confirm</button> -->

<!-- </div> -->
<div  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${pat.getCode_patient()}del">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel">Confirm your action</h4>
  </div>
  <div class="modal-body"><p>  Are you really <em>really</em> <strong>really</strong>
   sure that you want to exit this awesome application?</p>
  </div>
  <div class="modal-footer"><button class="btn">Cancel</button>
  <f:form class="btn" modelAttribute="GestionForme" method="post" action="chargerMedecin">
  <button autofocus class="btn" name="confirmer">Confirm</button>
    <td><input type="text" name="code" hidden="true" class="user"  value="${pat.getCode_patient()}"/></td>
  </f:form>
  </div>
</div>
</div>
</div>
</c:forEach>
</c:if>
</table>
</div>
<!-- <ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
  <li><a href="#">Regular link</a></li>
  <li class="disabled"><a href="#">Disabled link</a></li>
  <li><a href="#">Another link</a></li>
</ul> -->

<!-- ajout des patients -->
<div class="contact" id="ajouter" ng-hide="afficher"> 

   <div class="contact-modal">
   
	<div class="contact-top">
		 <h2>Patient</h2>
    </div>
    
    <f:form class="fiel" modelAttribute="GestionForme" method="post" action="ajouterPatient">
		<input type="text" name="nom" class="user" value="Nom" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/>
		<input type="text" name="prenom" class="user" value="prenom" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/>
		<input type="text"  name="Adresse"class="email Address" value="Adresse" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
      <!-- <input type="text" name="ville" class="user" value="Ville" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/> -->
		<h2>Maladie</h2>
		<input type="text" name="libelle" class="user" value="Libellé" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/>
		<textarea class="text" name="designation" onfocus="this.value = '';"
      onblur="if (this.value == '') {this.value = 'Message';}"> Désignation</textarea>
      <h2>Etat</h2>
      <textarea class="text" name="description" onfocus="this.value = '';"
      onblur="if (this.value == '') {this.value = 'Message';}"> Description</textarea>
	   
	   <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button"   id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    Ville
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">Casa</a></li>
    <li><a href="#">Rabat</a></li>
    <li><a href="#">Marrakech</a></li>
    <li><a href="#">Tanger</a></li>
  </ul>
</div>
	    <div class="send">
		<form id="saveid" action="/MedecinPatients/chargerMedecin" >
		   <input   type="submit"  value="Enregistrer"/>
		  
	    </form>
	    <form action="/MedecinPatients/chargerMedecin" id="annulerid">
		   <input    type="submit"  value="Annuler"/>
	    </form>
	    </div>
	    </f:form>  
	  
   </div>
   
    </div>
    
    <!-- modifier des patients -->
    <c:forEach items="${GestionForme.patients }" var="pat">
    
<div class="contact" id="${pat.getCode_patient()}edi" > 

   <div class="contact-modal">
   
	<div class="contact-top">
		 <h2>Patient</h2>
    </div>
   
    <f:form class="fiel" modelAttribute="GestionForme" method="post" action="chargerMedecin" >
    		<input type="text" name="code" hidden="true" class="user"  value="${pat.getCode_patient()}" />
    
		<input type="text" name="nom" class="user" value="${pat.getNom_patient()}" 
		/>
		<input type="text" name="prenom" class="user" value="${pat.getPrenom_patient()}" />
		<input type="text"  name="Adresse"class="email Address" value="${pat.getAddress_patient()}" />

		<textarea class="text" name="description" 
    > ${pat.getEtat().getDescription()} </textarea>
	
	
	
	    <div class="send">
		<form id="saveid" action="/MedecinPatients/chargerMedecin" >
		   <input   type="submit" name="supprimer" value="Enregistrer"/>
		  
	    </form>
	    <form action="/MedecinPatients/chargerMedecin" id="annulerid">
		   <input    type="submit"  value="Annuler"/>
	    </form>
	    </div>
	    </f:form> 
	  
   
   </div>
    </div>
      </c:forEach>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
  $('a.delete').click(function() {
    var photoId = $(this).attr("data-photo-id");
    deletePhoto(photoId);
  });

  function deletePhoto(photoId) {
    swal({   title: "Are you sure?",   text: "You will not be able to recover this imaginary file!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   cancelButtonText: "No, cancel plx!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){   if (isConfirm) {     swal("Deleted!", "Your imaginary file has been deleted.", "success");   } else {     swal("Cancelled", "Your imaginary file is safe :)", "error");   } });
  }
  </script>
  
  
  
  
  <!-- ajout des citoyens -->
<div class="contact" id="ajoutercit" ng-hide="afficher"> 

   <div class="contact-modal">
   
	<div class="contact-top">
		 <h2>Citoyen</h2>
    </div>
    
    <f:form class="fiel" modelAttribute="GestionForme" method="post" action="ajouterCitoyen">
		<input type="text" name="nom" class="user" value="Nom" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/>
		<input type="text" name="prenom" class="user" value="prenom" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'User name';}"/>
		<input type="text"  name="Adresse"class="email Address" value="Adresse" onfocus="this.value = '';
		" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
       
	
		
	   
	   <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button"   id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    Ville
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">Casa</a></li>
    <li><a href="#">Rabat</a></li>
    <li><a href="#">Marrakech</a></li>
    <li><a href="#">Tanger</a></li>
  </ul>
</div>
	
	
	    <div class="send">
		<form id="saveid" action="/MedecinPatients/chargerMedecin" >
		   <input   type="submit"  value="Enregistrer"/>
		  
	    </form>
	    <form action="/MedecinPatients/chargerMedecin" id="annulerid">
		   <input    type="submit"  value="Annuler"/>
	    </form>
	    </div>
	    </f:form>  
	  
   </div>
   
    </div>
    
<!--     supprimer citoyen  -->
    <div id="supcit" ng-show="affichersup" >
    
    <f:form modelAttribute="GestionForme" method="post" action="chargerCitoyen">
<table >
<tr >
<td id="id_code_pat" ><b>Code Citoyen :</b></td>
<td id="id_in"><f:input path="code" class="form-control"/></td>
<td id="id_sub_recherche"><input type="submit" class="btn btn-primary" value="Recherche"></td>
</tr>
<tr>
<td><f:errors path="code"></f:errors></td>
</tr>
</table>
</f:form>
</div> 
   <div > 
   <c:if test="${not empty GestionForme.citoyen}">
<div class="div1" id="classpat">
<h4>Informations du citoyen</h4>
<table class="table1" >
<tr>
<td>Code Citoyen :</td>
<td>${GestionForme.citoyen.getCodeCitoyen()}</td>
</tr>
<tr>
<td>Nom citoyen :</td>
<td>${GestionForme.citoyen.getNomCitoyen()}</td>
</tr>

<tr>
<td>Prénom citoyen :</td>
<td>${GestionForme.citoyen.getPrénomCitoyen()}</td>
</tr>
<tr>
<td>Adresse citoyen :</td>
<td>${GestionForme.citoyen.getAdresse()}</td>
</tr>
</table>
<h4>Informations du médecin responsable du citoyen</h4>
<table class="table2">
<tr>
<td>ID medecin :</td>
<td>${GestionForme.citoyen.getMedecin().getCode_medecin()}</td>
</tr>
<tr>
<td>Nom medecin :</td>
<td>${GestionForme.citoyen.getMedecin().getNomMedecin()}</td>
</tr>
<tr>
<td>Prénom medecin :</td>
<td>${GestionForme.citoyen.getMedecin().getPrenomMedecin()}</td>
<td ><a href="#${GestionForme.citoyen.getCodeCitoyen()}" data-toggle="modal" data-target="#${GestionForme.citoyen.getCodeCitoyen()}">Supprimer</a></td>

</tr>
</table>

</div>
</c:if>
</div>
<!-- supprimer citoyen-->   

<div  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${GestionForme.citoyen.getCodeCitoyen()}">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel">Confirm your action</h4>
  </div>
  <div class="modal-body"><p>  Are you really <em>really</em> <strong>really</strong>
   sure that you want to exit this awesome application?</p>
  </div>
  <div class="modal-footer"><button class="btn">Cancel</button>
  <f:form class="btn" modelAttribute="GestionForme" method="post" action="chargerCitoyen">
  <button autofocus class="btn" name="confirmer">Confirm</button>
      <td><input type="text" name="code" hidden="true" class="user"  value="${GestionForme.citoyen.getCodeCitoyen()}"/></td>
  
  </f:form>
  </div>
</div>
</div>
</div> 
<div id="decnx" ng-show="afficher">
<ul>
<li class="deconnexion"><a href="<c:url value="/j_spring_security_logout" />"  > Déconnexion </a></li>
</ul>
</div>
</body>
</html>