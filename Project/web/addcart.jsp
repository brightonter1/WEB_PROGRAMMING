<%-- 
    Document   : addcart.jsp
    Created on : Apr 27, 2018, 3:04:06 PM
    Author     : Brightonter
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cart</title>
    </head>
    <body>
        <jsp:useBean id="selectedProduct" scope="session" class="model.Product" />

        <sql:query var="findProduct" dataSource="shoppingonline">
            select * 
            from product
            join product_color
            using (p_id)
            join pso
            using (p_id, product_color_id)
            where p_id = '${selectedProduct.p_id}'
            and product_color_id = '${selectedProduct.product_color_id}'
            and size = '${selectedProduct.size}'
        </sql:query>
        <c:forEach var="e_selectedProduct" items="${findProduct.rows}">
            <c:set var="pso_id" value="${e_selectedProduct.pso_id}"></c:set>
            <jsp:setProperty name="selectedProduct" property="title" value="${e_selectedProduct.title}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="price" value="${e_selectedProduct.price}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="pso_id" value="${e_selectedProduct.pso_id}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="image" value="${e_selectedProduct.image}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="color" value="${e_selectedProduct.color}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="cate_type" value="${e_selectedProduct.cate_type}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="description" value="${e_selectedProduct.description}" ></jsp:setProperty>
            <jsp:setProperty name="selectedProduct" property="sex" value="${e_selectedProduct.sex}" ></jsp:setProperty>

                P_id : ${selectedProduct.p_id}<br>
            color id : ${selectedProduct.product_color_id}<br>
            pso id : ${pso_id}<br>
            Image : <img src="${e_selectedProduct.image}"><br>
            color : ${e_selectedProduct.color}<br>
            <form action="addProductToCart" method="POST">
                Quantity : 



                <select name="quantity" required>
                    <c:if test="${e_selectedProduct.quantity != 0}">
                        <c:forEach var="i" begin="1" end="${e_selectedProduct.quantity}">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${e_selectedProduct.quantity == 0}">
                        <option value="0">0</option>
                    </c:if>

                </select>
            </c:forEach>
            <br>
            <input type="submit" value="Confirm" /><br>
        </form>
        ${user.username}



    </body>
</html>
