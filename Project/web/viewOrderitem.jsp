<%-- 
    Document   : viewOrederitem
    Created on : Apr 28, 2018, 12:42:08 AM
    Author     : Brightonter
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <sql:query var="quantityViewOrder" dataSource="shoppingonline">
            select *
            from user
            join cart
            using (username)
            join order_item
            using (cart_id)
            join product
            using (p_id)
            join product_color
            using (p_id, product_color_id)
            join pso
            using (p_id, product_color_id, pso_id)
            where username = '${user.username}' and payment_status = 'chosen'      
        </sql:query>
        <c:set var="totalPrice" value="0"></c:set> 
            <table border="1">
                <thead>
                    <tr>
                        <th>order id</th>
                        <th>image</th>
                        <th>title</th>
                        <th>quantity</th>
                        <th>price</th>
                        <th></th>
                    </tr>
                </thead>




                <tbody>
                <c:forEach var="eachOrderItem" items="${quantityViewOrder.rows}">
                    <tr>
                        <td>${eachOrderItem.order_item_id}</td>
                        <td><img src="${eachOrderItem.image}"> </td>
                        <td>${eachOrderItem.title}</td>
                        <td>${eachOrderItem.order_quantity}</td>
                        <td>${eachOrderItem.price * eachOrderItem.order_quantity}</td>
                <form action="DeleteOrderItemServlet">
                    <input type="text" name="order_item_id" value="${eachOrderItem.order_item_id}" style="display:none;">
                    <td><button type="submit" class="btn btn-success" name="delete">Delete Product</button></td>
                </form>

            </tr>
            <c:set var="totalPrice" value="${totalPrice + (eachOrderItem.price * eachOrderItem.order_quantity)}"></c:set> 
            <c:set var="cartId" value="${eachOrderItem.cart_id}"></c:set> 
        </c:forEach>
    </tbody>
</table>
${totalPrice}
${user.username} 
${cartId}

<form action="BuyOrderItenServlet" method="POST">
    
    <button type="submit" name="cartId" value="${cartId},${totalPrice}" >Buy Order</button>
</form>
</body>
</html>
