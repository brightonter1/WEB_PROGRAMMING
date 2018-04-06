<%-- 
    Document   : testtag
    Created on : Apr 6, 2018, 12:34:59 AM
    Author     : Brightonter
--%>
<%@tag description="Tag Name" pageEncoding="UTF-8"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>

<%-- any content can be specified here e.g.: --%>
<sql:query dataSource="ShoppingOnline" var="member">
            SELECT * 
            FROM member
        </sql:query>
        <c:forEach var="row" items="${member.rows}">
            <br>${row.username}
        </c:forEach>