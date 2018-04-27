/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/AddPsoServlet"})
public class AddPsoServlet extends HttpServlet {

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
            out.print("addpsoservelet");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");
            float price = Float.parseFloat(request.getParameter("price"));
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            int product_color_id = Integer.parseInt(request.getParameter("product_color_id"));

            out.println(p_id + "|" + price + "|" + product_color_id);

            String SQL = "SELECT max(pso_id) from pso where p_id = ? AND product_color_id = ?";
            PreparedStatement ppstm = con.prepareStatement(SQL);
            ppstm.setInt(1, p_id);
            ppstm.setInt(2, product_color_id);
            ResultSet rs = ppstm.executeQuery();
            rs.next();
            int pso_id = rs.getInt(1) + 1;
            
            out.println(pso_id + "|" + price + "|" + product_color_id);
            
            SQL = "INSERT INTO pso VALUES (?, ?, ?, ?, ?, ?)";
            ppstm = con.prepareStatement(SQL);
            ppstm.setInt(1, pso_id);
            ppstm.setInt(2, product_color_id);
            ppstm.setInt(3, p_id);
            ppstm.setInt(4, quantity);
            ppstm.setString(5, size);
            ppstm.setFloat(6, price);
            ppstm.executeUpdate();
            response.sendRedirect("viewAllProducts.jsp");

        } catch (Exception ex) {

            Logger.getLogger(AddPsoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
