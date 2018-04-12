<%-- 
    Document   : login
    Created on : Apr 11, 2018, 11:35:24 AM
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/css.css"/>
    </head>
    <style>

    </style>
    <body>
        <div class="container" style="text-align: center;">
            <ul class="nav nav-pills center-pills">
                <li class="active"><a data-toggle="pill" href="#login">LOGIN</a></li>
                <li><a data-toggle="pill" href="#register">REGISTER</a></li>
            </ul>

            <div class="tab-content"">
                <div id="login" class="tab-pane fade in active">
                    <h3>LOGIN</h3>
                    <div class="form-login">
                        <form action="login.jsp" method="POST">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" name="user"  required>
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="pwd"  required>
                            </div>
                            <button type="submit" class="btn btn-default" name="btn" value="login">Login</button>
                        </form>
                    </div>
                </div>

                <c:if test="${param.btn == 'login'}">
                    <sql:query dataSource="project" var="user">
                        SELECT * FROM user
                    </sql:query>

                    <c:forEach var="i" items="${user.rows}">
                        <c:if test="${param.user == i.username && param.pwd == i.password}">
                            <%
                                HttpSession sn = request.getSession();
                                sn.setAttribute("username", request.getParameter("user"));
                                response.sendRedirect("header.jsp");
                            %>
                            <%--<jsp:forward page="TEMPLATE/header.jsp"/>--%>
                        </c:if>
                        <c:if test="${param.user != i.username && param.pwd != i.password}">
                            Error
                        </c:if>

                    </c:forEach>
                </c:if>







                <div id="register" class="tab-pane fade">
                    <h3>REGISTER</h3>
                    <div class="form-login">
                        <form action="#register" method="POST">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" name="user" required>
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="pwd" required>
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <button type="submit" class="btn btn-default" name="regis" value="regis">Singup</button>
                        </form>
                    </div>
                </div>
                            <c:if test="${param.regis == 'regis'}">
                                <c:set var="state" value="0"/>
                                <sql:query dataSource="project" var="member">
                                    SELECT * FROM member
                                </sql:query>
                                <c:forEach items="${member.rows}" var="i">
                                    <c:if test="${i.username == param.user && i.email == param.email}">
                                        <c:set var="state" value="1"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${state == '0'}">
                                    <sql:update dataSource="project">
                                        INSERT INTO member (username, email)
                                        VALUES ('${param.user}', '${param.email}');
                                    </sql:update>
                                    <sql:update dataSource="project">
                                        INSERT INTO user 
                                        VALUES ('${param.user}', '${param.pwd}', 'member');
                                    </sql:update>
                                    Register Complete
                                </c:if>
                            </c:if>
            </div>
        </div>







    </body>
</html> 
