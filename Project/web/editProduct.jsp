<%-- 
    Document   : editProduct
    Created on : Apr 22, 2018, 12:13:49 AM
    Author     : Brightonter
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <sql:query dataSource="shoppingonline" var="products" >
            select * 
            from product pr
            where pr.p_id = ${param.edit}
        </sql:query>
        <c:forEach var="product" items="${products.rows}">
            <c:set var="p_id" value="${product.p_id}"></c:set>
            <c:set var="title" value="${product.title}"></c:set>
            <c:set var="description" value="${product.description}"></c:set>
            <c:set var="image" value="${product.image}"></c:set>
            <c:set var="cate_type" value="${product.cate_type}"></c:set>
        </c:forEach>
            
            
            
            <h1>Edit P_id [${p_id}]</h1>
            
        <form action = "UploadServlet.jsp" method = "post" enctype = "multipart/form-data">
            <button type="submit" class="btn btn-default" name="edit" value="${p_id}"><-EDIT-></button><br>
            title : <input type="text" name="title" value="${title}" size="100" /><br>
            description : <input type="text" name="description" value="${description}" size="100" /><br>
            cate_type : <input type="text" name="cate_type" value="${cate_type}" size="100" /><br>
            Image : <img src="${image}" width="300px"><br>
            <input type = "file" name = "file" size = "50"/>
            
        </form>
    </body>
</html>
