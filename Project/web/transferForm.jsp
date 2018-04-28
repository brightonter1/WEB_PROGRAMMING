<%-- 
    Document   : transferForm
    Created on : Apr 28, 2018, 3:12:08 AM
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
        <jsp:useBean id="cart" scope="session" class="model.Cart"></jsp:useBean>
        ${user.username} || ${cart.cart_id}
        <sql:query var="ee" dataSource="shoppingonline">
            select * 
            from user u
            join cart c
            on (u.username = c.username)
            join payment p
            on (c.cart_id = p.cart_payment_cart_id)
            where u.username = '${user.username}' and payment_status = 'transfer'
            group by cart_id
            
            
        </sql:query>
            
        <form action="UploadPayment.jsp" method="POST" enctype = "multipart/form-data">


            <c:forEach var="ii" items="${ee.rows}">
                username : ${ii.username}<br>
                order id : ${ii.cart_id}<br>
                order Date : ${ii.order_date}<br>
                account id : <input type="text" name="account" value="" size="15" minlength="10" maxlength="10" required=""/>
                <br>image : <input type="file" name="file" value="" required="">
                <input type="text" name="payment_id" value="${ii.payment_id}" style="display:none;">
                <input type="text" name="cart_id" value="${ii.cart_id}" style="display:none;">
                payment date : <input type="date" name="date" value="" required>
            </c:forEach>
                <input type="submit"  value="okay" />
        </form>
    </body>
</html>
