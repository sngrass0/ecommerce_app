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
</head>
<body>
    <div class="overhead">
        <p>Sale! : Get 15% off your order using code <span class="discount">Love-Heart</span> </p>
    </div>
    <div class="shop-header">
        <div class="header-content">
            <h1>Grocery Mart~</h1>
            <div class="navigation">
                <a href="#">New</a>
                <a href="#">All</a>
                <a href="#">Contact</a>
                <a href="#">Cart</a>
            </div>
            <!-- <hr> -->
        </div>
    </div>
    
    <div class="content">
        <div class="banner">
            <span class="banner-txt">Welcome!</soan>
        </div>
        <div class="product-list">
    </div>
            <!-- <div class="shop-content mt-3">
                <h4>Whoops! Looks like we're still under construction.</h4>
            </div> -->
            <div class="product-card">
                <img src="/assets/photos/product_1_1.png" alt="" width="300px">
                <div class="mt-3">
                    <h5>Blue Bell Earrings</h5>
                    <hr>
                    <h5>$12.99</h5>
                </div>
            </div>
            <div class="product-card">
                <img src="/assets/photos/product_1_1.png" alt="" width="300px">
                <div class="mt-3">
                    <h5>Blue Bell Earrings</h5>
                    <hr>
                    <h5>$12.99</h5>
                </div>
            </div>
    </div>
</body>
</html>