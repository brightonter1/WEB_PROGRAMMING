<%-- 
    Document   : addColor
    Created on : Apr 26, 2018, 7:52:38 PM
    Author     : Brightonter
--%>

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
    <sql:query var="category" dataSource="shoppingonline" >
        SELECT * 
        FROM category;
    </sql:query>
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="addColor" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <!--<form action="AddProductServlet" method="POST" >-->
                    <form action="UploadServlet.jsp" method="POST" enctype = "multipart/form-data" >
                        <div class="modal-header">
                            <h4 class="modal-title">Add Color ${param.p_id}</h4>
                            <input type="text" name="p_id" value="${param.p_id}" style="display:none;">
                        </div>
                        <div class="modal-body">


                            <div class="form-group">
                                <div class="col-sm-10"> 
                                    <label class="control-label col-sm-2">Title</label>
                                    <input type="text" class="form-control" name="title" value="${param.title}" required="">
                                </div>

                                <div class="col-sm-10"> 
                                    <label class="control-label col-sm-2">Category</label><br>
                                    <select name="cate_type" class="form-control" required="">
                                        <c:forEach var="e_category" items="${category.rows}">
                                            <option value="${e_category.cate_type}">${e_category.cate_type}</option>
                                        </c:forEach>
                                    </select>  
                                </div>

                                <div class="col-sm-10">   
                                    <label class="control-label col-sm-2" >Description</label>
                                    <textarea  class="form-control" name="description" value="${param.description}" required=""></textarea>
                                </div>

                                <div class="col-sm-10">   
                                    <label class="control-label col-sm-2" >Color</label>
                                    <input type="text" class="form-control" name="color" required="">
                                </div>

                                <div class="col-sm-10">
                                    <br><label class="control-label col-sm-2">image</label>
                                    <input type="file" name="file" required="">
                                </div>
                                <div class="col-sm-10">
                                    <br><button type="submit" class="btn btn-success"  name="add" value="addColor">Add</button>
                                </div>
                            </div> 





                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
