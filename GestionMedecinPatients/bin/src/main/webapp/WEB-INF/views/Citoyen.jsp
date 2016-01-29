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
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/Utilisateur.css"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style.css"/>
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style1.css"/>
   
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/afficher_cacher_div.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/print.js"></script>
<title>Gestion Citoyen</title>
</head>
<body>

<%-- <div class="contact" id="ajoutercit"> 

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
    </div> --%>
    
     



</body>
</html>