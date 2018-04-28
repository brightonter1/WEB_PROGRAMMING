<%-- 
    Document   : editprotest
    Created on : Apr 28, 2018, 1:17:29 AM
    Author     : Bright
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/css.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
    </head>
    <body>
        <style>

        </style>
        <sql:query var="selectedPso" dataSource="shoppingonline">
            select * from
            pso
            where pso_id = '${param.pso_id}' 
            and p_id = '${param.p_id}'
            and product_color_id = '${param.product_color_id}'
        </sql:query>
        <form action="EditPsoServlet" method="POST">
            <div class="modal-dialog" id="stick-form-edit">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit P_ID : ${param.p_id}</h4>
                    </div>
                    <c:forEach var="e_selected" items="${selectedPso.rows}">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    PSO_ID : ${param.pso_id}
                                </div>
                                <div class="col-md-4">
                                    COLOR_ID : ${param.product_color_id}
                                </div>
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    QTY : <input type="text" name="quantity" value="${e_selected.quantity}" style="width: 35px;">
                                </div>

                                <sql:query var="selectedSize" dataSource="shoppingonline">
                                    select * from size 
                                    where size not in (select size from
                                    pso
                                    where  p_id = '${param.p_id}'
                                    and product_color_id = '${param.product_color_id}')
                                </sql:query>
                                <div class="col-md-4">
                                    SIZE : <select name="size" >
                                        <option value="${e_selected.size}">${e_selected.size}</option>

                                        <c:forEach  var="i" items="${selectedSize.rows}">
                                            <option value="${i.size}">${i.size}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    PRICE : <input type="text" name="price" value="${e_selected.price}" style="width: 70px;">
                                </div>
                            </div>
                            <input type="text" name="p_id" value="${e_selected.p_id}" style="display:none;">
                            <input type="text" name="pso_id" value="${e_selected.pso_id}" style="display:none;">
                            <input type="text" name="product_color_id" value="${e_selected.product_color_id}" style="display:none;">
                            <input id="sub" type="submit" value="Submit" class="btn btn-success">
                        </c:forEach>
                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>
<script>
    $('#sub').click(function () {
        swal({
            title: "Add Complete",
            type: "success",
            timer: 1000,
            showConfirmButton: false
        }, function () {
//            window.location = "viewAllProducts.jsp";
        }
        );
    });
</script>
</html>