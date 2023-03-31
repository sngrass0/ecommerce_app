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
            <p>You are in Admin Mode </p>
        </div>
        <div class="header-actions">
            <div>
                <span>Hey, ${userName}</span>
            </div>

            <!-- logged in icons -->
            <c:choose>
                <c:when test="${loggedIn}">
                    <a href="/logout">
                        <i class="bi bi-box-arrow-right"></i>
                        <!-- <i class="bi bi-door-open-fill"></i> -->
                    </a>
                </c:when>

                <c:otherwise>
                    <a href="/account/login">
                        <i class="bi bi-person-circle"></i>
                    </a>
                </c:otherwise>
            </c:choose>

            <!-- admin icons -->
            <c:if test="${isAdmin}">
                <a href="/home">
                    <i class="bi bi-house"></i>
                </a>
            </c:if>
        </div>
        <!-- Content -->
        <div class="admin-dash text-center">
            <h2> < Admin Controls > </h2>
        </div>
        <div class="product-list text-center">
            <div class="card">
                <a href="/admin/users">
                    <div class="card-body">
                        <i class="bi bi-person" style="font-size: 2em;"></i>
                        <h4>
                            Users
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="/categories/new">
                    <div class="card-body">
                        <i class="bi bi-archive" style="font-size: 2em;"></i>
                        <h4>
                            Categories
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="/admin/products">
                    <div class="card-body">
                        <i class="bi bi-cart3" style="font-size: 2em;"></i>
                        <h4>
                            Products
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="/admin/orders">
                    <div class="card-body">
                        <i class="bi bi-box-seam" style="font-size: 2em;"></i>
                        <h4>
                            Orders
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="/admin/organize">
                    <div class="card-body">
                        <i class="bi bi-layers" style="font-size: 2em;"></i>
                        <h4>
                            Organize
                        </h4>
                    </div>
                </a>
            </div>
        </div>
    <!-- Add Categories -->
</body>
</html>