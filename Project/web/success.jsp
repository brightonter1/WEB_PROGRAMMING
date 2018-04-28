<%-- 
    Document   : success
    Created on : Apr 28, 2018, 1:41:45 PM
    Author     : Brightonter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    </head>
    <body>
        <h1>Hello World!</h1>

    </body>
    <script>

        swal({
            title: "Red Alert!",
            text: "I will close in 4 seconds.",
            type: "success",
            timer: 4000,
            showConfirmButton: false
        }, function () {
            window.location = "viewAllProducts.jsp";
        }
        );
    </script>';
</html>
