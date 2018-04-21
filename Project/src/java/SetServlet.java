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
import model.Manage_Address;
import model.Member;

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
            
            Manage_Address m = new Manage_Address();
            m.setAll(
                    request.getParameter("address"),
                    request.getParameter("city"),
                    request.getParameter("code"),
                    request.getParameter("country")
            );
            Member m1 = new Member();
            m1.setAll(
                    request.getParameter("dob"),
                    request.getParameter("fname"),
                    request.getParameter("lname"),
                    request.getParameter("email"),
                    request.getParameter("mobile")
            );
            
            PreparedStatement apply = conn.prepareStatement(
                    "UPDATE member_address JOIN member USING(username) SET address = ?, dob = ?, first_name = ?, last_name = ?, email = ?, mobile = ?, country = ?, city = ?, postcode = ? WHERE username = ?"
            );

            apply.setString(1, m.getAddress());
            apply.setString(2, m1.getDob());
            apply.setString(3, m1.getFirst_name());
            apply.setString(4, m1.getLast_name());
            apply.setString(5, m1.getEmail());
            apply.setString(6, m1.getMobile());
            apply.setString(7, m.getCountry());
            apply.setString(8, m.getCity());
            apply.setString(9, m.getPostcode());
            apply.setString(10, (String) session.getAttribute("username"));
            apply.execute();

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
