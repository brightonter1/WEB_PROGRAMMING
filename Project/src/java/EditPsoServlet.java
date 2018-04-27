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
@WebServlet(urlPatterns = {"/EditPsoServlet"})
public class EditPsoServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection con = (Connection) getServletContext().getAttribute("Connection");
            
            
            
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String size = request.getParameter("size");
            String p_id = request.getParameter("p_id");
            String pso_id = request.getParameter("pso_id");
            String product_color_id = request.getParameter("product_color_id");
            out.print(price + "<br>");
            out.print(quantity + "<br>");
            out.print(size + "<br>");
            out.print(p_id + "<br>");
            out.print(pso_id + "<br>");
            out.print(product_color_id + "<br>");
            
            String SQL = "UPDATE pso "
                    + "SET price = ?, quantity = ?, size = ? "
                    + "where p_id = ? and product_color_id = ? and pso_id = ?";
            
            PreparedStatement ppstm = con.prepareStatement(SQL);
            out.print("complete1");
            ppstm.setFloat(1, Float.parseFloat(price));
            out.print("complete2");
            ppstm.setInt(2, Integer.parseInt(quantity));
            out.print("complete3");
            ppstm.setString(3, size);
            out.print("complete4");
            ppstm.setString(4, p_id);
            out.print("complete5");
            ppstm.setString(5, product_color_id);
            out.print("complete6");
            ppstm.setString(6, pso_id);
            out.print("complete7");
            ppstm.executeUpdate();
            out.print("complete7");
            response.sendRedirect("viewAllProducts.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(EditPsoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
