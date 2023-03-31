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
    <title>Document</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="overhead admin-overhead">
        <p>You are in Admin Mode </p>
    </div>
    <div class="custom-form">
        <div class="top-header">
            <h1>New Product</h1>
            <a href="/products/${product.id}">Go Back</a>
        </div>
        <form:form action="/products/${product.id}" method="post" modelAttribute="product" class="form-control">
            <input type="hidden" name="_method" value="put">
            <form:input path="categories" type="hidden"></form:input>

            <!-- Name -->
            <div class="form-group row my-3">
                <form:label path="name" class="col-sm-3 col-form-label align-text">Name:</form:label>
                <div class="col-sm-8">
                    <form:input path="name" class="form-control"/>
                    <form:errors path="name" class="text-danger"/>
                </div>
            </div>
            <div class="form-group row my-3">
                <div class="col-1">

                </div>
                <!-- Price -->
                <div class="col-5">
                    <div class="row">
                        <form:label path="price" class="col-sm-4 col-form-label align-text">Listing price:</form:label>
                        <div class="col-sm-8">
                            <form:input path="price" class="form-control"/>
                            <form:errors path="price" class="text-danger"/>
                        </div>
                    </div>
                </div>
                <!-- Stock -->
                <div class="col-5">
                    <div class="row">
                        <form:label path="stock" class="col-sm-3 col-form-label align-text">stock:</form:label>
                        <div class="col-sm-8">
                            <form:input path="stock" class="form-control" type="number"/>
                            <form:errors path="stock" class="text-danger"/>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Description -->
            <div class="form-group row my-3">
                <form:label path="description" class="col-sm-3 col-form-label align-text">Description:</form:label>
                <div class="col-sm-8">
                    <form:textarea path="description" cols="10" rows="5" class="form-control"></form:textarea>
                    <form:errors path="description" class="text-danger"/>
                </div>
            </div>
            
            <!-- Submit -->
            <div class="text-center">
                <a href="/products/${product.id}" class="btn btn-outline-dark mx-4">Cancel</a>
                <input type="submit" value="Submit" class="btn btn-dark">
            </div>
        </form:form>
    </div>
</body>
</html>