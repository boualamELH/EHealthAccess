<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo3.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>E-health Access</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=request.getContextPath()%>/resources/js/ie-emulation-modes-warning.js"></script>

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/css1/carousel.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" style="color: white;">E-Health Acces</a>
              <a class="navbar-brand" ><img id="logo" src="<%=request.getContextPath()%>/resources/images/logo3.png"></a>

            </div>
          
          </div>
        </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="<%=request.getContextPath()%>/resources/images/Patients.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 class="h12">Patients.</h1>
              <p class="p1">Tout patient a le droit d’être informé sur son état de santé. L’information doit lui être donnée tout au long de sa prise en charge. Le plus important n’est pas de rechercher la preuve parfaite pour justifier que l’information a bien été donnée mais de s’assurer que le patient a bien compris et assimilé les informations.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="<%=request.getContextPath()%>/resources/images/Medecins.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 class="h12">Médecins.</h1>
              <p class="p1">Elle permet aux médecins une bonne gestion des patients. Elle facilite l'accès au fiches des patients afin d'avoir une idée sur l'état du patient concerné.Cette application peut aussi ressencer le nombre de la population marocaine.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="<%=request.getContextPath()%>/resources/images/AdminPage.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 class="h12">Administrateur.</h1>
              <p class="p1">Elle permet aux administrateur de gérer les médecins privés ou publiques ainsi que d'avoir une vue globale sur l'état sanitaire de la population marocaine afin de prendre les décisions convenables.</p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/resources/images/Patienticon.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2><a style="text-decoration: none;" href="GestionPatient">Patient</a></h2>
          <p>Elle permet aux patients d’accéder en toute sécurité à l’intégralité des données saisies dans leurs dossiers médicale depuis une application web, mais aussi d"avoir la possibilité d'imprimer leurs fiche patient.</p>
          <p><a class="btn btn-primary " href="#" role="button">Plus de détails &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/resources/images/generaliste.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2><a style="text-decoration: none;" href="Medecin">Médecin</a></h2>
          <p>Elle permet aux médecins une bonne gestion des patients. Elle facilite l'accès au fiches des patients afin d'avoir une idée sur l'état du patient concerné.Cette application peut aussi ressencer le nombre de la population marocaine.</p>
          <p><a class="btn btn-primary " href="#" role="button">Plus de détails  &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="<%=request.getContextPath()%>/resources/images/admin3.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2><a style="text-decoration: none;" href="Admin">Administrateur</a></h2>
          <p>Elle permet aux administrateur de gérer les médecins privés ou publiques ainsi que d'avoir une vue globale sur l'état sanitaire de la population marocaine afin de prendre les décisions convenables.</p>
          <p><a class="btn btn-primary " href="#" role="button">Plus de détails  &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->



     

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="<%=request.getContextPath()%>/resources/js/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=request.getContextPath()%>/resources/js/ie10-viewport-bug-workaround.js"></script>
     <footer class="main-footer" id="footer">
              <div class="pull-right hidden-xs">
                  <b>Version</b> 1.0.0
               </div>
              <strong>Copyright &copy; 2015-2016 <a href="http://www.mincom.gov.ma">Ministère de la communication</a>.</strong> All rights reserved.
               </footer>
  </body>
</html>

