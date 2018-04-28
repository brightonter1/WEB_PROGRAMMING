<%-- 
    Document   : editPso
    Created on : Apr 26, 2018, 10:05:25 PM
    Author     : Brightonter
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:query var="selectedPso" dataSource="shoppingonline">
            select * 
            from product_color
            join pso
            using (p_id, product_color_id )
            where pso_id = '${param.pso_id}' 
            and p_id = '${param.p_id}'
            and product_color_id = '${param.product_color_id}'
        </sql:query>
        <form action="EditPsoServlet" method="POST">

            <c:forEach var="e_selected" items="${selectedPso.rows}">
                P_ID : ${param.pso_id}<br>
                color_id : ${param.p_id}<br>
                pso_id : ${param.product_color_id}<br>
                Image : <img src="${e_selected.image}" style="width: 200px"><br>
                quantity : <input type="text" name="quantity" value="${e_selected.quantity}" size="10" /><br>
                <sql:query var="selectedSize" dataSource="shoppingonline">
                    select * from size 
                    where size not in (select size from
                    pso
                    where  p_id = '${param.p_id}'
                    and product_color_id = '${param.product_color_id}')
                </sql:query>
                size : ${e_selected.size} --><select name="size">
                        <option value="${e_selected.size}">${e_selected.size}</option>

                    <c:forEach  var="i" items="${selectedSize.rows}">
                        <option value="${i.size}">${i.size}</option>

                    </c:forEach>
                </select><br>
                price : <input type="text" name="price" value="${e_selected.price}" size="10" /><br>
                <input type="text" name="p_id" value="${e_selected.p_id}" style="display:none;">
                <input type="text" name="pso_id" value="${e_selected.pso_id}" style="display:none;">
                <input type="text" name="product_color_id" value="${e_selected.product_color_id}" style="display:none;">
            </c:forEach>

            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
