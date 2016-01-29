<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang=''>
<head>
<!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/modern-business.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/resources/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/Utilisateur.css"/>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style.css"/>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/afficher_cacher_div.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/print.js"></script>
   <title> Gestion des Patients</title>
</head>
<body>
<ul>
<li class="deconnexion"><a href="<c:url value="/j_spring_security_logout" />"  > Déconnexion </a></li>
</ul>
<div id='cssmenu'>
<ul>
   <li class='active'><a href="#cible"  onclick="javascript:afficher_cacher('classpat');"><span>Consultation de dossier médical</span></a></li>
   <li ><a onclick="printinfo('classpat')" href='<c:url value= "/GestionUtilisateur"/>'><span>Impression</span></a></li>
</ul>
</div>

<div class="classpat"  >
<f:form modelAttribute="GestionForme" method="post" action="chargerPatient">
<table >
<tr >
<td id="id_code_pat" ><b>Code Patient  :</b></td>
<td id="id_in"><f:input path="code" class="form-control"/></td>
<td id="id_sub_recherche"><input type="submit" class="btn btn-primary" value="Recherche"></td>
</tr>
<tr>
<td><f:errors path="code"></f:errors></td>
</tr>
</table>
</f:form>
<c:if test="${not empty GestionForme.patient}">
<div class="div1" id="classpat">
<h4>Informations du patient</h4>
<table class="table1" >
<tr>
<td>Code Patient :</td>
<td>${GestionForme.patient.getCode_patient()}</td>
</tr>
<tr>
<td>Nom Patient :</td>
<td>${GestionForme.patient.getNom_patient()}</td>
</tr>

<tr>
<td>Prénom Patient :</td>
<td>${GestionForme.patient.getPrenom_patient()}</td>
</tr>
<tr>
<td>Adresse Patient :</td>
<td>${GestionForme.patient.getAddress_patient()}</td>
</tr>
</table>
<h4>Informations du médecin responsable du patient</h4>
<table class="table2">
<tr>
<td>ID medecin :</td>
<td>${GestionForme.patient.getMedecin().getCode_medecin()}</td>
</tr>
<tr>
<td>Nom medecin :</td>
<td>${GestionForme.patient.getMedecin().getNomMedecin()}</td>
</tr>
<tr>
<td>Prénom medecin :</td>
<td>${GestionForme.patient.getMedecin().getPrenomMedecin()}</td>
</tr>
</table>
<h4>Informations sur l'état du patient</h4>
<table class="table3">
<tr>
<td>description :</td>
<td>${GestionForme.patient.getEtat().getDescription()}</td>
</tr>
</table>
</div>
</c:if>
</div>
</body>
</html>