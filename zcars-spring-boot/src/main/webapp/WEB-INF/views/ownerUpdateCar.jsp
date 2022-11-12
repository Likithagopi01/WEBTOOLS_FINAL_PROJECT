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
        <c:set var="CarInfo" value="${car}" />
        <c:set var="cid" value="${cid}" />
        <div align="center"> <h3>Here you can update the following Car's Details</h3></div>

        <div align="center">
            <br />
            <br>
            <form action="#" method="post">
                <input type="hidden" name="authToken" id="authToken" value="">
                <table class="login">
                    <tr>
                        <td>Car Model*:</td>
                        <td>
                            <input name="carModel" size="50" value="${CarInfo.carModel}" required="required" /></td>
                    </tr>
                    <tr>
                        <td>Car Type*:</td>
                        <td>                        
                        <select name="carType" id="carType">
                        <option value="HatchBack">HatchBack</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="LUX">LUX</option>
                    	</select>
                    </tr>
                    <tr>
                        <td>Car Cost*:</td>
                        <td><input type="text" name="carCost" size="20" value="${CarInfo.carCost}" required="required" /></td>
                    </tr>

                </table>
                <br/>
                <br>
                <center><input class="btn btn-primary"id="submitButton" type="submit" value="Update"/></center>
            </form>
        </div>
        <br>
        <br>
    </body>
</html>
