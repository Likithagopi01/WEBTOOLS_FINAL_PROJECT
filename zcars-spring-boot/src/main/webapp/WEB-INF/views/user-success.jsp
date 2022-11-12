<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            body{
/*                background-color: #3cb371;*/
            }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>Successful User Registration!</h1>
            <h2>Hello, ${user.username}</h2>
            <a class = "btn btn-primary" href="http://localhost:8080/zcars/user/login" >Click here to login!</a><br><br>
        </div>        
    </body>
</html>
