<%-- 
    Document   : helloJSTL
    Created on : Mar 29, 2018, 10:06:12 AM
    Author     : LAB207_59
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Demo</title>
    </head>
    <body>
        <h1>JSP Demo</h1>
    <c:forEach begin="1" end="10">
        Hello ${param.name} <br>
    </c:forEach>
</body>
</html>
