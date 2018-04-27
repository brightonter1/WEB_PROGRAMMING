<%-- 
    Document   : manageaccount
    Created on : Apr 21, 2018, 10:39:41 PM
    Author     : Brightonter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <sql:query dataSource="shoppingonline" var="member">
            SELECT * 
            FROM member
            WHERE username = '${sessionScope.username}'
        </sql:query>

        <c:forEach items="${member.rows}" var="i">

            <form action="ManageServlet.do" method="POST">
                <div class="container" id="container">
                    <div class="row" id="form-account">
                        <h3 class="display-1">Fuck U</h3>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Firstname</label>
                                <input type="text" class="form-control" name="fname" value="${i.fname}" required>
                            </div>

                            <div class="form-group">
                                <label>Date</label>
                                <input type="text" class="form-control" name="dob" value="${i.dob}" required>
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" value="${i.email}" required>
                            </div>

                        </div>

                        <div class="col-md-6"> 
                            <div class="form-group">
                                <label>Lastname</label>
                                <input type="text" class="form-control" name="lname" value="${i.lname}" required>
                            </div>

                            <div class="form-group">
                                <label>Mobile</label>
                                <input type="text" class="form-control" name="mobile" value="${i.mobile}" required>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <button type="submit" class="btn btn-success" name="btn" value="apply">Apply</button>
            </div>
        </form>
    </body>
</html>
