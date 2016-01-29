<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Projet.jsp" %>
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
            Management des Patients
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Médecin</a></li>
            <li><a href="#">Gestion des Patients</a></li>
            <li class="active">Management des Patients</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Gestion des Patients</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                       <tr class='even'>
                          <th>code patient</th>
                          <th>Nom</th>
                          <th>Prénom</th>
                          <th>Adresse</th>
                          <th>Date d'entrée</th>
                          <th>Etat</th>
                          <th>Modifier </th>
                          <th>Supprimer </th>
                        </tr>
                     </thead>
                     <tbody>
                    <c:forEach items="${GestionForme.patients }" var="pat">
<tr>
<th>${pat.getCode_patient()}</th>
<th>${pat.getNom_patient()}</th>
<th>${pat.getPrenom_patient()}</th>
<th>${pat.getAddress_patient()}</th>
<th>${pat.getDate_entrée()}</th>
<th><a href="#${pat.getCode_patient()}" data-toggle="modal" data-target="#${pat.getCode_patient()}">visualiser</a></th>
<th><a href="#${pat.getCode_patient()}edi" data-toggle="modal" data-target="#${pat.getCode_patient()}edi">Modifier</a></th>
<th><a href="#${pat.getCode_patient()}del" data-toggle="modal" data-target="#${pat.getCode_patient()}del">Supprimer</a></th>
</tr>


<!-- Description d'état du patient -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${pat.getCode_patient()}">
<div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel">Description</h4>
  </div>
  <div class="modal-body"><p>${pat.getEtat().getDescription()}</p>
  </div>
</div>
</div>
</div>


<!-- Suppression des patients -->
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
  <f:form class="btn" modelAttribute="GestionForme" method="post" action="ManagementPatient">
  <button autofocus class="btn" name="confirmer">Confirm</button>
    <td><input type="text" name="code" hidden="true" class="user"  value="${pat.getCode_patient()}"/></td>
  </f:form>
  </div>
</div>
</div>
</div>


<%-- <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${pat.getCode_patient()}edi" > 

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
    </div> --%>
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
    <c:forEach items="${GestionForme.patients }" var="pat">
      <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="${pat.getCode_patient()}edi" >
        <!-- Content Header (Page header) -->
        <section class="content-header">
          
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Médecin</a></li>
            <li><a href="resp">Gestion Patient</a></li>
            <li class="active">Ajout des Patients</li>
          </ol>
        </section>
        <section class="content">
        
          <div class="row">
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Informations générales</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
          <f:form class="fiel" modelAttribute="GestionForme" method="post" action="ManagementPatient">
                    <!-- text input -->
                   
                   <div class="form-group">
                       		<input type="text" name="code" hidden="true" class="user"  value="${pat.getCode_patient()}" />
                   
                      <label>Nom</label>
                      <input type="text" name="nom" class="form-control" placeholder="Nom" value="${pat.getNom_patient()}" >
                    </div>
                    <div class="form-group">
                      <label>Prénom</label>
                      <input type="text" name="prenom"class="form-control" placeholder="Prénom" value="${pat.getPrenom_patient()}">
                    </div>
                    <div class="form-group">
                      <label>Adresse</label>
                      <input type="text" name="Adresse" class="form-control" placeholder="Adresse" value="${pat.getAddress_patient()}">
                    </div>
                     <div class="box-header with-border">
                  <h3 class="box-title">Informations sur la maladie</h3>
                </div><!-- /.box-header -->
                 <div class="form-group">
                      <label>Libellé</label>
                      <input type="text" name="libelle" class="form-control" placeholder="Libellé" value="${pat.getMaladie().getLibellé()}">
                    </div>

                    <!-- textarea -->
                    <div class="form-group">
                      <label>Désignation</label>
                      <textarea class="form-control" name="designation" rows="3" placeholder="Désignation">${pat.getMaladie().getDesignation()}</textarea>
                    </div>
                        <div class="box-header with-border">
                        <h3 class="box-title">L'état du Patient</h3>
                        </div><!-- /.box-header -->
                    <div class="form-group">
                      <label>Description</label>
                      <textarea class="form-control" name="description" rows="3" placeholder="Description" >${pat.getEtat().getDescription()}</textarea>
                    </div>

                    <!-- select -->
                    <div class="form-group">
                      <label>Region du Patient</label>
                      <select class="form-control" id="selectedItem">
                        <option value="Rabat salé">Rabat salé</option>
                        <option value="Tanger tetouan">Tanger tetouan</option>
                        <option value="Daraa Tafilalet">Daraa Tafilalet</option>
                        <option value="Fes Meknes">Fes Meknes</option>
                        <option value="Layoone">Layoone </option>
                      </select>
                <input type="text" name="selectedvalue" class="form-control"  value="${GestionForm.getSelected()}">
                      
                    </div>
                     <div class="send">
		             <form id="saveid"  action="ManagementPatient" >
	                  <button  class="btn btn-primary btn-lg" name="enregistrer" onclick="select()" type="submit" >Enregistrer</button>
	                  </form>
	                 <form action="/MedecinPatients/ManagementPatient" id="annulerid">
		              <input  class="btn btn-primary btn-lg"  type="submit"  value="Annuler"/>
	                   </form>
                      </div>
                </f:form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              </div>
              
                      
              </section>
              
                      
                      
              </div>
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