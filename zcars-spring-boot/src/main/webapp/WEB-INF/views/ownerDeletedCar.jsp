<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="CarModel" value="${deletedCar}" />
        <div align="center">
        <h1>Car -  <strong><c:out value= "${CarModel}"></c:out> </strong>Deleted By Owner!</h1>
        <a class = "btn btn-primary" href="<c:url value='/signOut'/>" >Click here to Sign Out!</a><br><br>
        </div>
    </body>
</html>
