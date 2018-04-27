<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" charset="UTF-8"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="addProduct.jsp" %>
        <%@include file="editTest.jsp" %>

        <sql:query var="products" dataSource="shoppingonline">
            select * 
            from product 
            left outer join product_color 
            using (p_id)
            left outer join pso 
            using (p_id, product_color_id)
            order by p_id, product_color_id
            ;

        </sql:query>

        <div class="container">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addProduct">Add Product</button>
            <br><br>
            <table border="1" class="table table-striped">
                <thead>
                    <tr>
                        <th>P_ID</th>
                        <th>color_id</th>
                        <th>pso_id</th>
                        <th>Title</th>
                        <th>Desc</th>
                        <th>Image</th>
                        <th>cate_type</th>
                        <th>sex</th>
                        <th>Qty</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Edit Pso</th>
                        <th>Add Pso</th>
                        <th>Add Color</th>
                        <th>Delete Product</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="i" items="${products.rows}" >

                        <!--table-->
                        <tr > 

                            <td>${i.p_id}</td>
                            <td>${i.product_color_id}</td>
                            <td>${i.pso_id}</td>
                            <td>${i.title}</td>
                            <td>${i.description}</td>

                            <c:if test="${i.image != null}">
                                <td><img src="${i.image}"></td>
                                </c:if>
                                <c:if test="${i.image == null}">
                                <td>NO image</td>
                                </c:if>

                            <td>${i.cate_type}</td>
                            <td>${i.sex}</td>                   
                            <td>${i.quantity}</td>
                            <td>${i.size}</td>
                            <td>${i.color}</td>
                            <td>${i.price}</td>

                            <!--
                                Edit Product
                            -->
                            <td class="data" data-p_id="${i.p_id}"  data-p_idShow="${i.p_id}" 
                                data-title="${i.title}" data-des="${i.description}"
                                data-cate="${i.cate_type}" data-color="${i.color}"
                                data-url="${i.image}" data-product_color_id="${i.product_color_id}"><button type="submit" class="btn btn-success" name="edit" value="${i.p_id}" data-toggle="modal" data-target="#editProduct">Edit</button></td>
                            <!--</form>-->
                    <form action="editPso.jsp">
                        <input type="text" name="p_id" value="${i.p_id}" style="display:none;">
                        <input type="text" name="pso_id" value="${i.pso_id}" style="display:none;">
                        <input type="text" name="product_color_id" value="${i.product_color_id}" style="display:none;">
                        <td><button  type="submit" class="btn btn-success" data-toggle="modal" data-target="#addPso">Edit Pso</button></td>
                    </form>
                    <form action="addPso.jsp">
                        <input type="text" name="p_id" value="${i.p_id}" style="display:none;">
                        
                        <input type="text" name="product_color_id" value="${i.product_color_id}" style="display:none;">
                        <td><button  type="submit" class="btn btn-success" data-toggle="modal" data-target="#addPso">Add Pso</button></td>
                    </form>

                    <form action="addColor.jsp">
                        <input type="text" name="p_id" value="${i.p_id}" style="display:none;">
                        <input type="text" name="title" value="${i.title}" style="display:none;">
                        <input type="text" name="description" value="${i.description}" style="display:none;">
                        <td><button type="submit" class="btn btn-success" data-toggle="modal" data-target="#addColor">Add Color</button></td>
                    </form>


                    <form action="DeleteProductServlet">
                        <input type="text" name="p_id" value="${i.p_id}" style="display:none;">
                        <input type="text" name="product_color_id" value="${i.product_color_id}" style="display:none;">
                        <input type="text" name="pso_id" value="${i.pso_id}" style="display:none;">
                        <td><button type="submit" class="btn btn-success" name="delete">Delete Product</button></td>
                    </form>
                    </tr>

                </c:forEach>

                </tbody>
            </table>


        </div>


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
//                var size = $(this).attr('data-size');
                var color = $(this).attr('data-color');
                var url = $(this).attr('data-url');
                var product_color_id = $(this).attr('data-product_color_id');
//                var price = $(this).attr('data-price');
//                console.log(p_id);
//                console.log(pso);
//                console.log(title);
//                console.log(desc);
//                console.log(image);
//                console.log(cate);
//                console.log(qty);
//                console.log(size);
//                console.log(color);
//                console.log(price);
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
//                $("#size").val(size);
                $("#color").val(color);
//                $("#price").val(price);
                document.getElementById("url").src = image;
                document.getElementById("urlpso").src = image;


            }
            );





        </script>








    </body>
</html>
