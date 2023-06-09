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
    <title>New Category</title>
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
    <div class="custom-form">
        <div class="top-header">
            <a href="/admin/dashboard">
                < Go Back
            </a>
        </div>
        <div class="page-title text-center mb-5">
            <h2>All Categories</h2>
        </div>
        <form:form action="/categories" method="post" modelAttribute="category" class="mt-3">
            <!-- Name -->
            <div class="form-group row my-3 justify-content-center">
                <form:label path="name" class="col-sm-1 col-form-label align-text">Name:</form:label>
                <div class="col-sm-6">
                    <form:input path="name" class="form-control cat-form"/>
                    <form:errors path="name" class="text-danger"/>
                </div>
                <div class="col-sm-2">
                    <input type="submit" value="Save" class="btn btn-dark">
                </div>
            </div>
            
            <!-- Submit -->
            <!-- <div class="text-center">
                <a href="/admin/dashboard" class="btn btn-outline-dark mx-4">Cancel</a>
            </div> -->
        </form:form>
        
        <table class="table user-table table-hover">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">category</th>
                <th scope="col"># products</th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="category"  items="${categories}">
                    <tr data-href="/categories/${category.id}">
                      <th scope="row">${category.id}</th>
                      <td>${category.name}</td>
                      <td>${category.products.size()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>