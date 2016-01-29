<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Projet.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/resources/css1/carousel.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/resources/js/ie-emulation-modes-warning.js"></script>
    
    

<title>E-Health Access</title>
</head>
<body>
<div >
<div class="item">
          <img class="second-slide" src="<%=request.getContextPath()%>/resources/images/Medecins.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption" style="margin-left: 250px;">
              <h1 class="h12">Médecins.</h1>
              <p class="p1">Elle permet aux médecins une bonne gestion des patients. Elle facilite l'accès au fiches des patients afin d'avoir une idée sur l'état du patient concerné.Cette application peut aussi ressencer le nombre de la population marocaine.</p>
            </div>
          </div>
        </div>
        </div>
        
         <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="<%=request.getContextPath()%>/resources/js/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=request.getContextPath()%>/resources/js/ie10-viewport-bug-workaround.js"></script>
    
</body>
</html>
