<%-- 
    Document   : home
    Created on : Apr 11, 2018, 9:49:32 PM
    Author     : Brightonter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .col-lg-4{
            width:33.3%;
            height:360px;
        }
    </style>
    <body>

        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-sm">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <select class="form-control">
                            <option>Category</option>
                            <option>Shirt</option>
                            <option>Pant</option>
                            <option>Hoodie</option>
                        </select>
                    </li>
                    <li>
                        <select class="form-control">
                            <option>Price</option>
                            <option>low - high</option>
                            <option>high - low</option>
                        </select>
                    </li>
                </ul>
            </nav>
        </div>

        <sql:query dataSource="shoppingonline" var="product">
            SELECT * FROM product
        </sql:query>


        <div class="container">
            <div class="row">
                <c:forEach items="${product.rows}" var="i">
                    <div class="card col-sm-6 col-md-4 col-lg-4">
                        <div class="card-wrapper">
                            <div class=card-img>
                                <img src="${i.image}" width="100%">
                            </div>
                            <div class="card-box">
                                <p><h4>${i.title}</h4></p>
                                <p>${i.description}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>       
            </div>
        </div>


    </body>
</html>
