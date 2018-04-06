<%-- 
    Document   : ggwp
    Created on : Apr 6, 2018, 1:18:32 AM
    Author     : Brightonter
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<sql:query dataSource="ShoppingOnline" var="member">
    SELECT *
    FROM member
</sql:query>
    
    <c:forEach var="row" items="${member.rows}">
        ${row.username}
    </c:forEach>