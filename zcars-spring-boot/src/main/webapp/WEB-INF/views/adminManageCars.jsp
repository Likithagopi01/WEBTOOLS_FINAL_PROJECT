<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <style>
        .login {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
        }

        .login td, .allMenu th {
            border: 1px solid #960018;
            padding: 8px;
        }

        /* .login tr:nth-child(even){background-color: #f4efed;} */

        .login tr:hover {background-color: rgba(228,186,81,0.80);}

        .login th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #E4D9CD;
            color: #8b0000;
        }
    </style>
    <body>
        <jsp:include page="loginHeaderSignOut.jsp"></jsp:include>
        <h2>Welcome Admin!</h2>
        <div align="center">
            <h3>Approve or Deny the following requests from Car Owners who want to list on our application</h3>
            <c:set var="contextPath" value="${pageContext.request.contextPath}" />
            <table class='login'>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Type</th>
                    <th>Seats</th>
                    <th>Cost</th>
                    <th>Owned By</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="j" items="${cars}">  
                    <tr>
          				<td><c:out value="${j.carID}"/></td>
                        <td><c:out value="${j.carModel}"/></td>
                        <td><c:out value="${j.carYear}"/></td>
                        <td><c:out value="${j.carType}"/></td>
                        <td><c:out value="${j.carSeats}"/></td>
                        <td><c:out value="${j.carCost}"/></td>
                        <td><c:out value="${j.carOwner}"/></td>
                        <td><a href="<c:url value='/zcars/admin/${j.carID}/approveCar'/>"> <button type="button" class="btn btn-success">APPROVE</button></a>
                            <a href="<c:url value ='/zcars/admin/${j.carID}/rejectCar'/>"> <button type="button" class="btn btn-danger">REJECT</button></a></td>
                    </tr>
                </c:forEach> 
            </table>
        </div>
    </body>
</html>
