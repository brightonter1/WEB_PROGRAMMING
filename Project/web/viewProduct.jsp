<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <c:set var="p_id" value="${param.p_idd}"></c:set>

        <sql:query var="selectedProduct" dataSource="shoppingonline">
            select * 
            from product
            join product_color
            using (p_id)
            join pso
            using (p_id, product_color_id)
            where p_id = '${param.p_id}'
            group by product_color_id
        </sql:query>

        <c:forEach var="e_s" items="${selectedProduct.rows}">
            <sql:query var="allSizes" dataSource="shoppingonline">
                select size
                from product
                join product_color
                using (p_id)
                join pso
                using (p_id, product_color_id)
                where p_id = '${e_s.p_id}' and product_color_id = '${e_s.product_color_id}'
            </sql:query>

            <c:set var = "balance" value = "${e_s.price}" />
            <form action="ProductForm" method="POST" >
                <div class="container">
                    <div class="card col-sm-6 col-md-4">
                        <img src="${e_s.image}">
                    </div>

                    <div class="col-sm-6 col-md-4">
                        <h1>${e_s.title}</h1><br>
                        <h4>${e_s.cate_type} </h4><br>
                    </div>

                    <div class="col-sm-6 col-md-4">
                        <h3><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${balance}" /> THB</h3>
                    </div>

                    <div class="col-sm-6 col-md-5">
                        <h4>เลือกไซส์</h4><br>
                        <select  name="size" class="form-control">
                            <c:forEach var="e_size" items="${allSizes.rows}" >
                                <option value="${e_size.size}">${e_size.size}</option>
                            </c:forEach>
                        </select><br>
                    </div>

                    <div class="col-sm-6 col-md-8">
                        <input type="submit" class="btn btn-success" value="Add To Cart">
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-heart"></span></button><br><br>
                    </div>

                    <div class="col-sm-6 col-md-8">
                        <h4>${e_s.description}</h4>
                    </div>
                    <input type="text" name="p_id" value="${e_s.p_id}" style="display:none;">
                    <input type="text" name="product_color_id" value="${e_s.product_color_id}" style="display:none;">

                </div>
            </form>
            <hr>
        </c:forEach>













        <!--            <c:set var="p_id" value="${param.p_idd}"></c:set>
        
        <sql:query var="selectedProduct" dataSource="shoppingonline">
            select * 
            from product
            join product_color
            using (p_id)
            join pso
            using (p_id, product_color_id)
            where p_id = '${param.p_id}'
            group by product_color_id
        </sql:query>

        <c:forEach var="e_s" items="${selectedProduct.rows}">

            <sql:query var="allSizes" dataSource="shoppingonline">
                select size
                from product
                join product_color
                using (p_id)
                join pso
                using (p_id, product_color_id)
                where p_id = '${e_s.p_id}' and product_color_id = '${e_s.product_color_id}'
            </sql:query>

            p_id : ${e_s.p_id}<br>
            color : ${e_s.color}

            <br>
            image : <img src="${e_s.image}" style="width: 100px"><br>
            type : ${e_s.cate_type}<br>


            price : ${e_s.price}<br>${sizes}
            <form action="ProductForm" method="POST" >
                size : 

                <select  name="size" required="">
            <c:forEach var="e_size" items="${allSizes.rows}" >
                <option value="${e_size.size}">${e_size.size}</option>
            </c:forEach>
        </select><br>
        <input type="text" name="p_id" value="${e_s.p_id}" style="display:none;">
        <input type="text" name="product_color_id" value="${e_s.product_color_id}" style="display:none;">

                    จำนวน 
        <input type="text" class="form-control" name="quantity"/>${e_s.pso_id}>

        <input type="submit" class="btn btn-success" value="Add To Cart" />
    </div>
</form>
-------------------------------------<br>




        </c:forEach> 


        
        <sql:query var="selectedProduct" dataSource="shoppingonline">
            select * 
            from product
            join product_color
            using (p_id)
            join pso
            using (p_id, product_color_id)
            where p_id = '${param.p_id}'
            and product_color_id = '${param.product_color_id}'
            and size = '${param.size}'
        </sql:query>
    
        <c:if test="${param.addToCart == 'sss'}">
            <c:if test="${param.quantity != null}" >
    
                <c:forEach var="i" items="${selectedProduct.rows}">
                    <c:set var="selectedQuantity" value="${i.quantity}"></c:set>
                    <c:if  test="${selectedQuantity  < param.quantity}">
                        Not Enough<br>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:if>
    
        <button type="submit"  >Add to Cart</button>
        <button type="submit" class="btn btn-success" >Favorite</button>-->


    </body>
    <!--<script>swal("Hello world!");</script>-->
</html>
