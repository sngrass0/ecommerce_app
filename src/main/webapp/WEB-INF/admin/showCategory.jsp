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
    <div class="overhead admin-overhead">
        <p> Admin Mode </p>
    </div>
    <div class="custom-form-2">
        <div class="top-header">
            <a href="/admin/dashboard">
                < Go Back
            </a>
        </div>
        <div class="page-title text-center">
            <h2>${category.name}</h2>
        </div>
        <form action="/categories/${id}" method="post">
            <h4>Add Product:</h4>				
            <select name="productId" id="productId" class="input">
                <c:forEach var="product" items="${unassignedProducts}">
                    <option value="${product.id}">${product.name}</option>
                </c:forEach>
            </select>
            <input class="btn btn-dark btn-sm" type="submit" value="Add"/>
        </form>
        <br>
        <hr>
    </div>
    <div class="product-list">
        <c:forEach var="item" items="${assignedProducts}">
            <div class="product-card text-center">
                <a href="/products/${item.id}">
                    <img src="/assets/photos/loona_2.jpeg" alt="gallery item" width="250px">
                </a>
                <div class="mt-3">
                    <h5>${item.name}</h5>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>