<%-- 
    Document   : updateAccount
    Created on : Apr 5, 2018, 2:23:29 PM
    Author     : Brightonter
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
        <!--Read username from session--> 
        <sql:query dataSource="member" var="account">
            SELECT * FROM account WHERE username = '${sessionScope.username}'
        </sql:query>
            
        <form action="updateAccount.jsp" method="POST">
            <h1>Update Account</h1>
            Account ID: 
                <Select name="acc_id">
                    <c:forEach var="row" items="${account.rows}">
                        <option value="${row.acc_id}">${row.acc_id}</option>
                    </c:forEach>
                </Select>
            Action :
            <select name="action">
                <option value="withdraw">Withdraw</option>
                <option value="deposit">Deposit</option>
            </select>
            <p>Amount : <input type="text" name="amout" value="" /></p>
            <input type="submit" value="update" name="button"/>
        </form>
            
            
            <!--Read Balance / amount input from User and Convert to int number--> 
            <sql:query dataSource="member" var="AccountPerUser">
                    SELECT balance FROM account WHERE acc_id = '${param.acc_id}'
            </sql:query>
                    
            <c:forEach var="row" items="${AccountPerUser.rows}">
                <tr>
                    <fmt:parseNumber var="balance" type="number" value="${row.balance}"/>
                </tr> 
            </c:forEach>  
            <fmt:parseNumber var="amount" type="number" value="${param.amout}"/>
            
            <!--Check Withdraw or Deposit-->
            <c:if test = "${param.button == 'update' && param.amout != ''}" >
                <c:if test = "${param.action == 'withdraw'}">
                    <sql:update dataSource="member">
                        UPDATE account
                        SET balance = ${balance}-${amount}
                        WHERE acc_id = ${param.acc_id}
                    </sql:update>
                </c:if>
                        
                <c:if test = "${param.action == 'deposit'}">
                    <sql:update dataSource="member">
                        UPDATE account
                        SET balance = ${balance}+${amount}
                        WHERE acc_id = ${param.acc_id}
                    </sql:update>
                </c:if>
                    <%
                        RequestDispatcher obj = request.getRequestDispatcher("process.jsp");
                        obj.forward(request, response);
                    %>
                    
            </c:if>
        
</html>
