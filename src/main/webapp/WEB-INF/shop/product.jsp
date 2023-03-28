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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <!-- header -->
    <div class="overhead">
        <p>Sale! : Get 15% off your order using code <span class="discount">Love-Heart</span> </p>
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
    <!-- end-headeer -->
    <div class="content">
        <div class="product-view">
            <div class="product-gallery">
                <img src="/assets/photos/scara_1.jpeg" alt="gallery item" width="600px">
            </div>
            <div class="product-info">
                <!-- Title -->
                <h1>
                    <c:out value="${product.name}"/>
                </h1>
                <!-- Price -->
                <span>
                    <fmt:formatNumber value = "${product.price}" type = "currency" currencyCode="USD"/>
                </span>
                <!-- Stock -->
                <span>
                    Stock: <c:out value="${product.stock}"/>
                </span>
                <!-- Description -->
                <pre>
                    <c:out value="${product.description}"/>
                </pre>
            </div>
        </div>
    </div>
</body>
</html>