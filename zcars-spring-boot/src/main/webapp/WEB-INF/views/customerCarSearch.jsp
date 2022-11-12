<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <jsp:include page="loginHeaderSignOut_1.jsp"></jsp:include>
        <%-- <div class="header">
            <form action="<c:url value='/zcars/user/search'/>" method="post">
                <h1>Find Rental Cars Near You</h1>
                <div class="form-box">

                    <strong>Which Model you are looking At ?:</strong>
                    <select name="carModel" id="carModel">
                        <c:forEach var="j" items="${cars}">
                            <option value="${j}">${j}</option>
                        </c:forEach>
                    </select>

                    <strong>What Type of Car ?:</strong>
                    <select name="carType" id="carType">
                        <option value="HatchBack">HatchBack</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="LUX">LUX</option>
                    </select>
                    <button class="search-btn" type="submit">Search</button>
                </div>
            </form>
        </div>
 --%>        
 
 		<div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Find the rental cars near you</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="<c:url value='/zcars/user/search'/>" method="post">
				<!-- to error: add class "has-danger" -->
				

                 <div class="form-group">
                 Choose the Car Model:
                 <select name="carModel" class="form-control form-control-sm" id="carModel">
                                         <c:forEach var="j" items="${cars}">
                            <option value="${j}">${j}</option>
                        </c:forEach> 
                  </select> 
                 </div>
                 <div class="form-group">
                 Choose the Car Type: 
                 <select name="carType" class="form-control form-control-sm"  id="carType">
                        <option value="HatchBack">HatchBack</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="LUX">LUX</option>
                    </select>
                    </div>
				<button type="submit" class="btn btn-primary btn-block">Search </button>
				
				
			</form>
		</div>
	</div>
</div>
</div>

    </body>
    <script>
        
    </script>
</html>
