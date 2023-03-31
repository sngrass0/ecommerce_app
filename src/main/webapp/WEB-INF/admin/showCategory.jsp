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
    <title>${category.name}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
    <h1>${category.name}</h1>
    <form action="/categories/${id}" method="post">
        <h4>Add Product:</h4>				
        <select name="productId" id="productId" class="input">
            <c:forEach var="product" items="${unassignedProducts}">
                <option value="${product.id}">${product.name}</option>
            </c:forEach>
        </select>
        <input class="input" class="button" type="submit" value="Add"/>
    </form>
    <c:forEach var="item" items="${assignedProducts}">
        <div class="product-card">
            <a href="/products/${item.id}">
                <img src="/assets/photos/loona_1.png" alt="gallery item" width="300px">
            </a>
            <div class="mt-3">
                <h5>${item.name}</h5>
                <hr>
                <h5>
                    <fmt:formatNumber value = "${item.price}" type = "currency" currencySymbol="$"/>
                </h5>
            </div>
        </div>
    </c:forEach>
</body>
</html>