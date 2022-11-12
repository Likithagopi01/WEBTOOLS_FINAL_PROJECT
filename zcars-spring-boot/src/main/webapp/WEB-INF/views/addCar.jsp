<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
        <%
            String OwnerName = (String)session.getAttribute("OwnerName");
        %>
        <div align="center">
            <br />
            <h2>Please enter your Car details <strong><%=OwnerName%></strong>!</h2>
            <br>
            <form action="http://localhost:8080/zcars/car" method="post">
                <input type="hidden" name="authToken" id="authToken" value="">
                <table class="login">
                    <tr>
                        <td>Car Model*:</td>
                        <td><input name="carModel" size="50" required="required" /></td>
                    </tr>
                    <tr>
                        <td>Car Year*:</td>
                        <td><input type="text" name="carYear" size="20" required="required" /></td>
                    </tr>
                    <tr>
                        <td>Car Seats*:</td>
                        <td><input type="text" name="carSeats" size="20" required="required" /></td>
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
                   		</td>
                    </tr>
                    <tr>
                        <td>Car Cost*:</td>
                        <td><input type="text" name="carCost" size="20" required="required" /></td>
                    </tr>

                </table>
                <br/>
                <br>
                <center><input class="btn btn-primary"id="submitButton" type="submit" value="Register"/></center>
            </form>
        </div>
        <br>
        <br>
        <div align="center"  style="color: red; align:center; font-weight: bold;" > 
            <h3><u>NOTE:</u></h3>
            <h4> * All Car Registration are subject to approval from the Admin </h4>
        </div>
    </body>
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
</html>
