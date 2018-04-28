<%@page import="model.Cart"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="org.apache.derby.client.am.DateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.User"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");

    String fullFN = "";

    String image = "";

    boolean withOutImage = true;
    
    int payment_id = 0;
    int cart_id = 0;
    int account = 0;
    String date = "";
    
    
    // Verify the content type
    String contentType = request.getContentType();

    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (fi.getFieldName().equals("image")) {
                    image = fi.getString();
                    out.println(image + "eiei");
                }
                if (fi.getFieldName().equals("file")) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    out.print("filename : " + fileName.isEmpty() + " | " + fileName + "<br>");

                    if (fileName.isEmpty()) {
                        withOutImage = true;

                    } else if (!fileName.isEmpty()) {
                        withOutImage = false;
                    }

                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    fullFN = ("image/" + fileName);
                    out.print(filePath + fullFN + "path");

                }

                if (fi.getFieldName().equals("account")) {
                    account = Integer.parseInt(fi.getString("UTF-8"));
                    out.print(account);
                } else if (fi.getFieldName().equals("payment_id")) {
                    payment_id = Integer.parseInt(fi.getString("UTF8"));
                    out.print(payment_id);
                }else if (fi.getFieldName().equals("date")) {
                    date = fi.getString();
                    out.print(date);
                }else if (fi.getFieldName().equals("cart_id")) {
                    cart_id = Integer.parseInt(fi.getString());
                    out.print(date);
                }
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
    } else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
    try {
        Connection con = (Connection) getServletContext().getAttribute("Connection");
        PreparedStatement ppstm;
        ResultSet rs;
        session = request.getSession();
        User u = (User) session.getAttribute("user");
        out.print(payment_id + "hhh<br><br><br>" + u.getUsername() + "||" + cart_id);
        String SQL = "UPDATE payment "
                + "SET payment_date = ?, account_id = ?, slip = ?, time = ? "
                + "where payment_id = ?";
        ppstm = con.prepareStatement(SQL);
        ppstm.setString(1, date);
        ppstm.setInt(2, account);
        ppstm.setString(3, fullFN);
        ppstm.setTime(4, Time.valueOf(LocalTime.now()));
        ppstm.setInt(5, payment_id);
        ppstm.executeUpdate();
//               update cart set payment_status = 'wait' where cart_id = 62 and username = 'member'
        SQL = "UPDATE cart SET payment_status = 'wait' where username = ? and cart_id = ?";
        ppstm = con.prepareStatement(SQL);
        
        ppstm.setString(1, u.getUsername());
        ppstm.setInt(2, cart_id);
        ppstm.executeUpdate();
        out.print("complete");
//        response.sendRedirect("homw.jsp");
     
    
    
    } catch (Exception ex) {
        out.print(ex);
    }


%>