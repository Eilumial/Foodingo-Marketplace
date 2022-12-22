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
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TC
 */
public class EditIngredientServlet extends HttpServlet {

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

            int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));

            String name = request.getParameter("ingredient_name");

            String supplyUnit = request.getParameter("unit");
            String subcategory = request.getParameter("category");
            String description = request.getParameter("ingredient_desc");
            String offeredPrice = request.getParameter("offered_price");
            String pictureStr = request.getParameter("image_upload");
            String minimum_order_quantityStr = request.getParameter("minimum_order_quantity");
            String status = request.getParameter("status");
            int minimum_order_quantity = UtilityController.convertStringtoInt(minimum_order_quantityStr);
           
            System.out.println("name: " + name + "supply unit" + supplyUnit + "subcategory" + subcategory + "description" + description + "offeredprice" + offeredPrice + "picture " + pictureStr);
            InputStream picture = new ByteArrayInputStream(pictureStr.getBytes(StandardCharsets.UTF_8));

            Ingredient ingred = new Ingredient(supplier_id, name, supplyUnit, subcategory, description, offeredPrice, picture,minimum_order_quantity, status);
            
            IngredientDAO.updateIngredient(ingred);
        } catch (Exception ex) {

        } finally {
            response.sendRedirect("SupplierManageIngredients.jsp?msg=Ingredient%20Modified");
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
