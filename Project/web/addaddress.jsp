<%-- 
    Document   : addaddress
    Created on : Apr 21, 2018, 8:13:44 PM
    Author     : Brightonter
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        
        <a href="setting.jsp"><<</a>
        <form action="AddAddrServlet" method="POST">
            <div class="container" id="container">
                <div class="row" id="form-account">
                    <h3 class="display-1">Add Address</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Firstname</label>
                            <input type="text" class="form-control" name="fname" value="" required>
                        </div>
                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" class="form-control" name="mobile" value="" required>
                        </div>
                    </div>

                    <div class="col-md-6"> 
                        <div class="form-group">
                            <label>Lastname</label>
                            <input type="text" class="form-control" name="lname" value="" required>
                        </div>

                    </div>
                </div>


                <div class="row" id="form-account">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">Address</label>
                            <input type="text" class="form-control" name="address" value="" required>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" class="form-control" name="city" value="" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Country</label>
                            <input type="text" class="form-control" name="country" value="" required>
                        </div>

                        <div class="form-group">
                            <label>Postcode</label>
                            <input type="text" class="form-control" name="code" value="" required>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success" name="btn" value="apply">Add</button>
            </div>
        </form>
    </body>
</html>
