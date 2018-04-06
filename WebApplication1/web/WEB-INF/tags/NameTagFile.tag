<%-- 
    Document   : NameTagFile
    Created on : Mar 29, 2018, 10:09:08 AM
    Author     : LAB207_59
--%>

<%@tag description="Tag Name" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="name"%>
<c:forEach begin="1" end="10">
    Hello ${param.name} <br>
</c:forEach>
