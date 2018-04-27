<%-- 
    Document   : newjsp
    Created on : Apr 27, 2018, 1:36:12 AM
    Author     : Brightonter
--%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <sql:query dataSource="db" var="product">
        SELECT * FROM product 
        join product_color 
        using (p_id)
        join pso
        using (p_id, product_color_id)
        <c:if test="${param.button == 'submit'}">


            <c:if test="${param.selectedCategory == 'all'}">

            </c:if>
            <c:if test="${param.selectedCategory != 'all'}">
                where cate_type = '${param.selectedCategory}'
            </c:if>


        </c:if>
        group by p_id
        <c:if test="${param.order == 'desc'}">
            order by price desc
        </c:if>
        <c:if test="${param.selectedCategory != 'desc'}">
        </c:if>
    </sql:query>

    <div class="container">
        <div class="row">
            <c:forEach items="${product.rows}" var="i">
                <div class="card col-sm-6 col-md-4">
                    <div class="card-wrapper">
                        <div class=card-img>
                            <img src="${i.image}">
                        </div>
                        <div class="card-box">
                            <p><h4>${i.title} : ${i.p_id}</h4></p>
                            <p>${i.description}</p>
                            <p>${i.cate_type}</p>
                            <p>${i.price}</p>
                            <form action="viewProduct.jsp" method="POST">
                                <input name="p_id" value="${i.p_id}" style="display:none;">
                                <input name="product_color_id" value="${i.product_color_id}" style="display:none;">

                                <button type="submit" class="btn btn-default" >View</button><br>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>       
        </div>
    </div>
</body>
</html>
