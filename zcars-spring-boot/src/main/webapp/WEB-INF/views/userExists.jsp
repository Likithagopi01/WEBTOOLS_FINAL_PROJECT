<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Authorization Error</title>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
</head>
<body>
	<div align="center">
		<h2>Username Alreay exists! Please try a different username!</h2>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
                <a class="btn btn-primary" href="http://localhost:8080/zcars/user/login">Go back to Login</a><br><br>
	</div>
</body>
</html>