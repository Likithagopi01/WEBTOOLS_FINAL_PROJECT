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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
		  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
		  <script>
		  $( function() {
			    $( "#startdatepicker" ).datepicker({ minDate: 0 });
			  } );
			  $( function() {
			    $( "#enddatepicker" ).datepicker({ minDate: 1 });
			  } );
		  </script>
        <title>JSP Page</title>
    </head>
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
    <body>
<!--        <h3>Welcome<strong> ${user.username}!</strong></h3>-->
        <jsp:include page="loginHeaderSignOut.jsp"></jsp:include>
        <br><br>
        <div align="center">
            <h1>Confirm Booking Details</h1>
            <c:set var="CarInfo" value="${car}" />

            <form action="<c:url value='/zcars/user/${CarInfo.carID}/${user.username}/bookingSuccess'/>" method="post">
                <table class="login">
                    <tr>
                        <td>
                            Car Model:
                        </td>
                        <td>
                            <strong><c:out value="${CarInfo.carModel}"></c:out></strong><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Year:
                            </td>
                            <td>
                                <strong><c:out value="${CarInfo.carYear}"></c:out></strong><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Seats:
                            </td>
                            <td>
                                <strong><c:out value="${CarInfo.carSeats}"></c:out></strong><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Cost Per Day:
                            </td>
                            <td>
                                <strong><c:out value="${CarInfo.carCost}"></c:out></strong><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Owned By:
                            </td>
                            <td>
                                <strong><c:out value="${CarInfo.carOwner}"></c:out></strong><br>
                            </td>
                        </tr>
                    </table>

                    <br>
                    <br>

                    <strong>Which Date you are looking to Renting From ? <input name="startDate" type="text" id="startdatepicker"></strong>
                </select>
                <br><br>

                <strong>Which Date you are looking to Renting till ? <input name="endDate" type="text" id="enddatepicker"></strong>
                <br><br>
                <center><input class="btn btn-primary"id="submitButton" type="submit" value="Confirm"/></center>
            </form>
        </div>

    </body>
</html>
