/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import Model.Supplier;
import Model.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Joel
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
       // response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //vincentt.2013@sis.smu.edu.sg

            //retrieves input from user from Login Page
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //create a new session
            HttpSession session = request.getSession();

            //destination
            String url = "Login.jsp";

           

            //attemptLoginSupplier(email, password);
            Vendor vendor = attemptLoginVendor(username, password);
            Supplier supplier = attemptLoginSupplier(username,password);
            
            if (vendor == null && supplier == null) {
                //redirect to login page
                session.setAttribute("errorMsg", "Invalid e-mail or password entered");
            } else if (vendor != null && supplier == null) {
                //redirect to vendor home
                url = "Home.jsp";
                session.setAttribute("currentVendor", vendor);
                session.setAttribute("errorMsg", null);

            } else if (vendor == null && supplier != null) {
                //redirect to supplier home
                url = "SupplierHome.jsp";
                session.setAttribute("currentSupplier", supplier);
                session.setAttribute("errorMsg", null);
            } else {
                request.setAttribute("errorMsg", "Invalid email or password entered.");
            }
            //redirect to respective pages
            
             out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            //RequestDispatcher view = request.getRequestDispatcher(url);
            //view.forward(request, response);
            response.sendRedirect(url);

        } finally {
            out.flush();
            out.close();
        }
    }

    private Vendor attemptLoginVendor(String username, String password) {

        Vendor vendor = UserDAO.loginVendor(username, DigestUtils.sha1Hex(password));
//        int actualEmail = vendor.getVendor_id();
        return vendor;

    }

    private Supplier attemptLoginSupplier(String username, String password) {

        Supplier supplier = UserDAO.loginSupplier(username, DigestUtils.sha1Hex(password));
//        String actualEmail = supplier.getEmail();
        return supplier;
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
