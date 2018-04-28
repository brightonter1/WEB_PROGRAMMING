<%@page import="java.nio.charset.Charset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    String title = "";
    String description = "";
    String cate_type = "";
    String image = "";
    int quantity = 0;
    String size = "";
    String color = "";
    float price = 0;
    String button = "";
    boolean withOutImage = true;
    int numCount = 1;
    int p_id = 0;
    int product_color_id = 0;
    String sex = "";

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
                        
                    } else if(!fileName.isEmpty()){
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
                    out.print(filePath + fullFN +"path");
                    
                }

                if (fi.getFieldName().equals("title")) {
                    title = fi.getString("UTF-8");
                    out.println(title + ": title<br>");
                } else if (fi.getFieldName().equals("description")) {
                    description = fi.getString("UTF-8");
                    out.println(description + ": desc<br>");
                } else if (fi.getFieldName().equals("cate_type")) {
                    cate_type = fi.getString("UTF-8");
                    out.println(cate_type + ": cate<br>");
                } else if (fi.getFieldName().equals("add")) {
                    button = fi.getString("UTF-8");
                    out.println(button + ": add<br>");
                } else if (fi.getFieldName().equals("p_id")) {
                    button = fi.getString("UTF-8");
                    p_id = Integer.parseInt(fi.getString());
                    out.println(button + ": edit<br>");
                } else if (fi.getFieldName().equals("qty")) {
                    quantity = Integer.parseInt(fi.getString("UTF-8"));
                    out.println(quantity + ": qty<br>");
                } else if (fi.getFieldName().equals("size")) {
                    size = fi.getString("UTF-8");
                    out.println(size + ": size<br>");
                } else if (fi.getFieldName().equals("color")) {
                    color = fi.getString("UTF-8");
                    out.println(color + ": color<br>");
                } else if (fi.getFieldName().equals("price")) {
                    price = Float.parseFloat(fi.getString("UTF-8"));
                    out.println(price + ": price<br>");
                }
                else if (fi.getFieldName().equals("product_color_id")) {
                    product_color_id = Integer.parseInt(fi.getString());
                    out.println(product_color_id + ": product_color_id<br>");
                }else if (fi.getFieldName().equals("sex")) {
                    sex = fi.getString("UTF-8");
                    out.println(sex + ": product_color_id<br>");
                }
                numCount++;
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
        
        int last_p_id = 0;
        if (button.equals("add")) {
            String SQL = "INSERT INTO product (title, description, cate_type, sex)"
                    + "VALUES (?, ?, ?, ?)";

            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, title);
            ppstm.setString(2, description);
            ppstm.setString(3, cate_type);
            ppstm.setString(4, sex);
            ppstm.executeUpdate();
            out.print("eorr 123" + title + "|" + description + "|"+ cate_type + "|");
            SQL = "select max(p_id) from product";
            ppstm = con.prepareStatement(SQL);
            rs = ppstm.executeQuery();
            if(rs.next()){
                p_id = rs.getInt(1);
            }
            out.print(p_id+"||||");
            SQL = "INSERT INTO product_color (p_id, color, image) VALUES (?, ?, ?)";
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, Integer.toString(p_id));
            ppstm.setString(2, color);
            ppstm.setString(3, fullFN);
            
            ppstm.executeUpdate();
            out.print("eorr");

        }else if(button.equals("addColor")){ 
            out.print("EIEI");
            String SQL = "INSERT INTO product VALUES (?, ?, ?, ?)";
//
//            ppstm = con.prepareStatement(SQL);
//            ppstm.setString(1, Integer.toString(p_id));
//            ppstm.setString(2, title);
//            ppstm.setString(3, description);
//            ppstm.setString(4, cate_type);
//            ppstm.executeUpdate();
            
            SQL = "INSERT INTO product_color (p_id, color, image) VALUES (?, ?, ?)";
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, Integer.toString(p_id));
            ppstm.setString(2, color);
            ppstm.setString(3, fullFN);
            ppstm.executeUpdate();
            out.print("complete");
        }else if (!button.equals("add") && withOutImage == false) {
            out.print("edit with image");
            String SQL = "UPDATE product "
                    + "SET title = ?, description = ?, cate_type = ? sex = ? "
                    + "WHERE p_id = ?";
            ppstm = con.prepareStatement(SQL); 
            ppstm.setString(1, title);
            ppstm.setString(2, description);
            ppstm.setString(3, cate_type);
            ppstm.setString(4, sex);
            ppstm.setString(5, button);
            ppstm.executeUpdate();
            out.print(" : half");
            SQL = "UPDATE product_color "
                    + "SET color = ?, image =? "
                    + "WHERE p_id = ? and product_color_id = ?";
            out.println("sdsdssd 5555 " + button.isEmpty());
            out.print(p_id);
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, color);
            ppstm.setString(2, fullFN);
            ppstm.setInt(3, p_id);
            ppstm.setInt(4, product_color_id);
            ppstm.executeUpdate();
            out.print(" : complete");

        } else {
            String SQL = "UPDATE product "
                    + "SET title = ?, description = ?, cate_type = ?, sex = ? "
                    + "WHERE p_id = ?";
            out.println("kuy |||<br>" + button.isEmpty());
            out.print(p_id);
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, title);
            ppstm.setString(2, description);
            ppstm.setString(3, cate_type);
            ppstm.setString(4, sex);
            ppstm.setInt(5, p_id);
            ppstm.executeUpdate();
            out.println("kuy |||<br>" + button.isEmpty());
            SQL = "UPDATE product_color "
                    + "SET color = ? "
                    + "WHERE p_id = ? and product_color_id = ?";
            out.print(p_id);
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, color);
            ppstm.setInt(2, p_id);
            ppstm.setInt(3, product_color_id);
            ppstm.executeUpdate();

        }
        response.sendRedirect("viewAllProducts.jsp");

    } catch (SQLException ex) {
        out.print(ex);
        
        
        response.sendRedirect("viewAllProducts.jsp");
    }

%>