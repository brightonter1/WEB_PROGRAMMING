<%-- 
    Document   : addcart.jsp
    Created on : Apr 27, 2018, 3:04:06 PM
    Author     : Brightonter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cart</title>
    </head>
    <body>
        
        
        <div class="modal fade" id="addCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <form action = "UploadServlet.jsp" method = "post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="p_id" disabled="">
                                <input type="text" class="form-control" id="size" disabled="">
<!--                                <div class="col-sm-10"> 
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
                                </div>-->
                            </div> 
                            kuy
                        </form>

                    </div>

                </div>
            </div>
        </div>
        
        
        
    </body>
</html>
