<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Projet.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/suppid.css"/>
   

<title>E-Health Access</title>
</head>
<body>
<!--     supprimer citoyen  -->
    <div class="content-wrapper" >
    <div id="suppid">
    <f:form modelAttribute="GestionForme" method="post" action="SupprimerCit">
<table >
<tr >
<td id="id_code_pat" ><b>Code Citoyen :</b></td>
<td id="id_in"><f:input path="code" class="form-control"/></td>
<td id="id_sub_recherche"><input type="submit"  class="btn btn-primary" value="Recherche"></td>
</tr>
<tr>
<td><f:errors path="code"></f:errors></td>
</tr>
</table>
</f:form>

   <c:if test="${not empty GestionForme.citoyen}">
<div class="div1" id="classpat">
<h2>Informations du citoyen</h2>
<table class="table1" >
<tr>
<th>Code Citoyen :</th>
<th>${GestionForme.citoyen.getCodeCitoyen()}</th>
</tr>
<tr>
<th>Nom citoyen :</th>
<th>${GestionForme.citoyen.getNomCitoyen()}</th>
</tr>

<tr>
<th>Prénom citoyen :</th>
<th>${GestionForme.citoyen.getPrénomCitoyen()}</th>
</tr>
<tr>
<th>Adresse citoyen :</th>
<th>${GestionForme.citoyen.getAdresse()}</th>
</tr>
</table>
<h2>Informations du médecin responsable du citoyen</h2>
<table class="table2">
<tr>
<th>ID medecin :</th>
<th>${GestionForme.citoyen.getMedecin().getCode_medecin()}</th>
</tr>
<tr>
<th>Nom medecin :</th>
<th>${GestionForme.citoyen.getMedecin().getNomMedecin()}</th>
</tr>
<tr>
<th>Prénom medecin :</th>
<th>${GestionForme.citoyen.getMedecin().getPrenomMedecin()}</th>
</tr>
</table>
<button class="btn-primary" data-toggle="modal" data-target="#idsupprimer" >Supprimer</button>

</div>
</div>
</c:if>
</div>
<!-- supprimer citoyen-->   

<div  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="idsupprimer">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel">Confirm your action</h4>
  </div>
  <div class="modal-body"><p>  Are you really <em>really</em> <strong>really</strong>
   sure that you want to exit this awesome application?</p>
  </div>
  
  
  <div class="modal-footer">
  <f:form class="btn" modelAttribute="GestionForme" method="post" action="SupprimerCit">
  <button autofocus class="btn" name="confirmer">Confirm</button>
      <td><input type="text" name="code" hidden="true" class="user"  value="${GestionForme.citoyen.getCodeCitoyen()}"/></td>
  
  </f:form>
  </div>
</div>
</div>
</div>

</body>
</html>