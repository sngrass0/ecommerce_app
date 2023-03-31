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
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
        <!-- Header -->
        <div class="overhead admin-overhead">
            <p> Admin Mode </p>
        </div>
        <div class="custom-form">
            <div class="top-header">
                <a href="/admin/dashboard">
                    < Go Back
                </a>
                <a href="/products/new" class="btn btn-dark">+ Add</a>
            </div>
            <table class="table user-table table-hover">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">name</th>
                    <th scope="col">stock</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="product"  items="${products}">
                        <tr data-href="/products/${product.id}">
                          <th scope="row">${product.id}</th>
                          <td>${product.name}</td>
                          <td>${product.stock}</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
        </div>
    <!-- Add Categories -->
</body>
</html>