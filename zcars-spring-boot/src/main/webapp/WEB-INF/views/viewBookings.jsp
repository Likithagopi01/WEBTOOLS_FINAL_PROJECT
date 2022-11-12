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
    </head>
    <body>
        <jsp:include page="loginHeaderSignOut.jsp"></jsp:include>

        <div align="center">
            <br />
            <h2>Hello <strong>${ownerName}</strong>! Below are your Confirmed Bookings !</h2>
            <br>
            <c:set var="contextPath" value="${pageContext.request.contextPath}" />
            <table class='login'>
                <tr>
                    <th>Booking_ID</th>
                    <th>Booked Car Model</th>
                    <th>Booked By User</th>
                    <th>Booked From</th>
                    <th>Booked To</th>
                </tr>

                <c:forEach var="j" items="${confirmedBookings}">  
                    <tr>
                        <td><c:out value="${j.bookingID}"/></td>
                        <td><c:out value="${j.carBooked}"/></td>
                        <td><c:out value="${j.bookedByUser}"/></td>
                        <td><c:out value="${j.startDate}"/></td>
                        <td><c:out value="${j.endDate}"/></td>
                    </tr>
                </c:forEach> 
            </table>
    </body>
</html>
