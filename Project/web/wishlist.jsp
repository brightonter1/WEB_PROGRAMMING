<%-- 
    Document   : wishlist
    Created on : Apr 28, 2018, 6:21:24 AM
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
        <sql:query var="wishLists" dataSource="shoppingonline">
            select * 
            from user 
            join member_fav_product
            on (user.username = member_fav_product.member_fav_username)
            join product
            on (member_fav_product.product_p_id = product.p_id)
            join product_color
            on (product_color.p_id = product.p_id)

            group by product_color.product_color_id
        </sql:query>
        <table border="1">
            <thead>
                <tr>
                    <th>P_id</th>
                    <th>title</th>
                    <th>description</th>
                    <th>category</th>
                    <th>sex</th>
                    <th>color</th>
                    <th>image</th>
                    <th>delete</th>

                </tr>
            </thead>



            <tbody>
                <c:forEach var="each_w" items="${wishLists.rows}" >


                    <tr>

                        <td>${each_w.p_id}</td>
                        <td>${each_w.title}</td>
                        <td>${each_w.description}</td>
                        <td>${each_w.cate_type}</td>
                        <td>${each_w.sex}</td>
                        <td>${each_w.color}</td>
                        <td><img src="${each_w.image}"></td>
                <form action="DeleteWishListServlet" method="POST">
                    <td><button type="submit"  name="p_id"  value="${each_w.p_id}" >delete</button></td>
                </form>


            </tr>
        </c:forEach>
    </tbody>

</table>

</body>
</html>
