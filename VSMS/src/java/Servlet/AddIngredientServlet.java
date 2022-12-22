/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.UtilityController;
import DAO.IngredientDAO;
import Model.Ingredient;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Blob;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author TC
 */
@WebServlet(name = "AddIngredientServlet", urlPatterns = {"/AddIngredientServlet"})
public class AddIngredientServlet extends HttpServlet {

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
        try {
        //int supplier_id,String name,String supplyUnit,String subcategory,String description,String offeredPrice
            System.out.println("It comes here");
            int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
            System.out.println("It comes here1");
            String name = request.getParameter("ingredient_name");
            System.out.println("It comes here2");
            String supplyUnit = request.getParameter("unit");
            String subcategory = request.getParameter("category");
            String description = request.getParameter("ingredient_desc");
            String offeredPrice = request.getParameter("offered_price");
            String pictureStr = request.getParameter("image_upload");
            String minimum_order_quantityStr = request.getParameter("minimum_order_quantity");
            String status = request.getParameter("status");
            int minimum_order_quantity = UtilityController.convertStringtoInt(minimum_order_quantityStr);
            System.out.println("name: "+name +"supply unit"+supplyUnit+"subcategory"+subcategory+"description"+description+"offeredprice"+offeredPrice+"picture "+pictureStr);
            InputStream picture = new ByteArrayInputStream(pictureStr.getBytes(StandardCharsets.UTF_8));
            
            Ingredient ingred = new Ingredient(supplier_id, name, supplyUnit, subcategory, description, offeredPrice,picture,minimum_order_quantity, status);

            IngredientDAO.addIngredient(ingred);
        } catch (Exception ex) {

        } finally {
            response.sendRedirect("SupplierAddIngredient.jsp?msg=Ingredient%20Added");
        }

        //response.setContentType("text/html;charset=UTF-8");
        //try (PrintWriter out = response.getWriter()) {
//            //retrieves input from user from Login Page
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//
//            //create a new session
//            HttpSession session = request.getSession();
//
//            //destination
//            String url = "Login.jsp";
//
//           
//
//            //attemptLoginSupplier(email, password);
//            Vendor vendor = attemptLoginVendor(username, password);
//            Supplier supplier = attemptLoginSupplier(username,password);
//            
//            if (vendor == null && supplier == null) {
//                //redirect to login page
//                session.setAttribute("errorMsg", "Invalid e-mail or password entered");
        // }
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
