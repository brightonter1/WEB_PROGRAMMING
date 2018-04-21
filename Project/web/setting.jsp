<%-- 
    Document   : setting
    Created on : Apr 12, 2018, 1:20:52 AM
    Author     : Brightonter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <sql:query dataSource="shoppingonline" var="member">
            SELECT * FROM member join member_address Using(username) WHERE username = '${sessionScope.username}'
        </sql:query>
        <c:forEach items="${member.rows}" var="i">
            <c:set var="dob" value="${i.dob}"/>
            <c:set var="fname" value="${i.first_name}"/>
            <c:set var="lname" value="${i.last_name}"/>
            <c:set var="email" value="${i.email}"/>
            <c:set var="mobile" value="${i.mobile}"/>
            <c:set var="addr" value="${i.address}"/>
            <c:set var="city" value="${i.city}"/>
            <c:set var="country" value="${i.country}"/>
            <c:set var="postcode" value="${i.postcode}"/>
        </c:forEach>
            <form action="SetServlet.do" method="POST">
            <div class="container" id="container">
                <div class="row" id="form-account">
                    <h3 class="display-1">Manager Account</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Firstname</label>
                            <input type="text" class="form-control" name="fname" value="${fname}" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" value="${email}" required>
                        </div>
                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" class="form-control" name="mobile" value="${mobile}" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Lastname</label>
                            <input type="text" class="form-control" name="lname" value="${lname}" required>
                        </div>

                        <div class="form-group">
                            <label>Date of Birth</label>
                            <input type="date" class="form-control" name="dob" value="${dob}" required>
                        </div>
                    </div>
                </div>


                <div class="row" id="form-account">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">Address</label>
                            <input type="text" class="form-control" name="address" value="${addr}" required>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" class="form-control" name="city" value="${city}" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Country</label>
                            <input type="text" class="form-control" name="country" value="${country}" required>
                        </div>

                        <div class="form-group">
                            <label>Postcode</label>
                            <input type="text" class="form-control" name="code" value="${postcode}" required>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success" name="btn" value="apply">Apply</button>
            </div>
        </form>
    </body>
</html>
