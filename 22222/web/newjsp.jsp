<%-- 
    Document   : newjsp
    Created on : Apr 26, 2018, 12:06:21 AM
    Author     : Brightonter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:query dataSource="kuy" var="kuy">
            SELECT * FROM member
        </sql:query>
        <c:forEach items="${kuy.rows}" var="i">
            ${i.username}
        </c:forEach>
    </body>
</html>
