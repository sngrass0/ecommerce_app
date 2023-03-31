<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!-- Header -->
    <div class="overhead">
        <p>Sale! : Get 15% off your order using code <span class="discount">Love-Heart</span> </p>
    </div>
    <div class="header-actions">
        <a href="">
            <i class="bi bi-search"></i>
        </a>
        <a href="/cart">
            <i class="bi bi-cart"></i>
        </a>
        <!-- logged in icons -->
        <c:choose>
            <c:when test="${loggedIn}">
                <a href="/logout">
                    <!-- <i class="bi bi-box-arrow-right"></i> -->
                    <i class="bi bi-door-open-fill"></i>
                </a>
            </c:when>

            <c:otherwise>
                <a href="/account/login">
                    <i class="bi bi-person-circle"></i>
                </a>
            </c:otherwise>
        </c:choose>
        <!-- Admin Dashboard -->
        <c:if test="${isAdmin}">
            <a href="/admin/dashboard">
                <i class="bi bi-gear"></i>
            </a>
        </c:if>
    </div>
    <div class="shop-header">
        <div class="header-content fade-in">
            <h1>✧･ﾟtani･ﾟ✧</h1>
            <div class="navigation">
                <a href="#">NEW</a>
                <a href="/home">All</a>
                <a href="#">
                    Categories
                    <i class="bi bi-caret-down col-form-label" style="font-size: .88em;"></i>
                </a>
                <a href="#">FAQ</a>
            </div>
        </div>
    </div>
    <!-- Page content -->
    <div class="about my-5 text-center">
        <img src="/assets/photos/icon.jpeg" alt="artist icon" width="225px" style="border-radius: 50%;">
        <h3 class="mt-3">Hey It's Tani!</h3>
        <p>⟡ ⟡ ⟡</p>
        <p class="about-text">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        </p>
    </div>
    <hr>
    <!-- Footer -->
    <div class="footer">
        <div class="copyright">
            <div class="socials mb-3">
                <a href="https://twitter.com/jellyflavor" class="fa fa-twitter"></a>
                <a href="https://twitter.com/jellyflavor" class="fa fa-instagram"></a>
                <a href="https://twitter.com/jellyflavor" class="fa fa-tumblr"></a>
            </div>
            <p>
                © 2023. All rights reserved.
            </p>
            <p>
                <a href=""> something </a> | <a href=""> something </a> | <a href=""> something </a>
            </p>
        </div>
    </div>
</body>
</html>