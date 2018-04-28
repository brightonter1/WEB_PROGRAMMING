/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.User;
import org.apache.derby.client.am.DateTime;
import org.apache.derby.client.am.DateTimeValue;
import org.apache.tomcat.jni.Time;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/BuyOrderItenServlet"})
public class BuyOrderItenServlet extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            User u = (User) session.getAttribute("user");
            String text = request.getParameter("cartId");
            out.print(text);
            String[] temp = text.split(",");
            out.print("EIEI");
//            out.print( + "|" + LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_TIME));
//            
            Connection con = (Connection) getServletContext().getAttribute("Connection");
//
            String SQL = "UPDATE cart SET order_date = ?, total_price = ?, payment_status = 'transfer' where username = ? and cart_id = ?";
            PreparedStatement ppstm = con.prepareStatement(SQL);
            ppstm.setDate(1, Date.valueOf(LocalDate.now()));
            ppstm.setString(2, temp[1]);
            ppstm.setString(3, u.getUsername());
            ppstm.setString(4, temp[0]);
            ppstm.executeUpdate();
            out.print("EIEI");

            SQL = "INSERT INTO payment (cart_payment_cart_id) VALUES (?)";
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, temp[0]);
            ppstm.executeUpdate();
            Cart c = new Cart();
            c.setCart_id(Integer.parseInt(temp[0]));
            session.setAttribute("cart", c);
            response.sendRedirect("home.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(BuyOrderItenServlet.class.getName()).log(Level.SEVERE, null, ex);
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
