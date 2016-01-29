<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="Projet.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/geochart.css"/>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/geochart.js"></script>
   


<title>E-Health Access</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<f:form  action="/jsonStat" method="POST" commandName="CMD">
<input type="hidden" value="myname" name="nom">

</f:form>
<div id="idline">
<a href="#idchart" data-toggle="modal" data-target="#idchart">visualiser</a>
</div>

<div class="content-wrapper" id="div2">
<select id="state"  hidden="true">
    
</select>
<div  id="chart_div1"></div>
<div class="div1" id="chart_div2"></div>
</div>


<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="idchart">
  
<%String s=(String)session.getAttribute("st"); %>
    <p><%System.out.println(s); %></p>
     <%String smal=(String)session.getAttribute("smal"); %>  
 <!-- LINE CHART -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Line Chart</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="line-chart" style="height: 300px;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
<div ng-app="app" ng-controller="LineCtrl">
              <canvas id="line" class="chart chart-line" chart-data="data"
  chart-labels="labels" chart-legend="true" chart-series="series"
  chart-click="onClick" >
</canvas> 
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
       <script src="<%=request.getContextPath()%>/resources/js/Chart.js"></script>
      
        
<script src="http://cdn.jsdelivr.net/angular.chartjs/latest/angular-chart.min.js"></script>
<script>
angular.module("app", ["chart.js"]).controller("LineCtrl", function ($scope,$http) {

	  $scope.labels = ["January", "February", "March", "April", "May", "June", "July","August","september","october","november","december"];
  $scope.series = <%=smal %>;
  
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