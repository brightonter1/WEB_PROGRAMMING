<%-- 
    Document   : viewCategory
    Created on : Apr 25, 2018, 4:50:13 PM
    Author     : Brightonter
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="addCategory.jsp" %>
        <sql:query var="category" dataSource="shoppingonline" >
            SELECT * 
            FROM category;
        </sql:query>
        <table border="1">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="e_category" items="${category.rows}">
                    <tr>



                        <td>${e_category.cate_type}<br></td>
                        <td>
                            <form action="ViewCategoryServlet" method="POST">
                                <button type="submit" class="btn btn-success" name="command" value="${e_category.cate_type}">Delete</button>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>




        </table>
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addCategory">Add Category</button>
    </body>
</html>
