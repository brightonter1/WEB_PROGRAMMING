<%-- 
    Document   : NameTagFile
    Created on : Apr 6, 2018, 1:01:51 AM
    Author     : Brightonter
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@attribute name="name"%>
<c:forEach begin="1" end="10">
    Hello ${param.name} <br>
</c:forEach>
