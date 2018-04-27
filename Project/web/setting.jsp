<html>
    <head>
        <meta http-equiv="Content-Type" charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <sql:query dataSource="shoppingonline" var="addrxmember">
            SELECT * 
            FROM member
            LEFT OUTER JOIN member_address
            USING(username)
            WHERE username = '${sessionScope.username}'
        </sql:query>
        <c:set var="count" value="3"></c:set>
            <div class="container">
                <h4>Manage Address</h4>
            <c:forEach items="${addrxmember.rows}" var="i">
                <div class="ShowAddr">
                    <c:if test="${i.id_address != null}">
                        
                        <c:set var="count" value="${count - 1}"></c:set>
                        Receiver : ${i.addr_fname} ${i.addr_lname}<br>
                        Address : ${i.address} <br>
                        ${i.city}, ${i.country}, ${i.postcode}
                        Phone No. : ${i.addr_mobile}
                        <form action="editaddr.jsp">
                            <button type="submit" class="btn btn-success" name="btn" value="${i.id_address}">Edit</button>
                        </form>
                    </c:if>
                </div>
                <hr>
            </div>
        </c:forEach>
        <c:if test="${count != 0}">
            <c:forEach var="k" begin="1" end="${count}">
                <form action="addaddress.jsp" method="POST">
                    <button type="submit" class="btn btn-success" name="btn" value="hee">add</button>
                </form>

            </c:forEach>
        </c:if>

    </body>
</html>
