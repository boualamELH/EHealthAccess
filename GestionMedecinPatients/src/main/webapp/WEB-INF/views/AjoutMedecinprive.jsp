<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="ProjetAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>E-Health Access</title>
</head>
<body>
<!-- ajout des Medecins -->

      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Nouveau M�decin priv�
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>M�decin</a></li>
            <li><a href="resp">Gestion Patient</a></li>
            <li class="active">Ajout des Patients</li>
          </ol>
        </section>
        <section class="content">
        
          <div class="row">
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Informations g�n�rales</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
          <f:form class="fiel" modelAttribute="GestionForme" method="post" action="AjoutMedecinprive">
                    <!-- text input -->
                    <div class="form-group">
                      <label>Nom</label>
                      <input type="text" name="nom" class="form-control" placeholder="Nom">
                    </div>
                    <div class="form-group">
                      <label>Pr�nom</label>
                      <input type="text" name="prenom"class="form-control" placeholder="Pr�nom">
                    </div>
                    <div class="form-group">
                      <label>Adresse</label>
                      <input type="text" name="Adresse" class="form-control" placeholder="Adresse">
                    </div>
                     <div class="box-header with-border">
                  <h3 class="box-title">Informations sur la maladie</h3>
                </div><!-- /.box-header -->
                 <div class="form-group">
                      <label>sp�cialit�</label>
                      <input type="text" name="libelle" class="form-control" placeholder="sp�cialit�">
                    </div>
                    <div class="form-group">
                      <label>nom clinique</label>
                      <input type="text" name="designation" class="form-control" placeholder="nom clinique">
                    </div>
                    <div class="form-group">
                      <label>Adresse clinique</label>
                      <input type="text" name="description" class="form-control" placeholder="Adresse clinique">
                    </div>

                       <table>
                    <tr>
                    <td>
                            
  		             <form id="saveid"  action="AjoutMedecinprive" >
		             <input style="margin-left: 400px;width: 120px;  " class="btn btn-primary btn-lg" name="confirmer" type="submit"  value="Enregistrer"/>
		  
	                  </form>
	                   </td>
	                  <td>
	                 <form action="/MedecinPatients/chargerMedecin" id="annulerid">
		              <input style="margin-left: 20px; text-align: center;width: 120px; " class="btn btn-primary btn-lg"  type="submit"  value="Annuler"/>
	                   </form>
                        </td>
	                   </tr>
	                   </table>                </f:form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              </div>
              
                      
              </section>
              
                      
                      
              </div>
              <footer class="main-footer" id="footer">
              <div class="pull-right hidden-xs">
                  <b>Version</b> 1.0.0
               </div>
              <strong>Copyright &copy; 2015-2016 <a href="http://www.mincom.gov.ma">Minist�re de la communication</a>.</strong> All rights reserved.
               </footer>
              
</body>
</html>