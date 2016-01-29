<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Projet.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-Health Access</title>
</head>
<body>
<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Nouveau Citoyen
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Médecin</a></li>
            <li><a href="resp">Gestion Citoyen</a></li>
            <li class="active">Ajout des Citoyens</li>
          </ol>
        </section>
        <section class="content">
        
          <div class="row">
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Informations générales</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
          <f:form class="fiel" modelAttribute="GestionForme" method="post" action="AjoutCitoyen">
                    <!-- text input -->
                    <div class="form-group">
                      <label>Nom</label>
                      <input type="text" name="nom" class="form-control" placeholder="Nom">
                    </div>
                    <div class="form-group">
                      <label>Prénom</label>
                      <input type="text" name="prenom"class="form-control" placeholder="Prénom">
                    </div>
                    <div class="form-group">
                      <label>Adresse</label>
                      <input type="text" name="Adresse" class="form-control" placeholder="Adresse">
                    </div>
                    
                     <div>
                     <table>
                     <tr>
                     <td>
		             <form   action="AjoutCitoyen" >
		             <input style="margin-left: 400px;width: 120px;  " class="btn btn-primary" name="confirmer" type="submit"  value="Enregistrer"/>
		  
	                  </form>
	                  </td>
	                   <td>
	                 <form  action="/MedecinPatients/chargerMedecin" id="annulerid">
		              <input style="margin-left: 20px; text-align: center;width: 120px; " class="btn btn-primary"  type="submit"  value="Annuler"/>
	                   </form>
	                   </td>
	                   </table>
                      </div>
                      
                </f:form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              </div>
              
                      
              </section>
              
                      
                      
              </div>
              <footer class="main-footer" id="footer">
              <div class="pull-right hidden-xs">
                  <b>Version</b> 1.0.0
               </div>
              <strong>Copyright &copy; 2015-2016 <a href="http://www.mincom.gov.ma">Ministère de la communication</a>.</strong> All rights reserved.
               </footer>
</body>
</html>