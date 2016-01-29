<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/style.css"/>
    
    <!-- Custom CSS -->
   <%-- <link href="<%=request.getContextPath()%>/resources/css/modern-business.css" rel="stylesheet"> --%>
    <!-- Custom Fonts -->
    <%-- <link href="<%=request.getContextPath()%>/resources/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/"/>--%>
<title>Login</title>
   
</head>
<body>
 <form action="j_spring_security_check" method="post">
  
   
   <div class="container1">
    <div class="row">
        <div class="col">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                            Username</label>
                        <div class="col-sm-9">
                            <input type="text"  name="j_username" class="form-control" id="inputEmail3" placeholder="Username" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password"  name="j_password" class="form-control" id="inputPassword3" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                           
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                </div>
                
        </div>
    </div>
</div>
</div>


   
 </form>
</body>
</html>
