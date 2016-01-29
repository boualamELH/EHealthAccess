<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css1/index.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
<table class="buttons">
<tr>
<td>
<f:form modelAttribute="GestionForme" method="post" action="chargeradmin">
<input type="submit" class="Btn1" value="Administrateur" name="admin">
</f:form>
</td>
<td>
<f:form modelAttribute="GestionForme" method="post" action="chargerMedecin">
<input type="submit" value="Médecin" class="Btn2" name="medecin">
</f:form>
</td>
<td>
<f:form modelAttribute="GestionForme" method="post" action="GestionUtilisateur">
<input type="submit" value="Patient" class="Btn3" name="patient"> 
</f:form>
</td>
</tr>
</table>
</body>
</html>