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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MemberAddress;

/**
 *
 * @author Brightonter
 */
@WebServlet(urlPatterns = {"/SetServlet.do"})
public class SetServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            ServletContext context = getServletContext();
            Connection conn = (Connection) context.getAttribute("Connection");
            HttpSession session = request.getSession();
            
            MemberAddress m = new MemberAddress();
            m.setAll(
                    request.getParameter("address"),
                    request.getParameter("city"),
                    request.getParameter("code"),
                    request.getParameter("country"),
                    request.getParameter("fname"),
                    request.getParameter("lname"),
                    request.getParameter("mobile")
            );

            PreparedStatement apply = conn.prepareStatement(
                    "UPDATE member_address SET addr_fname = ?, addr_lname = ?, addr_mobile = ?, address = ?, country = ?, city = ?, postcode = ?"
                            + " WHERE username = ? AND id_address = ?"
            );
            out.println("HelloWorld");
            out.println(session.getAttribute("id_addr"));
            apply.setString(1, m.getFname());
            apply.setString(2, m.getLname());
            apply.setString(3, m.getMobile());
            apply.setString(4, m.getAddress());
            apply.setString(5, m.getCountry());
            apply.setString(6, m.getCity());
            apply.setString(7, m.getPostcode());
            apply.setString(8, (String) session.getAttribute("username"));
            apply.setString(9, request.getParameter("apply"));
            apply.executeUpdate();

            

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Apply Complete!!!');");
            out.println("location='setting.jsp';");
            out.println("</script>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SetServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SetServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
