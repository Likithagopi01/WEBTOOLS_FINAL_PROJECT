<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"

            crossorigin="anonymous"
            />
        <link rel="manifest" href="favicon/site.webmanifest">
        <title>JSP Page</title>
        <style>
            body{
                background-color: "#FFFAF0";
            }
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
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <jsp:include page="loginHeaderSignOut.jsp"></jsp:include>
        <div align="center">
            <br />
            <h2>Hello <strong>${ownerName}</strong>! Here you can Update/Delete your Properties !</h2>
            <br>
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
                        <td><a href="<c:url value='/zcars/carowner/${j.carID}/delete'/>"><i class="fa fa-trash text-danger" style="font-size: 30px;"></i></a>
                            <a href="<c:url value='/zcars/carowner/${j.carID}/update'/>"><i class="fa fa-pen-nib text-primary" style="font-size: 30px;"></i></a></td>
                    </tr>
                </c:forEach> 
            </table>
    </body>
</html>
