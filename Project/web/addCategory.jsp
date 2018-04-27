<%-- 
    Document   : newjsp
    Created on : Apr 25, 2018, 3:32:57 PM
    Author     : Brightonter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
        <%--<%@include file="header.jsp" %>--%>
        
        
        <div class="container">
            
            <!-- Modal -->
            <div class="modal fade" id="addCategory" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form action="ViewCategoryServlet" method="POST">
                            Category : <input type="text" name="categoryTypeName" value="" size="50" />
                            <input name="command" class="btn btn-success" type="submit" value="Add" />
                        </form>
                    </div>
                </div>
            </div>
        </div>

<!--        <script type="text/javascript">
            $(window).on('load', function () {
                $('#myModal').modal('show');
            });
        </script>-->
    </body>
</html>
