<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .container{
                text-align: center;
            }
            body{
/*                background-color: #008B8B;*/
            }
            .btn{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="loginHeaderSignOut.jsp"></jsp:include>
        <h3>Welcome<strong> ${user.username}!</strong></h3><br><br>
        <div class="container">
            <a href="http://localhost:8080/zcars/customerLanding"><button type="button" class="btn btn-warning">Search Cars</button></a>      
            <a href="http://localhost:8080/zcars/user/view-bookings"><button type="button" class="btn btn-warning">View Bookings</button></a><br><br>   
        </div>

    </body>
</html>
