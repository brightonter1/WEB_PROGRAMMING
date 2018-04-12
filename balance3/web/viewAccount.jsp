<%-- 
    Document   : viewAccount
    Created on : Apr 5, 2018, 10:56:52 AM
    Author     : LAB207_59
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
        
        <%@include file = "header.html" %>
        <sql:query var="account" dataSource="member">
            SELECT * FROM account WHERE username = '${sessionScope.username}';
        </sql:query>

            <h1>View Account</h1>
            <table border="1">
                    <tr bgcolor="orange">
                        <td>Acc_id</td>
                        <td>Username</td>
                        <td>Balance</td>
                    </tr>             
                        <c:forEach var="row" items="${account.rows}">
                        <tr>
                            <td>${row.acc_id}</td>
                            <td>${row.username}</td>
                            <td>${row.balance}</td>
                        </tr> 
                    </c:forEach>
                </table>
        </form>
            
            

    </body>
</html>
