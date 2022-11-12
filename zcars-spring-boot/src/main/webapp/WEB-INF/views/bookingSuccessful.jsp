<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
        <h1>Booking successful</h1>
                    <form action="<c:url value='/zcars/user/${user.username}/emailConfirmation'/>" method="post">
                    
                <table class="sendEmail">
                   <strong>Send Confirmation Email ?</strong>
                   <br></br>
                   <input name="senderEmailId" type="text"> <input class="btn btn-primary"id="submitButton" type="submit" value="send email"/>
                   <br></br>
                
            </form>
             <br></br>
              <br></br>
        <a class = "btn btn-primary" href="<c:url value='/signOut'/>" >Click here to Sign Out!</a><br><br>
        </div>
    </body>
</html>
