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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/css.css"/>
    </head>
    <body>
        
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

        <div class="container">
            <div class="row">
                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class=card-img>
                            <img src="image/supreme4.jpg" width="100%">
                        </div>
                        <div class="card-box">
                            <p><h4>Hello</h4></p>
                            <p>Morbi ultricies tincidunt odio ut efficitur. Fusce suscipit ultricies metus, eu hendrerit massa pharetra eu. Learn more...</p>
                        </div>
                    </div>
                </div>
                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class=card-img>
                            <img src="image/supreme4.jpg" width="100%">
                        </div>
                        <div class="card-box">
                            <p><h4>Hello</h4></p>
                            <p>Morbi ultricies tincidunt odio ut efficitur. Fusce suscipit ultricies metus, eu hendrerit massa pharetra eu. Learn more...</p>
                        </div>
                    </div>
                </div>
                
                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class=card-img>
                            <img src="image/supreme4.jpg" width="100%">
                        </div>
                        <div class="card-box">
                            <p><h4>Hello</h4></p>
                            <p>Morbi ultricies tincidunt odio ut efficitur. Fusce suscipit ultricies metus, eu hendrerit massa pharetra eu. Learn more...</p>
                        </div>
                    </div>
                </div>
                </body>
                </html>
