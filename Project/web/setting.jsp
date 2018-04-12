<%-- 
    Document   : setting
    Created on : Apr 12, 2018, 1:20:52 AM
    Author     : Brightonter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" id="container">
            <div class="row" id="form-account">
                <h3 class="display-1">Manager Account</h3>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Firstname</label>
                        <input type="text" class="form-control" name="fname" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" name="phone" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Lastname</label>
                        <input type="text" class="form-control" name="lname" required>
                    </div>

                    <div class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" class="form-control" name="dob" required>
                    </div>
                </div>
            </div>

 
            <div class="row" id="form-account">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="subject">Address</label>
                        <input type="text" class="form-control" name="address" required>
                    </div>
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" class="form-control" name="city" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Country</label>
                        <input type="text" class="form-control" name="country" required>
                    </div>

                    <div class="form-group">
                        <label>Postcode</label>
                        <input type="text" class="form-control" name="code" required>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-success">Apply</button>


        </div>
    </body>
</html>
