<%-- 
    Document   : hello
    Created on : Mar 29, 2018, 10:03:13 AM
    Author     : LAB207_59
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Demo</title>
    </head>
    <body>

        <h1>JSP Demo</h1>

        <% String name = request.getParameter("name"); %>
        <% for (int i = 0; i < 10; i++) {%>
        Hello <%= name%> <br>
        <% }%>

    </body>
</html>
