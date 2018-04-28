///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import model.User;
//
///**
// *
// * @author Brightonter
// */
//@WebServlet(urlPatterns = {"/ManageServlet.do"})
//public class ManageServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, SQLException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            Connection con = (Connection) getServletContext().getAttribute("Connection");
//            User m = new User();
//            String dob = request.getParameter("dob");
//            String fname = request.getParameter("fname");
//            String lname = request.getParameter("lname");
//            String email = request.getParameter("email");
//            String mobile = request.getParameter("mobile");
//            
//            m.setAll(
//                    request.getParameter("dob"),
//                    request.getParameter("fname"),
//                    request.getParameter("lname"),
//                    request.getParameter("email"),
//                    request.getParameter("mobile")
//            );
//            
//            HttpSession session = request.getSession();
//            
//            String SQL = "UPDATE member "
//                    + "SET dob = ?, fname = ?, lname = ?, email = ?, mobile = ?"
//                    + "WHERE username = ?";
//            PreparedStatement ppstm = con.prepareStatement(SQL);
//            ppstm.setString(1, m.getDob());
//            ppstm.setString(2, m.getfname());
//            ppstm.setString(3, m.getlname());
//            ppstm.setString(4, m.getEmail());
//            ppstm.setString(5, m.getMobile());
//            ppstm.setString(6, (String) session.getAttribute("username"));
//            ppstm.executeUpdate();
//            
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Complete!!!');");
//            out.println("location='manageaccount.jsp';");
//            out.println("</script>");
//            
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(ManageServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(ManageServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
