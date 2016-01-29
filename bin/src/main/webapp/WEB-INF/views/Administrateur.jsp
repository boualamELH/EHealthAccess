<%@page import="org.springframework.ui.Model"%>
<%@page import="com.gestion.MedecinPatients.AdministrateurController"%>
<%@page import="com.gestion.MedecinPatients.models.GestionForme"%>
<%@page import="com.gestion.MedecinPatients.MedecinController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
   
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style.css"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/sweetalert.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/supprimer.css"/>
 
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style1.css"/>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/print.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sweetalert.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body class="bodyclass" ng-app ng-init="afficher=false">
 <div id='cssmenu1'>
<ul>
   <li class='active'><a href="#"  ><span>Gestion des médecins</span></a>
      <ul>
       <li class='has-sub'><a href='#ajouter'><span>Ajout des médecins</span></a>
         
         </li>
         <li class='has-sub'><a href="#cible"   ng-click="afficher=true"><span>Management des médecins</span></a>
         </li>
      </ul>
   </li>
    <li class='active'><a href="#cible"  onclick="javascript:afficher_cacher('classpat');"><span>Statistiques</span></a></li>
   <li ><a onclick="printinfo('classpat')" href='<c:url value= "/GestionUtilisateur"/>'><span>Impression des données</span></a></li>
</ul>
</div>
<div id="classpat"  class="classpat2">
<table class="table table-hover"  ng-show="afficher">
<c:if test="${not empty GestionForme.medecins}"><tr>
<th>code médecin</th><th>Nom</th><th>Prénom</th><th>Lieu de travail</th><th>Spécialité</th>
<c:if test="${GestionForme.typemedecin=='privé' }">
<th>Nom clinique</th>
<th>Adresse clinique</th>
</c:if>
<c:if test="${GestionForme.typemedecin=='public' }">
<th>Nom hopitale</th>
<th>Adresse hopitale</th>
</c:if>

<th>Modifier </th><th>Supprimer </th>

</tr>

<c:forEach items="${GestionForme.medecins }" var="med">

<tr>
<td>${med.getCode_medecin()}</td>
<td>${med.getNomMedecin()}</td>

<td>${med.getPrenomMedecin()}</td>
<td>${med.getLieu_travail()}</td>
<td>${med.getSpecialité_Medecin()}</td>
<c:if test="${med.getClass().getSimpleName()=='MédecinPrivé' }">

<td>${med.getNom_clinique()}</td>
<td>${med.getAdresse_clinique()}</td>
</c:if>
<c:if test="${med.getClass().getSimpleName()=='MédecinPublic' }">

<td>${med.getNom_Hopitale()}</td>
<td>${med.getAdresse_Hopitale()}</td>
</c:if>

<td ><a href="#${med.getCode_medecin()}edi">Modifier</a></td>
<td  ><a href="#${med.getCode_medecin()}del"  class="delete"  >Supprimer</a></td>
</tr>

<div  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${med.getCode_medecin()}del">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
 
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel">Confirm your action</h4>
  </div>
  <div class="modal-body"><p>  Are you really <em>really</em> <strong>really</strong> sure that you want to exit this awesome application?</p>
  </div>
  <div class="modal-footer"><button class="btn">Cancel</button>
  <button autofocus class="btn">Confirm</button>
  </div>
</div>
</div>
</div>
</c:forEach>
</c:if> 
</table>
</div>


<%-- <div class="contact" id="ajouter"> 

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

		<textarea class="text" name="description" onfocus="this.value = '';"
      onblur="if (this.value == '') {this.value = 'Message';}"> Description </textarea>
	
	
	
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
    --%>
      
<script>
  $('a.delete').click(function() {
    var photoId = $(this).attr("data-photo-id");
    deletePhoto(photoId);
  });

  function deletePhoto(photoId) {
    swal({   title: "Are you sure?",   text: "You will not be able to recover this imaginary file!",
           type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
              confirmButtonText: "Yes, delete it!",   cancelButtonText: "No, cancel plx!", 
                closeOnConfirm: false,   closeOnCancel: false }, 
                function(isConfirm){   if (isConfirm) {     swal("Deleted!", "Your imaginary file has been deleted.", "success");   } 
                else {     swal("Cancelled", "Your imaginary file is safe :)", "error");   } });
  }
  </script>
</body>
</html>