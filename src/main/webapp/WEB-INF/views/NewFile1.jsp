<%@include file="Projet.jsp" %>

<!DOCTYPE html>
<%@page import="com.gestion.MedecinPatients.models.GestionForme"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Health Access</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Morris charts -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/morris.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/_all-skins.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/angular.chartjs/latest/angular-chart.css">
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-blue sidebar-mini" >
  <div class="content-wrapper" id="classpat1">
     
    <%String s=(String)session.getAttribute("st"); %>
    <p><%System.out.println(s); %></p>
     <%String smal=(String)session.getAttribute("smal"); %>
         <p><%System.out.println(smal); %></p>
     
  
 <!-- LINE CHART -->
              
<div ng-app="app" ng-controller="LineCtrl"  >
              <canvas id="line" class="chart chart-line" chart-data="data"
  chart-labels="labels" chart-legend="true" chart-series="series"
  chart-click="onClick" >
</canvas> 
</div>
</div>
 <!-- jQuery 2.1.4 -->
    <script src="<%=request.getContextPath()%>/resources/js/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/morris.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath()%>/resources/js/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/resources/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<%=request.getContextPath()%>/resources/js/demo.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/Chart.js"></script>
<script src="http://cdn.jsdelivr.net/angular.chartjs/latest/angular-chart.min.js"></script>
<script>
angular.module("app", ["chart.js"]).controller("LineCtrl", function ($scope,$http) {

	  $scope.labels = ["January", "February", "March", "April", "May", "June", "July","August","september","october","november","december"];
  $scope.series = [<%=smal %>];
  
  $scope.data= [<%=s %>];
  
  
  $http.get('http://localhost:8080/MedecinPatients/jsonStat').then(function(response){
      console.log(response.data);
  });
  $scope.onClick = function (points, evt) {
    console.log(points, evt);
  };
});
</script>


              
  </body>
</html>