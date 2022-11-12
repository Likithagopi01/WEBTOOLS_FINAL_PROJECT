<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"

            crossorigin="anonymous"
            />
        <link rel="manifest" href="favicon/site.webmanifest">
        <!--        document.getElementById("authToken").value= $('#elementID').val();-->
        <style>
       
			html,body { 
	height: 100%; 
}

.global-container{
	height:100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

form{
	padding-top: 10px;
	font-size: 14px;
	margin-top: 30px;
}

.card-title{ font-weight:300; }

.btn{
	font-size: 14px;
	margin-top:20px;
}


.login-form{ 
	width:330px;
	margin:20px;
}

.sign-up{
	text-align:center;
	padding:20px 0 0;
}

.alert{
	margin-bottom:-30px;
	font-size: 13px;
	margin-top:20px;
}
        </style>
    </head>
    <body>
        <jsp:include page="header_1.jsp"></jsp:include>
                    
 <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Log in to ZCars</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="${contextPath}login" method="post">
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label>
                        <input name="username"  class="form-control form-control-sm" size="30" required="required" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control form-control-sm" name="password" size="30"
                                   required="required" />			
                 </div>
				<button type="submit" class="btn btn-primary btn-block">Sign in</button>
				
				<div class="sign-up">
					Don't have an account? <a href="http://localhost:8080/zcars/user/register">Register</a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
 
 
 
                
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
