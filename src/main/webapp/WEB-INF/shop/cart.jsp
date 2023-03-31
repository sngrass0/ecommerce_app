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
    <div class="content mb-5">
        <c:choose>
            <c:when test="${cart == null || cart.size() == 0}">
                <div class="cart">
                    <h3>Cart is currently empty</h3>
                    <a href="/home" class="btn btn-outline-dark">Continue Shopping</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="cart-list">
                    <h2 class="has-dash">Cart</h2>
                    <c:forEach var="item" items="${cart}" varStatus="loop">
                        <div class="card cart-item">
                            <div class="card-body cart-item-body">
                                <div class="cart-item-info">
                                    <a href="/products/${item.id}">
                                        <img src="/assets/photos/loona_1.png" alt="artist icon" width="115px" style="border-radius: 5px;">
                                    </a>
                                    <div class="align-text-rev cart-item-name">
                                        <h2>${item.name}</h2>
                                        <div class="cart-action">
                                            <fmt:formatNumber value = "${item.price}" type = "currency" currencySymbol="$"/> x 1
                                            <a href="/products/${loop.index}/removefromcart">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <h4>
                        Total: 
                        <fmt:formatNumber value = "${total}" type = "currency" currencySymbol="$"/>
                    </h4>
                </div>
            </c:otherwise>
        </c:choose>
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