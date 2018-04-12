<%-- 
    Document   : header
    Created on : Apr 11, 2018, 9:06:55 AM
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
    <style>

    </style>
    <body>
        <div class="header">
            <h1 class="display-1" align="center" >SUPREME</h1>
        </div>

        <nav class="navbar navbar-default" id="navbar" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>


                <script type="text/javascript">
                    <c:set var="message" value=""/>
                        var message = '<c:out value="${sessionScope.username}"/>';
                </script>
                
                 <sql:query dataSource="project" var="account">
                    SELECT * FROM member WHERE username = '${sessionScope.username}'
                </sql:query>

                <c:forEach items="${account.rows}" var="i">
                    <c:set var="username" value="${i.username}"/>
                </c:forEach>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <!--<li class="pull-left"><a href="#">Dashboard</a></li>-->
                        <li><a href="header.jsp">SUPREME</a></li>
                        <li><a href="login.jsp" id="login" >LOGIN</a></li>
                        <!--hidden-->
                        <li class="dropdown" id="AccountDropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyAccount: ${fn:toUpperCase(username)}
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="setting.jsp">SETTING</a></li>
                                <li><a href="#">ORDER HISTORY</a></li>
                                <li><a href="#">FAVORITE</a></li>
                                <li><a href="logoutServlet">LOGOUT</a></li>
                            </ul>
                        </li>
                        <!--hidden-->
                        <li><input type="text" class="form-control" name="word"></li>
                        <li><a href="#"><i class="fa fa-search"></i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-shopping-cart"><span class="badge">1</span></i></a></li>
                        <!--<li class="social pull-right"><a href="#">Social Links</a></li>-->
                    </ul>
                </div>
            </div>
        </nav>

        <script>
            window.onscroll = function () {
                myFunction()
            };

            var navbar = document.getElementById("navbar");
            var sticky = navbar.offsetTop;

            function myFunction() {
                if (window.pageYOffset >= sticky) {
                    navbar.classList.add("sticky")
                } else {
                    navbar.classList.remove("sticky");
                }
            }


            
            if (message === ""){
                document.getElementById('AccountDropdown').style.display = "none";
            }else{
                document.getElementById('login').style.display = "none";
            }
//            document.write(message);
        </script>







    </body>

</html>
