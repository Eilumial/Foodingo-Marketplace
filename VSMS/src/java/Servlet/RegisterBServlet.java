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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author TC
 */
@WebServlet(name = "RegisterBServlet", urlPatterns = {"/RegisterBServlet"})
public class RegisterBServlet extends HttpServlet {

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
        String email = request.getParameter("email");
        String userType = request.getParameter("usertype");

        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        boolean pwChk = false;
        if (password1.equals(password2)) {
            pwChk = true;
        }
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String desc = request.getParameter("desc");
        int postal = Integer.parseInt(request.getParameter("postal"));
        int phone_no = Integer.parseInt(request.getParameter("phone"));
        int area_code = Integer.parseInt(request.getParameter("country"));

        String msg = "";
        if (pwChk) {
            if (userType.equals("vendor")) {
                //vendor
                //public Vendor(int vendor_id, String password, String vendor_name, String vendor_description, String email, int area_code, int telephone_number, String address, int zipcode) {
                int vendor_id = UserDAO.getAvailableVendorID();
                Vendor v = new Vendor(vendor_id, DigestUtils.sha1Hex(password1), name, desc, email, area_code, phone_no, address, postal);

                UserDAO.signUpVendor(v);

                msg = "Registration Successful!";
                request.setAttribute("msg", msg);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterC.jsp");
                dispatcher.forward(request, response);
            } else if (userType.equals("supplier")) {
                int supplier_id = UserDAO.getAvailableSupplierID();
                String supplier_type = request.getParameter("supplier_type");
                int min_leadtime = Integer.parseInt(request.getParameter("min_leadtime"));
                int max_leadtime = Integer.parseInt(request.getParameter("max_leadtime"));
                //public Supplier(int supplier_id, String password, String supplier_name, String supplier_description, String supplier_type, String email, int area_code, int telephone_number, String address, int zipcode, int min_leadtime, int max_leadtime) {
                Supplier s = new Supplier(supplier_id, DigestUtils.sha1Hex(password1), name, desc, supplier_type, email, area_code,phone_no, address, postal, min_leadtime, max_leadtime);
                
                UserDAO.signUpSupplier(s);
                
                msg = "Registration Successful!";
                request.setAttribute("msg", msg);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterC.jsp");
                dispatcher.forward(request, response);
            }

        } else {
            msg = "Passwords entered don't match";
            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterB.jsp");
            dispatcher.forward(request, response);
        }

//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RegisterBServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RegisterBServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
