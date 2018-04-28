<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>

        <%@include file="header.jsp" %>
        <form action="home.jsp" method="POST">

            <div class="container-fluid">
                <nav class="navbar navbar-expand-sm">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            GENDER : 
                            <sql:query var="e_sex" dataSource="shoppingonline" >
                                select * from sex
                            </sql:query>
                            <select class="form-control" name="selectedGender">
                                GENDER : 

                                <option value="all">all</option>
                                <c:forEach var="e_c" items="${e_sex.rows}">
                                    <option value="${e_c.sex}">${e_c.sex}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li class="nav-item">
                            <sql:query var="category" dataSource="shoppingonline">
                                select * from category
                            </sql:query>
                            <select class="form-control" name="selectedCategory">
                                <option value="all">all</option>
                                <c:forEach var="e_c" items="${category.rows}">
                                    <option value="${e_c.cate_type}">${e_c.cate_type}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li>
                            <select class="form-control" name="order">
                                <option>Price</option>
                                <option value="asc">low - high</option>
                                <option value="desc">high - low</option>
                            </select>
                        </li>
                        <li>
                            <input type="submit" value="submit" name="button" class="btn btn-primary"/>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
    </form>
    <sql:query dataSource="shoppingonline" var="product">
        SELECT * FROM product 
        join product_color 
        using (p_id)
        join pso
        using (p_id, product_color_id)
        <c:if test="${param.button == 'submit'}">


            <c:if test="${param.selectedCategory == 'all'}">

                <c:if test="${param.selectedGender == 'all'}"></c:if>
                <c:if test="${param.selectedGender != 'all'}">
                    where sex = '${param.selectedGender}'
                </c:if>

            </c:if>
            <c:if test="${param.selectedCategory != 'all'}">
                where cate_type = '${param.selectedCategory}'
                <c:if test="${param.selectedGender == 'all'}"></c:if>
                <c:if test="${param.selectedGender != 'all'}">
                    and sex = '${param.selectedGender}'
                </c:if>
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
                                <input name="quantity" value="0" style="display:none;">
                                <button type="submit" class="btn btn-default" >View</button><br>
                            </form>
                            <form action="addFavServlet" method="POST">
                                <input name="p_id" value="${i.p_id}" style="display:none;">
                                <input name="product_color_id" value="${i.product_color_id}" style="display:none;">
                                <input name="quantity" value="0" style="display:none;">
                                <button type="submit" class="btn btn-default" >Add Fav</button><br>
                            </form>   
                        </div>
                    </div>
                </div>
            </c:forEach>       
        </div>
    </div>


</body>
</html>
