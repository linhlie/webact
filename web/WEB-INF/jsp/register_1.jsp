    <%-- 
    Document   : register
    Created on : Dec 2, 2018, 12:24:57 PM
    Author     : Lie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
</head>
<body>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form:form method="POST" modelAttribute="signupForm" action="signup.htm" class="register-form" id="register-form">
                            <div class="form-group"class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path ="username" type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group"class="wrap-input100 validate-input m-b-26" data-validate="Email is required">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <form:input path="email" type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group"class="wrap-input100 validate-input m-b-26" data-validate="Age is required">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path ="age" type="text" name="name" id="name" placeholder="Your Age"/>
                            </div>
                            <div class="form-group"class="wrap-input100 validate-input m-b-26" data-validate="Password is required">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <form:input path="password"type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath}/public/images/signup-image.jpg" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>