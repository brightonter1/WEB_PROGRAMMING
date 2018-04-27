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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/AddAddrServlet"})
public class AddAddrServlet extends HttpServlet {
    
    
    
    
        

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection con = (Connection) getServletContext().getAttribute("Connection");
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            String pcode = request.getParameter("code");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            
            
            String SQL = "INSERT INTO member_address (username, addr_fname, addr_lname, addr_mobile, "
                    + "address, country, city, postcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, username);
            ppstm.setString(2, fname);
            ppstm.setString(3, lname);
            ppstm.setString(4, mobile);
            ppstm.setString(5, address);
            ppstm.setString(6, country);
            ppstm.setString(7, city);
            ppstm.setString(8, pcode);
            int ss = ppstm.executeUpdate();
            
            out.print(ss);
            
            response.sendRedirect("setting.jsp");
            
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AddAddrServlet.class.getName()).log(Level.SEVERE, null, ex);
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
