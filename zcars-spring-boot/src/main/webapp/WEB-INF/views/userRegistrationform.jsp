<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User-Form</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"

            crossorigin="anonymous"
            />
        <link rel="manifest" href="favicon/site.webmanifest">
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
        <jsp:include page="header_2.jsp"></jsp:include>


        
         <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">User Registration form</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form:form modelAttribute="user">
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label>
					<form:input class="form-control form-control-sm" path="username" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<form:password class="form-control form-control-sm" path="password" />		
                 </div>
                 <div class="form-group">
                 Select the User Type: 
                 <form:select path="userRole">
                                        <form:option value="customer" label="Customer"/>  
                                        <form:option value="carOwner" label="Car Owner"/>   
                                    </form:select> 
                 </div>
				<button type="submit" class="btn btn-primary btn-block">Register</button>
				
				<div class="sign-up">
					Have an account?  <a href="http://localhost:8080/zcars/user/login">Sign In</a>
				</div>
			</form:form>
		</div>
	</div>
</div>
</div>
        
        

        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>

            $(document).ready(function () {

                // Validate User First name
                $('#errorMsgFName').hide();
                let usernameError = true;
                $('#firstName').keyup(function () {
                    validateUserFname();
                });

                function validateUserFname() {
                    let usernameValue = $('#firstName').val();
                    let fn = /^[a-zA-z]+$/;
                    if (fn.test(usernameValue)) {
                        $('#errorMsgFName').hide();
                        usernameError = true;
                        return true;
                    } else {
                        $('#errorMsgFName').show();
                        usernameError = false;
                        return false;
                    }
                }

                // Validate User Last name
                $('#errorMsgLName').hide();
                let usernameError2 = true;
                $('#lastName').keyup(function () {
                    validateUserLname();
                });

                function validateUserLname() {
                    let usernameValue = $('#lastName').val();
                    let ln = /^[a-zA-z]+$/;
                    if (ln.test(usernameValue)) {
                        $('#errorMsgLName').hide();
                        usernameError2 = true;
                        return true;
                    } else {
                        $('#errorMsgLName').show();
                        usernameError2 = false;
                        return false;
                    }
                }



                // Validate Email
                $('#errorMsgEmail').hide();
                const email =
                        document.getElementById('emailId');
                email.addEventListener('blur', () => {
                    let regex = /^([_\-\.0-9a-zA-Z]+)@([_\-\.0-9a-zA-Z]+)\.([a-zA-Z]){2,7}$/;
                    let s = email.value;
                    if (regex.test(s)) {
                        $('#errorMsgEmail').hide();
                        emailError = true;
                    } else {
                        $('#errorMsgEmail').show();
                        emailError = false;
                    }
                });


                //validate phone Number 
                var regExPhone =
                        $('#errorMsgPhone').hide();
                const phone =
                        document.getElementById('phoneNumber');
                phone.addEventListener('blur', () => {
                    let regex1 = /\d{3}-?\d{3}-\d{4}$/;
                    let ph = phone.value;
                    if (regex1.test(ph)) {
                        $('#errorMsgPhone').hide();
                        phoneError = true;
                    } else {
                        $('#errorMsgPhone').show();
                        phoneError = false;
                    }
                });


                //Validate Zip Code

                $('#errorMsgZip').hide();
                const zipCode = document.getElementById('zipcode');
                zipCode.addEventListener('blur', () => {
                    let regex2 = /(^\d{5}$)|(^\d{5}-\d{4}$)/;
                    let zp = zipCode.value;
                    if (regex2.test(zp)) {
                        $('#errorMsgZip').hide();
                        zipCodeError = true;
                    } else {
                        $('#errorMsgZip').show();
                        zipCodeError = false;
                    }
                });

                //validate comments section
                $('#errorMsgComments').hide();
                const commentsection = document.getElementById('comments');
                commentsection.addEventListener('blur', () => {
                    if (commentsection.value == '') {
                        $('#errorMsgComments').show();
                        commentsError = false;
                    } else {
                        $('#errorMsgComments').hide();
                        commentsError = true;
                    }
                });



                // Submitt button
                $('#submitID').click(function () {
                    if ((usernameError == true) &&
                            (zipCodeError == true) && (phoneError == true) &&
                            (usernameError2 == true) && (emailError == true) && (commentsError == true)) {
                        alert("You have successfully submitted your form !");
                        return true;
                    } else {
                        return false;
                    }
                });
            });

        </script>

    </body>
</html>

