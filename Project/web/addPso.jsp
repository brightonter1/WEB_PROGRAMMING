<%-- 
    Document   : addPso.jsp
    Created on : Apr 25, 2018, 6:07:08 PM
    Author     : Brightonter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <sql:query dataSource="shoppingonline" var="products">
            select * from product
            join product_color
            using (p_id)
            where p_id = ${param.p_id}
            and product_color_id = ${param.product_color_id}
        </sql:query>
        <c:forEach var="e" items="${products.rows}">
            p_id : ${e.p_id}<br>
            title : ${e.title}<br>
            category : ${e.cate_type}<br>
            color : ${e.color}<br>
            image : <img src="${e.image}" style="width: 100px">
            <c:set var="p_id" value="${param.p_id}"></c:set><br>
        </c:forEach>
        <sql:query dataSource="shoppingonline" var="size">
            select * from size
            where size not in (select size from pso where p_id = ${p_id} and product_color_id = ${param.product_color_id})
        </sql:query>
        <form action="AddPsoServlet" method="POST" >
            quantity : <input type="text" name="quantity" value="" size="50"  required=""/><br>
            size : <select name="size" required="">
                <c:forEach var="e_size" items="${size.rows}" >
                    <option value="${e_size.size}" >${e_size.size}</option>
                </c:forEach>
            </select><br>
            price : <input type="text" name="price" value="" size="50" required="" /><br>
            <input type="text" class="form-control" name="p_id" value="${param.p_id}" style="display:none;">
            <input type="text" class="form-control" name="product_color_id" value="${param.product_color_id}" style="display:none;">
            <button type="submit"  >Add Pso</button>
        </form>    
    </body>
</html>
