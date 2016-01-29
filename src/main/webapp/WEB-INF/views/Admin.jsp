<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="ProjetAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/resources/css1/carousel.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/resources/js/ie-emulation-modes-warning.js"></script>
    
    

<title>E-Health Access</title>
</head>
<body>
<div class="content-wrapper">
<div class="item">
          <img  class="third-slide" src="<%=request.getContextPath()%>/resources/images/AdminPage.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption" style="margin-left: 240px;">
              <h1 class="h12">Administrateur.</h1>
              <p class="p1">Elle permet aux administrateur de gérer les médecins privés ou publiques ainsi que d'avoir une vue globale sur l'état sanitaire de la population marocaine afin de prendre les décisions convenables.</p>
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
