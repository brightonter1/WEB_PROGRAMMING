<%-- 
    Document   : helloTag
    Created on : Mar 29, 2018, 10:16:42 AM
    Author     : LAB207_59
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/MyTags" prefix="myTags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Demo</title>
    </head>
    <body>
        <h1>JSP Demo</h1>

        <myTags:NameTagHandler name="Chayut" />

    </body>
</html>
