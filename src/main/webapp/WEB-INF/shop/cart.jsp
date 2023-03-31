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
        <a href="">
            <i class="bi bi-cart"></i>
        </a>
        <c:if test="${!loggedIn}">
            <a href="/account/login">
                <i class="bi bi-person-circle"></i>
            </a>
        </c:if>
        <c:if test="${loggedIn}">
            <a href="/logout">
                <!-- <i class="bi bi-box-arrow-right"></i> -->
                <i class="bi bi-door-open-fill"></i>
            </a>
        </c:if>
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
                <a href="#">Categories</a>
                <a href="#">FAQ</a>
            </div>
        </div>
    </div>
    <!-- Page content -->
    <div class="content mb-5 cart">
        <c:choose>
            <c:when test="${cart == null || cart.size() == 0}">
                <h3>Cart is currently empty</h3>
                <a href="/home" class="btn btn-outline-dark">Continue Shopping</a>
            </c:when>
            <c:otherwise>
                <div class="cart-list">
                    <c:forEach var="item" items="${cart}" varStatus="loop">
                        <div class="card">
                            <div class="card-body">
                                <h2>${item.name}</h2>
                                <a href="/products/${loop.index}/removefromcart">Remove</a>
                            </div>
                        </div>
                    </c:forEach>
                    <p>
                        Total: 
                        <fmt:formatNumber value = "${total}" type = "currency" currencySymbol="$"/>
                    </p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <hr>
    <!-- Footer -->
    <div class="footer">
        <div class="copyright">
            <p>
                Stephanie Grasso © 2023. All rights reserved.
            </p>
            <p>
                <a href=""> something </a> | <a href=""> something </a> | <a href=""> something </a>
            </p>
        </div>
    </div>
</body>
</html>