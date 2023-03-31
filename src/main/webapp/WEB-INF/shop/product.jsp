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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!-- header -->
    <div class="overhead">
        <p>Sale! : Get 15% off your order using code <span class="discount">Love-Heart</span> </p>
    </div>
    <div class="header-actions">
        <a href="">
            <i class="bi bi-search"></i>
        </a>
        <a href="/cart">
            <i class="bi bi-cart"></i>
        </a>
        <c:if test="${!loggedIn}">
            <a href="/account/login">
                <i class="bi bi-person-circle"></i>
            </a>
        </c:if>
        <c:if test="${loggedIn}">
            <a href="/logout">
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
                <a href="/products/category/new">NEW</a>
                <a href="/home">All</a>
                <div class="dropdown">
                    <div onClick="myFunction()" class="dropbtn">
                        Categories
                        <i class="bi bi-caret-down col-form-label" style="font-size: .88em;"></i>
                    </div>
                    <div id="myDropdown" class="dropdown-content">
                        <a href="/products/category/prints">prints</a>
                        <a href="/products/category/stickers">stickers</a>
                        <a href="/products/category/pins">pins</a>
                    </div>
                </div>
                <a href="/about">FAQ</a>
            </div>
        </div>
    </div>
    <!-- end-headeer -->
    <div class="content">
        <div class="product-view">
            <div class="product-gallery fade-spec">
                <img src="/assets/photos/loona_2.jpeg" alt="gallery item" width="600px">
            </div>
            <div class="product-details">
                <!-- Product Info -->
                <div class="product-info">
                    <!-- Title -->
                    <h1 class="mb-4">
                        <c:out value="${product.name}"/>
                    </h1>
                    <!-- Price -->
                    <span>
                        <fmt:formatNumber value = "${product.price}" type = "currency" currencySymbol="$"/>
                    </span>
                    <!-- Add to Cart -->
                    <a href="/products/${product.id}/addtocart" class="btn btn-dark mx-3">Add to Cart</a>
                    <!-- Description -->
                    <p class="mt-2">
                        <c:out value="${product.description}"/>
                    </p>
                </div>
                <!-- Admin Actions -->
                <div class="product-actions">
                    <c:if test="${isAdmin}">
                        <!-- Stock -->
                        <p>
                            Stock: <c:out value="${product.stock}"/>
                        </p>

                        <div>
                            <!-- Edit -->
                            <a href="/products/${product.id}/edit" class="btn btn-outline-dark">edit</a>
                            <!-- Delete -->
                            <a href="" class="btn btn-dark">delete</a>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>
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