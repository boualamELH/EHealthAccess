<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="ProjetAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-Health Access</title>
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- DataTables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css1/dataTables.bootstrap.css">
    
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
</head>
<body>
 <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div id="classpat1">
        <section class="content-header">
          <h1>
            Management des Médecins
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Médecin</a></li>
            <li><a href="#">Gestion des Médecins</a></li>
            <li class="active">Management des Patients</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Gestion des Médecins</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                       <tr class='even'>
                          <th>code Médecins</th>
                          <th>Nom</th>
                          <th>Prénom</th>
                          <th>Adresse</th>
                          <th>Date d'entrée</th>
                           <th>nom Hopital</th>
                          <th>Adresse Hopital</th>
                          <th>Modifier </th>
                          <th>Supprimer </th>
                        </tr>
                     </thead>
                     <tbody>
                    <c:forEach items="${GestionForme.medecins }" var="med">

<c:if test="${med.getClass().getSimpleName()=='MédecinPublic' }">

<tr>
<td>${med.getCode_medecin()}</td>
<td>${med.getNomMedecin()}</td>

<td>${med.getPrenomMedecin()}</td>
<td>${med.getLieu_travail()}</td>
<td>${med.getSpecialité_Medecin()}</td>

<td>${med.getNom_Hopitale()}</td>
<td>${med.getAdresse_Hopitale()}</td>


<th><a href="#${med.getCode_medecin()}edi" data-toggle="modal" data-target="#${med.getCode_medecin()}edi">Modifier</a></th>
<th><a href="#${med.getCode_medecin()}del" data-toggle="modal" data-target="#${med.getCode_medecin()}del">Supprimer</a></th>
</tr>






<!-- Suppression des patients -->
<div   class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${med.getCode_medecin()}del">
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
  <f:form class="btn" modelAttribute="GestionForme" method="post" action="ManagementMedecinsPublic">
  <button autofocus class="btn" name="confirmer">Confirm</button>
    <td><input type="text" name="code" hidden="true" class="user"  value="${med.getCode_medecin()}"/></td>
  </f:form>
  </div>
</div>
</div>
</div>
</c:if>

</c:forEach>
</tbody>

                    
           </table>
           </div><!-- /.box-body -->
           </div><!-- /.box -->

          
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
        </div>
      </div><!-- /.content-wrapper -->
      
    <!-- modifier patient -->
    <c:forEach items="${GestionForme.medecins }" var="med">
    <c:if test="${med.getClass().getSimpleName()=='MédecinPublic' }">
    
      <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${med.getCode_medecin()}edi" >
      <input name="codemedecin" hidden="true" value="${med.getCode_medecin()}">
      
        <!-- Content Header (Page header) -->
        <section class="content-header">
          
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Médecin</a></li>
            <li><a href="resp">Gestion Médecins</a></li>
            <li class="active">Modifier des Médecins</li>
          </ol>
        </section>
        <section class="content">
        
          <div class="row">
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Informations générales</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
          <f:form class="fiel" modelAttribute="GestionForme" method="post" action="ManagementMedecinsPublic">
                    <!-- text input -->
                   
                   <div class="form-group">
                       		<input type="text" name="code" hidden="true" class="user"  value="${med.getCode_medecin()}" />
                   
                      <label>Nom</label>
                      <input type="text" name="nom" class="form-control" placeholder="Nom" value="${med.getNomMedecin()}" >
                    </div>
                    <div class="form-group">
                      <label>Prénom</label>
                      <input type="text" name="prenom"class="form-control" placeholder="Prénom" value="${med.getPrenomMedecin()}">
                    </div>
                    <div class="form-group">
                      <label>Adresse</label>
                      <input type="text" name="Adresse" class="form-control" placeholder="Adresse" value="${med.getLieu_travail()}">
                    </div>
                    
                 <div class="form-group">
                      <label>Spécialité</label>
                      <input type="text" name="libelle" class="form-control" placeholder="Libellé" value="${med.getSpecialité_Medecin()}">
                    </div>

                    <!-- textarea -->
                    <div class="form-group">
                      <label>Nom Hopital</label>
                      <textarea class="form-control" name="designation" rows="3" placeholder="Désignation">${med.getNom_Hopitale()}</textarea>
                    </div>
                       
                    <div class="form-group">
                      <label>Adresse Hopital</label>
                      <textarea class="form-control" name="description" rows="3" placeholder="Description" >${med.getAdresse_Hopitale()}</textarea>
                    </div>

                    
                     <div class="send">
		             <form id="saveid"  action="ManagementMedecinsPublic" >
	                  <button  class="btn btn-primary btn-lg" name="enregistrer"  type="submit" >Enregistrer</button>
	                  </form>
	                 <form action="/MedecinPatients/ManagementMedecinsPublic" id="annulerid">
		              <input  class="btn btn-primary btn-lg"  type="submit"  value="Annuler"/>
	                   </form>
                      </div>
                </f:form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              </div>
              
                      
              </section>
              
                      
                      
              </div>
              </c:if>
      </c:forEach> 
      <script type="text/javascript">
      function select()
      {

    	  var select = document.getElementById('selectedItem');
    	     var jsonfile={json:JSON.stringify(select.options[select.selectedIndex].value)};
    	     $.ajax({  
  type:'POST',
  url:"/MedecinPatients/jsonvalue",
  data:jsonfile,
  dataType:"json"

        	     });
    	     
    	     };
      </script>
      
       <!-- jQuery 2.1.4 -->
    <script src="<%=request.getContextPath()%>/resources/js/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
     <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
     <!-- DataTables -->
    <%-- <script src="<%=request.getContextPath()%>/resources/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/dataTables.bootstrap.min.js"></script> --%>
    <!-- SlimScroll -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath()%>/resources/js/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/resources/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<%=request.getContextPath()%>/resources/js/demo.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
    <!-- page script -->
    <script>
      $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
      });
    </script>
       <footer class="main-footer" id="footer">
              <div class="pull-right hidden-xs">
                  <b>Version</b> 1.0.0
               </div>
              <strong>Copyright &copy; 2015-2016 <a href="http://www.mincom.gov.ma">Ministère de la communication</a>.</strong> All rights reserved.
               </footer>
</body>
</html>