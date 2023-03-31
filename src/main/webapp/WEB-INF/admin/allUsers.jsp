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
        <div class="overhead">
            <p>You are in Admin Mode </p>
        </div>
        <div class="header-actions">
            <div>
                <i class="bi bi-bookmark-fill" ></i>
                <span>Hey ${userName}</span>
            </div>
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
                <a href="/home">
                    <i class="bi bi-house"></i>
                </a>
            </c:if>
        </div>
        <div class="custom-form">
            <div class="top-header">
                <a href="/admin/dashboard">Go Back</a>
            </div>
            <table class="table user-table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">username</th>
                    <th scope="col">email</th>
                    <th scope="col">isAdmin</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="user"  items="${users}">
                        <tr>
                          <th scope="row">1</th>
                          <td>${user.userName}</td>
                          <td>${user.email}</td>
                          <td>${user.isAdmin}</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
        </div>
    <!-- Add Categories -->
</body>
</html>