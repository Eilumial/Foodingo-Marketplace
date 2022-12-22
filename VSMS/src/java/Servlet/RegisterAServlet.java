/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.UtilityController;
import DAO.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TC
 */
@WebServlet(name = "RegisterAServlet", urlPatterns = {"/RegisterAServlet"})
public class RegisterAServlet extends HttpServlet {

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

        String msg = "";
        try {
        //int supplier_id,String name,String supplyUnit,String subcategory,String description,String offeredPrice

            //int email = Integer.parseInt(request.getParameter("supplier_id"));
            String email = request.getParameter("email");
            String userType = request.getParameter("usertype");
            //false if email check failed
            boolean emailCheck = UtilityController.validateEmail(email);
            //boolean existCheck;

            //true if email syntax is valid
            if (!emailCheck) {
                //email is invalid syntax
                msg += "Please enter a valid email address.";
                response.sendRedirect("RegisterA.jsp?msg=" + msg);
            } else {
                //true if an account with this email already exists, false if not
                if (UserDAO.checkSupplierEmail(email) || UserDAO.checkVendorEmail(email)) {

                    msg += "An account with this email already exists.";
                    response.sendRedirect("RegisterA.jsp?msg=" + msg);

                } else {
                    //email is valid and no account exists in db
                    request.setAttribute("email", email);
                    request.setAttribute("usertype", userType);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterB.jsp");
                    dispatcher.forward(request, response);
                    //response.sendRedirect("RegisterB.jsp");
                }

            }

            //response.sendRedirect("SupplierAddIngredient.jsp?msg=Ingredient%20Added");
            //Ingredient ingred = new Ingredient(supplier_id, name, supplyUnit, subcategory, description, offeredPrice);
            //IngredientDAO.addIngredient(ingred);
        } catch (Exception ex) {

        } finally {

        }

//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RegisterAServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RegisterAServlet at " + request.getContextPath() + "</h1>");
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
