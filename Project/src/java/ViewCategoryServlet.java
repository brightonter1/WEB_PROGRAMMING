/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/ViewCategoryServlet"})
public class ViewCategoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection con = (Connection) getServletContext().getAttribute("Connection");
            String SQL = "";

            String command = request.getParameter("command");

            try {
                if (command.equals("Add")) {
                    String categoryTypeName = request.getParameter("categoryTypeName");
                    SQL = "INSERT INTO category VALUES (?)";
                    PreparedStatement ppstm = con.prepareStatement(SQL);
                    ppstm.setString(1, categoryTypeName);
                    out.print(categoryTypeName);
                    ppstm.executeUpdate();
                } else {
                    SQL = "DELETE FROM category WHERE cate_type = ?";
                    PreparedStatement ppstm = con.prepareStatement(SQL);
                    ppstm.setString(1, command);
                    ppstm.executeUpdate();
                }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Success');");
                out.println("location='viewCategory.jsp';");
                out.println("</script>");
            } catch (Exception ex) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Cannot Delete');");
                out.println("location='viewCategory.jsp';");
                out.println("</script>");
            }

//            out.print("process : " + command);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
