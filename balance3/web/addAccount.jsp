<%-- 
    Document   : addAccount
    Created on : Apr 5, 2018, 12:03:45 PM
    Author     : LAB207_59
--%>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.html" %>
        <h1>Add New Account</h1>
        <form action="addAccount.jsp">
            Balance: <input type="text" name="balance" value="" />
            <input type="submit" value="Add" name="button"/>
        </form>
            
        <c:if test = "${param.button == 'Add' && param.balance != ''}" >
            Success!!
            <fmt:parseNumber var="balance" type="number" value="${param.balance}"/>
            <sql:update dataSource="member">
                INSERT INTO account (username, balance) VALUES ('${sessionScope.username}', ${param.balance});
            </sql:update>
        </c:if>
    
        
    </body>
</html>
