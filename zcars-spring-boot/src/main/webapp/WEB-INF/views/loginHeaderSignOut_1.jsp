<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }

            html {
                margin: 0;
                padding: 0;
            }
            body {
                margin: 0;
                padding: 0;
                background: url(/HomeToGo/resources/images/register2.jpg) no-repeat; 

                background-size: cover;
                color: black;
                font-family: "open sans";
                font-size: 20px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                background-color: white;
            }

            /*----------------NAVBAR------------*/
            header {
                display: flex;
                justify-content: space-between;
                color: #ffce14;
                background: #0f2453;
            }
            header div {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-family: "roboto";
                margin: 0 2rem;
            }
            header div i {
                font-size: 2rem;
                margin: 1rem;
            }
            header nav {
                padding: 1rem 1rem;
            }
            .title {
                display: flex;
                justify-content: space-between;
                color: #fff;
                background: #0f2453;
            }
            nav ul li {
                list-style: none;
                display: inline;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing:0px;
            }
            nav li a {
                padding: 1rem;
                margin: 1rem;
                text-decoration: none;
                color: white;
                transition: all 250ms ease-in;
            }
            nav li a:hover {
                background: #ffce14;
                color: black;
            }
            /*-------------TOP SECTION-------------*/
            .titles {
                color: white;
                text-align: center;
                width: 50vw;
                margin: 0 auto;
            }
            .titles h1 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
            }
            .titles p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;
                color: #ffce14;
            }
            /*-------------BOTTOM SECTION-----------*/
            .container-boxes {
                margin: 0 auto;
                padding-top: 100px;
                display: flex;
                justify-content: space-around;
                align-items: flex-end;
                max-width: 80vw;
            }
            .box {
                background: #ffce14;
                margin: 1rem;
                padding: 0.5rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 350px;
                max-height: 180px;
                min-height: 180px;
                transition: all 250ms ease-out;
            }
            .box:hover {
                background: rgba(255, 255, 255, 0.7);
                transform: translateY(-20%);
            }
            .box a {
                text-decoration: none;
                color: black;
            }
            .icon {
                font-size: 3rem;
                padding: 1rem;
            }
            .text h3 {
                text-transform: uppercase;
                letter-spacing: 4px;
                margin-bottom: 0;
                color: black;
            }
            .text p {
                margin-top: 1rem;
                line-height: 1.5rem;
                text-align: left;
            }
            .text {
                padding: 0.5rem;
            }


            @media (max-width: 1160px) {
                .icon {
                    font-size: 2rem;
                    padding: 0.5rem;
                }
                .text h3 {
                    text-transform: uppercase;
                    letter-spacing: 4px;
                    margin-bottom: 0;
                    font-size: 1rem;
                }
                .text p {
                    margin-top: 1rem;
                    line-height: 1.5rem;
                    text-align: left;
                    font-size: 0.8rem;
                }
                nav li a:hover {
                    background: none;
                    color: black;
                }
            }
            @media (max-width: 850px) {
                body {
                    height: 100%;
                }
                .container-boxes {
                    flex-direction: column;
                }
                .box:hover {
                    background: rgba(255, 255, 255, 0.7);
                    transform: none;
                }
                .titles h1 {
                    font-size: 3rem;
                }
            }


            /* Footer Section */
            .footer {
                background:#303036;
                color: #d3d3d3;
                height: 220px;
                position: relative;

            }

            .footer .footer-content {
                /* border: 1px solid red; */
                height: 182px;
                display: flex;
            }

            .footer .footer-content .footer-section {
                flex: 1;
                padding-left: 10px;

                /* border: 1px solid white; */
            }


            .footer .footer-bottom {
                background: #343a40;
                color: #686868;
                height: 30px;
                width: 100%;
                text-align: center;
                position: absolute;
                bottom: 0px;
                left: 0px;
                padding-top: 10px;


            }
            .firstpage{
                height: 90vh;
                margin: 0 auto;
                background: url(path);
                background-size: cover;
                background-position: center center;
                width: 100%;
            }

            .secondpage {
                color: white;
                text-align: center;
                height: 100vh;
                margin: 0 auto;
                background: url(path);
                background-size: cover;
                background-position: center center;
                width: 100%;
            }
            .secondpage h3 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;

            }
            .secondpage p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;

            }

            .thirdpage {
                color: white;
                text-align: center;
                height: 100vh;
                margin: 0 auto;
                background: url(images\\pexels-mick-haupt-5586121.jpg);
                background-size: cover;
                background-position: center center;
                width: 100%;
            }
            .thirdpage h3 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
            }
            .thirdpage p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;

            }




            /*---------About Section------------*/
            .aboutsection {
                color: white;
                text-align: center;
                width: 100vw;
                height: 51vw;
                margin: 0 auto;
                background-position: center center;
                background-size: cover;
            }
            .aboutsection h3 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
            }
            .aboutsection p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;
                /* padding: 2px 120px; */
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 2px;
                padding-bottom: 290px;
            }

            .aboutsection button {
                background-color: #4CAF50;
                color: black;
                font-size: 18px;  
                padding: 5px 15px;
                border: 2px solid #4CAF50;
            }

            .aboutsection button:hover {

                background-color: #4CAF50; /* Green */
                color: white;

            }



            .travelsection {
                color: white;
                text-align: center;
                height: 100vh;
                width: 82vw;
                margin: 0 auto;
                background-position: center center;
            }
            .travelsection h3 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
            }
            .travelsection p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 2px;
                padding-bottom: 250px;
            }


            .reviewsection {
                color: white;
                text-align: left;
                width: 100vw;
                height: 51vw;
                margin: 0 auto;
                background: #dee2e6;
                background: linear-gradient(124deg, #dee2e6 40%, #343a40 100%);
            }
            .reviewsection h3 {
                font-family: "roboto";
                font-size: 4rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
                text-align: center;
                padding-top: 60px;
            }
            .reviewsection p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;
                padding-top: 30px;
            }



            .partnersection {
                color: white;
                text-align: center;
                width: 100vw;
                height: 51vw;
                margin: 0 auto;
                background-position: center center;
                background-size: cover;
            }
            .partnersection h3 {
                font-family: "roboto";
                font-size: 5rem;
                margin-bottom: 0;
                text-shadow: 1px 1px 0 black;
                color: #ffce14;
            }
            .partnersection p {
                letter-spacing: 3px;
                text-shadow: 1px 1px 0 black;
                font-style: italic;
                font-size: 1.5rem;
                /* padding: 2px 120px; */
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 2px;
                padding-bottom: 50px;
                text-align: center;
            }

            .partnersection button {
                background-color: #4CAF50;
                color: black;
                font-size: 18px;  
                padding: 5px 15px;
                border: 2px solid #4CAF50;
            }

            .partnersection button:hover {

                background-color: #4CAF50; /* Green */
                color: white;

            }
            /*----------------------------------     Slider       ------------------------------*/

            html {
                box-sizing: border-box;
            }

            *,
            *::before,
            *::after {
                box-sizing: inherit;
            }

            .visually-hidden { 
                position: absolute !important;
                height: 1px; 
                width: 1px;
                overflow: hidden;
                clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
                clip: rect(1px, 1px, 1px, 1px);
                white-space: nowrap; /* added line */
            }

            .slider {
                position: relative;
                max-width: 900px;
                padding: 0 15px;
                margin: 30px auto;
            }

            .slider-list {
                display: flex;
                padding: 0;
                border: 5px solid gray;
                margin: 0;
                overflow: hidden;
                list-style-type: none;
            }

            .slider-item {
                display: none;
                width: 100%;
                flex-shrink: 0;
            }

            #slider-control-1:checked ~ .slider-list .slider-item:nth-child(1),
            #slider-control-2:checked ~ .slider-list .slider-item:nth-child(2) {
                display: block;
            }

            .slider-img {
                display: block;
                max-width: 100%;
                height: auto;
            }

            .slider-controls {
                position: absolute;
                bottom: 30px;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
            }

            .slider-controls label {
                width: 25px;
                height: 25px;
                margin: 0 5px;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.5);
                font-size: 0;
                cursor: pointer;
            }

            .slider-controls label:hover,
            #slider-control-1:checked ~ .slider-controls label:nth-child(1),
            #slider-control-2:checked ~ .slider-controls label:nth-child(2)
            {
                background-color: gray;
            }

            .footer-container {
                background-color: #242424;
                padding: 4rem 0 2rem 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .footer-subscription {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;

                margin-bottom: 24px;
                padding: 24px;
                color: #fff;
            }

            .footer-subscription > p {
                font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
                    'Lucida Sans', Arial, sans-serif;
            }

            .footer-subscription-heading {
                margin-bottom: 24px;
                font-size: 24px;
            }

            .footer-subscription-text {
                margin-bottom: 24px;
                font-size: 20px;
            }

            .footer-input {
                padding: 8px 20px;
                border-radius: 2px;
                margin-right: 10px;
                outline: none;
                border: none;
                font-size: 18px;
                margin-bottom: 16px;
                border: 1px solid #fff;
            }

            .footer-links {
                width: 100%;
                max-width: 1000px;
                display: flex;
                justify-content: center;
            }

            .footer-link-wrapper {
                display: flex;
            }

            .footer-link-items {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                margin: 16px;
                text-align: left;
                width: 160px;
                box-sizing: border-box;
            }

            .footer-link-items h2 {
                margin-bottom: 16px;
            }

            .footer-link-items > h2 {
                color: #fff;
            }

            .footer-link-items a {
                color: #fff;
                text-decoration: none;
                margin-bottom: 0.5rem;
            }

            .footer-link-items a:hover {
                color: #e9e9e9;
                transition: 0.3s ease-out;
            }

            .footer-email-form h2 {
                margin-bottom: 2rem;
            }

            .footer-input::placeholder {
                color: #b1b1b1;
            }

            /* Social Icons */
            .social-icon-link {
                color: #fff;
                font-size: 24px;
            }

            .social-media {
                max-width: 1000px;
                width: 100%;
            }

            .social-media-wrap {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 90%;
                max-width: 1000px;
                margin: 40px auto 0 auto;
            }

            .social-icons {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 240px;
            }

            .social-logo {
                color: #fff;
                justify-self: start;
                margin-left: 20px;
                cursor: pointer;
                text-decoration: none;
                font-size: 2rem;
                display: flex;
                align-items: center;
                margin-bottom: 16px;
            }

            .website-rights {
                color: #fff;
                margin-bottom: 16px;
            }

            @media screen and (max-width: 820px) {
                .footer-links {
                    padding-top: 2rem;
                }

                .footer-input {
                    width: 100%;
                }

                .btn {
                    width: 100%;
                }

                .footer-link-wrapper {
                    flex-direction: column;
                }

                .social-media-wrap {
                    flex-direction: column;
                }
            }

            @media screen and (max-width: 768px) {
            }
        </style>
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"

            crossorigin="anonymous"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,900&display=swap"
            rel="stylesheet"
            />
        <!--    <link rel="stylesheet" href="stylesheet.css" />-->

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <div>
                <i class="fas fa-home"></i>
                <p class="title">Zcars !</p>
            </div>
            <nav>
                <ul>
<!--                    <li><a href="http://localhost:8080/zcars/home">Home</a></li>-->
                    <li><a href="<c:url value='/signOut'/>">Sign out</a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>