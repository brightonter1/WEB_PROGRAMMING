<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="addcart.jsp" %>
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

            p_id : ${e_s.p_id}<br>
            color : ${e_s.color}

            <br>
            image : <img src="${e_s.image}" style="width: 100px"><br>
            type : ${e_s.cate_type}<br>
            size : 
            <select  name="sizes" required="">
                <c:forEach var="e_size" items="${allSizes.rows}" >
                    <option value="${e_size.size}">${e_size.size}</option>
                </c:forEach>
            </select><br>
            price : ${e_s.price}<br>
            <!--<form action="addcart.jsp" method="POST" >-->
<!--            <input type="text" name="p_id" value="${e_s.p_id}" style="display:none;">
            <input type="text" name="product_color_id" value="${e_s.product_color_id}" style="display:none;">
            <input type="text" name="pso_id" value="${e_s.pso_id}" style="display:none;">-->
<!--            จำนวน -->
            <!--<input type="text" class="form-control" name="quantity" value="" size="10" required="" />-->
            <div class="data" data-p_id="${e_s.p_id}" data-size="${sizes}">
                <button type="submit"  name="addToCart" class="btn btn-success" value="sss" data-toggle="modal" data-target="#addCart">Add To Cart</button>
            
            </div>
            <!--</form>-->
            -------------------------------------<br>




        </c:forEach> 


        <!--
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

<!--
        <script>

            $('.data').click(function () {
                var p_id = $(this).attr('data-p_id');
                var p_idShow = $(this).attr('data-p_idShow');
//                var pso = $(this).attr('data-pso');
                var title = $(this).attr('data-title');
                var desc = $(this).attr('data-des');
                var image = $(this).attr('data-url');
                var cate = $(this).attr('data-cate');
//                var qty = $(this).attr('data-qty');
                var size = $(this).attr('data-size');
                var color = $(this).attr('data-color');
                var url = $(this).attr('data-url');
                var product_color_id = $(this).attr('data-product_color_id');
                $("#product_color_id").val(product_color_id);
                $("#p_id").val(p_id);
                $("#p_id1").val(p_id);
                $("#p_idShow").val(p_idShow);
//                $("#pso").val(pso);
                $("#title").val(title);
                $("#desc").val(desc);
//                $("#image").val(image);
                $("#cate").val(cate);
//                $("#qty").val(qty);
                $("#size").val(size);
                $("#color").val(color);
//                $("#price").val(price);
                document.getElementById("url").src = image;
                document.getElementById("urlpso").src = image;


            }
            );





        </script>
        -->
    </body>
</html>
