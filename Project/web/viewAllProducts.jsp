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

        <div class="container-fuild">
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
                                data-url="${i.image}" data-sex="${i.sex}" data-product_color_id="${i.product_color_id}"><button type="submit" class="btn btn-success" name="edit" value="${i.p_id}" data-toggle="modal" data-target="#editProduct">Edit</button></td>
                            <!--</form>-->



                            <!--<form action="editPso.jsp">-->
                    <input type="text" id="editp_id" name="p_id" value="${i.p_id}" style="display:none;">
                    <input type="text" id="editpso_id" name="pso_id" value="${i.pso_id}" style="display:none;">
                    <input type="text" id="editproduct_color_id" name="product_color_id" value="${i.product_color_id}" style="display:none;">
                    <td class="edit" data-p_id="${i.p_id}"  data-pso_id="${i.pso_id}" data-product_color_id="${i.product_color_id}"><button type="submit" class="btn btn-success" >Edit Pso</button></td>
                    <!--</form-->
                    <div id="test"></div>





                    <form action="addPso.jsp">
                        <input type="text" name="p_id" value="${i.p_id}" style="display:none;">

                        <input type="text" name="product_color_id" value="${i.product_color_id}" style="display:none;">
                        <td class="addPso" data-p_id="${i.p_id}" data-product_color_id="${i.product_color_id}"><button  type="submit" class="btn btn-success" data-toggle="modal" data-target="#addPso">Add Pso</button></td>
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

            $(document).ready(function () {
                $('.edit').click(function () {
                    var p_id = $(this).attr('data-p_id');
                    var pso_id = $(this).attr('data-pso_id');
                    var product_color_id = $(this).attr('data-product_color_id');
                    x = 1;
                    console.log(p_id);
                    console.log(pso_id);
                    console.log(product_color_id);

                    $.post("AjaxEditPso.jsp", {p_id: p_id, pso_id: pso_id, product_color_id: product_color_id}, function (data) {
                        $('#test').html(data);
                    });
                });
            });

            $(document).ready(function () {
                $('.addPso').click(function () {
                    var p_id = $(this).attr('data-p_id');
                    var product_color_id = $(this).attr('data-product_color_id');
                    console.log(p_id);
                    console.log(product_color_id);

                    $.post("editprotest.jsp", {p_id: p_id, pso_id: product_color_id}, function (data) {
                        $('#test').html(data);
                    });
                });
            });

            $(document).ready(function () {
                $('.data').click(function () {
                    var p_id = $(this).attr('data-p_id');
                    var p_idShow = $(this).attr('data-p_idShow');
                    var title = $(this).attr('data-title');
                    var desc = $(this).attr('data-des');
                    var image = $(this).attr('data-url');
                    var cate = $(this).attr('data-cate');
                    var color = $(this).attr('data-color');
                    var url = $(this).attr('data-url');
                    var product_color_id = $(this).attr('data-product_color_id');

                    console.log(p_id);
                    console.log(product_color_id);
                    console.log(title);
                    console.log(color);
                    console.log(desc);
                    console.log(image);
                    console.log(cate);

                    $("#product_color_id").val(product_color_id);
                    $("#p_id").val(p_id);
                    $("#p_id1").val(p_id);
                    $("#p_idShow").val(p_idShow);
                    $("#title").val(title);
                    $("#desc").val(desc);
                    $("#cate").val(cate);

                    $("#color").val(color);

                    document.getElementById("url").src = image;
                });
            });








        </script>








    </body>
</html>
