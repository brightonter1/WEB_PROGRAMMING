<%-- 
    Document   : editTest
    Created on : Apr 26, 2018, 1:19:45 AM
    Author     : Brightonter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="editProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <form action = "UploadServlet.jsp" method = "post" enctype = "multipart/form-data">
                            <div class="form-group">
                                <div class="col-sm-10"> 
                                    <label class="control-label col-sm-5">Product No :</label>
                                    <input type="text" class="form-control" id="p_idShow" disabled="">
                                </div>
                                
                                
                                <div class="col-sm-10"> 
                                    <label class="control-label col-sm-2">Title</label>
                                    <input type="text" class="form-control" name="title" id="title" >
                                    <input type="text" class="form-control" name="p_id" id="p_id" style="display:none;">
                                    <input type="text" class="form-control" name="product_color_id" id="product_color_id" style="display:none;">
                                </div>

                                <div class="col-sm-10"> 
                                    <label class="control-label col-sm-2">Category</label><br>
                                    <select name="cate_type" id="cate" class="form-control">
                                        <c:forEach var="e_category" items="${category.rows}">
                                            <option value="${e_category.cate_type}">${e_category.cate_type}</option>
                                        </c:forEach>
                                    </select>  
                                </div>

                                <div class="col-sm-10">   
                                    <label class="control-label col-sm-2" >Description</label>
                                    <textarea class="form-control" name="description" id="desc"></textarea>
                                </div>
                                
                                <div class="col-sm-10">   
                                    <label class="control-label col-sm-2" >Color</label>
                                    <input type="text" class="form-control" name="color" id="color" >
                                </div>

                                <div class="col-sm-10">
                                    <br><label class="control-label col-sm-2">image</label>
                                    
                                    <img src="" width="300px" id="url">
                                    <input type="file" name="file">
                                    
                                </div>

                                <div class="col-sm-10">
                                    <br><button type="submit" class="btn btn-success" name="delete" value="delete">Edit</button>
                                </div>
                            </div> 
                        </form>

                    </div>

                </div>
            </div>
        </div>
                                        
    </body>
</html>
