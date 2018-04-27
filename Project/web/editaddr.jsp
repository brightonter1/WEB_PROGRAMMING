<%@include file="header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <a href="setting.jsp"><<</a>
        <c:set var="id_addr" value="${param.btn}" scope="session" />
        <sql:query dataSource="shoppingonline" var="member">
            SELECT * FROM member_address WHERE username = '${sessionScope.username}' AND id_address = ${id_addr}
        </sql:query>
        <c:forEach items="${member.rows}" var="i">
            <c:set var="addr" value="${i.address}"/>
            <c:set var="city" value="${i.city}"/>
            <c:set var="country" value="${i.country}"/>
            <c:set var="postcode" value="${i.postcode}"/>
            <c:set var="fname" value="${i.addr_fname}"/>
            <c:set var="lname" value="${i.addr_lname}"/>
            <c:set var="mobile" value="${i.addr_mobile}"  />
        </c:forEach>
        <form action="SetServlet.do" method="POST">
            <div class="container" id="container">
                <div class="row" id="form-account">
                    <h3 class="display-1">Address [${id_addr}]</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Firstname</label>
                            <input type="text" class="form-control" name="fname" value="${fname}" required>
                        </div>

                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" class="form-control" name="mobile" value="${mobile}" required>
                        </div>
                    </div>

                    <div class="col-md-6"> 
                        <div class="form-group">
                            <label>Lastname</label>
                            <input type="text" class="form-control" name="lname" value="${lname}" required>
                        </div>


                    </div>
                </div>


                <div class="row" id="form-account">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">Address</label>
                            <input type="text" class="form-control" name="address" value="${addr}" required>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" class="form-control" name="city" value="${city}" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Country</label>
                            <input type="text" class="form-control" name="country" value="${country}" required>
                        </div>

                        <div class="form-group">
                            <label>Postcode</label>
                            <input type="text" class="form-control" name="code" value="${postcode}" required>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success" name="apply" value="${id_addr}">Apply</button>
            </div>
        </form>
        <form action="DeleteAddrSerrvlet" method="POST">
            <button type="submit" class="btn btn-success" name="delete" value="${id_addr}">Delete</button>
        </form>
    </body>
</html>
