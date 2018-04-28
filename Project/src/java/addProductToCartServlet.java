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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.OrderItem;
import model.Product;
import model.User;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/addProductToCart"})
public class addProductToCartServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            Product selectedProduct = (Product) session.getAttribute("selectedProduct");
            User u = (User) session.getAttribute("user");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            selectedProduct.setQuantity(quantity);
            int cart_id = 0;
            int last_cart_id = 0;
            String SQL = "select *, max(cart_id) from user u left outer join cart c on "
                    + "(u.username = c.username) where u.username = ? and c.payment_status = 'chosen'";
            PreparedStatement ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, u.getUsername());
            ResultSet rs = ppstm.executeQuery();
            
            int new_q = 0;
            
            if (rs.next()) {
                
                out.print("<br>"+ rs.getString("payment_status") + "|" + rs.getInt("cart_id") +"<br>");
                
                if (rs.getString("payment_status") == null ) {
                    SQL = "INSERT INTO cart (username, order_date, total_price, payment_status, transport_status) "
                            + "VALUES (?, ?, ?, ?, ?)";
                    //out.print(Date.valueOf(LocalDate.now())); currentday
                    ppstm = con.prepareStatement(SQL);
                    out.print(u.getUsername() + "quantity" + quantity);
                    ppstm.setString(1, u.getUsername());
                    ppstm.setDate(2, null);
                    ppstm.setFloat(3, 0);
                    ppstm.setString(4, "chosen");
                    ppstm.setString(5, null);
                    ppstm.executeUpdate();
                    out.print("<br> start <br>");

                }else if(! rs.getString("payment_status").equals("chosen")){
                    SQL = "INSERT INTO cart (username, order_date, total_price, payment_status, transport_status) "
                            + "VALUES (?, ?, ?, ?, ?)";
                    //out.print(Date.valueOf(LocalDate.now())); currentday
                    ppstm = con.prepareStatement(SQL);
                    out.print(u.getUsername() + "quantity" + quantity +rs.getString("payment_status") + "|" + (rs.getString("payment_status").equals("chosen")));
                    ppstm.setString(1, u.getUsername());
                    ppstm.setDate(2, null);
                    ppstm.setFloat(3, 0);
                    ppstm.setString(4, "chosen");
                    ppstm.setString(5, null);
                    ppstm.executeUpdate();
                    out.print("<br> 222222222222 <br>");
                }
            }

            SQL = "select max(cart_id) from cart where username = ?";
            ppstm = con.prepareStatement(SQL);
            ppstm.setString(1, u.getUsername());
            rs = ppstm.executeQuery();

            if (rs.next()) {
                last_cart_id = rs.getInt(1);
            }

            out.print("<br> " + last_cart_id);
            SQL = "select * from cart where cart_id = ?";
            ppstm = con.prepareStatement(SQL);
            ppstm.setInt(1, last_cart_id);
            rs = ppstm.executeQuery();
            Cart c = new Cart();
            if (rs.next()) {
                c.setCart_id(rs.getInt(1));
                c.setMember_user_username(rs.getString(2));
                c.setOrder_date(rs.getDate(3));
                c.setTotal_price(rs.getFloat(4));
                c.setPayment_status(rs.getString(5));
                c.setTransport_status(rs.getString(6));
            }

            session.setAttribute("cart", c);

            out.print("username" + u.getUsername());

            OrderItem o = new OrderItem(c.getCart_id(), selectedProduct.getP_id(),
                    selectedProduct.getProduct_color_id(), selectedProduct.getPso_id(), selectedProduct.getQuantity());
            session.setAttribute("order_item", o);
            out.print("<br>" + o.getCart_id() + o.getQuantity());
            SQL = "INSERT INTO order_item (cart_id, p_id, product_color_id, pso_id, order_quantity) "
                    + "VALUES (?, ?, ?, ?, ?)";
            ppstm = con.prepareStatement(SQL);
            ppstm.setInt(1, o.getCart_id());
            ppstm.setInt(2, o.getP_id());
            ppstm.setInt(3, o.getProduct_color_id());
            ppstm.setInt(4, o.getPso_id());
            ppstm.setInt(5, o.getQuantity());

            ppstm.executeUpdate();
            out.print("eiseis");
            SQL = "select quantity from pso where p_id = ? and product_color_id = ? and pso_id = ?";
            ppstm = con.prepareStatement(SQL);
            ppstm.setInt(1, selectedProduct.getP_id());
            ppstm.setInt(2, selectedProduct.getProduct_color_id());
            ppstm.setInt(3, selectedProduct.getPso_id());
            rs = ppstm.executeQuery();
            if(rs.next()){
                new_q = rs.getInt(1) - selectedProduct.getQuantity();
            }
            
            out.print("new kuy" + new_q);
            if(selectedProduct.getQuantity() != 0){
                SQL = "update pso set quantity = ? where p_id = ? and product_color_id = ? and  pso_id = ?";
                ppstm = con.prepareStatement(SQL);
                ppstm.setInt(1, new_q);
                ppstm.setInt(2, selectedProduct.getP_id());
                ppstm.setInt(3, selectedProduct.getProduct_color_id());
                ppstm.setInt(4, selectedProduct.getPso_id());
                ppstm.executeUpdate();
            }
            
            out.print("COMPLETE");
            
            response.sendRedirect("home.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(addProductToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
