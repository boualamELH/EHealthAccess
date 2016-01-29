<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="ProjetPatient.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/suppid1.css"/>
       <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/print.js"></script>
   

<title>E-Health Access</title>
</head>
<body>
<div class="div9 content-wrapper">
<div id="suppid">

<f:form modelAttribute="GestionForme" method="post" action="chargerPatient">
<table >
<tr >
<th id="id_code_pat" ><b>Code Patient  :</b></th>
<th id="id_in"><f:input path="code" placeholder="Search..." class="form-control"/></th>
<th id="id_sub_recherche"><input type="submit" class="btn btn-primary"  value="Recherche"></th>
</tr>
<tr>
<th><f:errors path="code"></f:errors></th>
</tr>
</table>
</f:form>
<div id="classpat1">
<c:if test="${not empty GestionForme.patient}">
<div  id="classpat">
<h2>Informations du patient</h2>
<table class="table1" >
<tr>
<th>Code Patient :</th>
<th>${GestionForme.patient.getCode_patient()}</th>
</tr>
<tr>
<th>Nom Patient :</th>
<th>${GestionForme.patient.getNom_patient()}</th>
</tr>

<tr>
<th>Prénom Patient :</th>
<th>${GestionForme.patient.getPrenom_patient()}</th>
</tr>
<tr>
<th>Adresse Patient :</th>
<th>${GestionForme.patient.getAddress_patient()}</th>
</tr>
</table>
<h2>Informations du médecin responsable du patient</h2>
<table class="table1">
<tr>
<th>ID medecin :</th>
<th>${GestionForme.patient.getMedecin().getCode_medecin()}</th>
</tr>
<tr>
<th>Nom medecin :</th>
<th>${GestionForme.patient.getMedecin().getNomMedecin()}</th>
</tr>
<tr>
<th>Prénom medecin :</th>
<th>${GestionForme.patient.getMedecin().getPrenomMedecin()}</th>
</tr>
</table>
<h2>Informations sur l'état du patient</h2>
<table class="table1">
<tr>
<th>description :</th>
<th>${GestionForme.patient.getEtat().getDescription()}</th>
</tr>
</table>
</div>
</c:if>
</div>
</div>
</div>
<footer class="main-footer" id="footer">
              <div class="pull-right hidden-xs">
                  <b>Version</b> 1.0.0
               </div>
              <strong>Copyright &copy; 2015-2016 <a href="http://www.mincom.gov.ma">Ministère de la communication</a>.</strong> All rights reserved.
               </footer>
</body>
</html>