/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.IngredientController;
import Controller.UtilityController;
import DAO.IngredientDAO;
import Model.Dish;
import Model.Ingredient;
import Model.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author David
 */
@WebServlet(name = "OrderByIngredientServlet", urlPatterns = {"/OrderByIngredientServlet"})
public class OrderByIngredientServlet extends HttpServlet {

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
        //This code block initializes variables paased in from form
        HttpSession session = request.getSession(true);
        String action=request.getParameter("action");
        System.out.println(action);
        String cartId=request.getParameter("CartId");
        System.out.println(cartId);
        String ingredientname=request.getParameter("ingredientname");
        System.out.println(ingredientname);
        String supplierId=request.getParameter("supplierId");
        System.out.println(supplierId);
        String ingredientQuantity=request.getParameter("quantity");
        System.out.println(ingredientQuantity);
        Ingredient ingredient=IngredientController.getIngredient(supplierId, ingredientname);
        int cartNum=UtilityController.convertStringtoInt(cartId);
        Dish ShoppingCart=IngredientDAO.getIngredientTemplateByID(cartNum);
        //End variable initialization
        //This code block takes in gets the shopping cart from database and adds ingredients to it
        if(action.equals("add")){    
            System.out.println(ShoppingCart==null);
            System.out.println(ingredient==null);
            ShoppingCart.addIngredient(ingredient, ingredientQuantity, ingredient.getSupplyUnit());
            IngredientDAO.updateIngredientTemplate(ShoppingCart);
            response.sendRedirect("SupplierSearch.jsp");
        }else if(action.equals("delete")){
        //End code block
        //This code block removes an ingredient from the shopping cart
            ShoppingCart.deleteIngredient(ingredient);
            IngredientDAO.updateIngredientTemplate(ShoppingCart);
            response.sendRedirect("SupplierSearch.jsp");
        //End removing ingredient
        //This code block
        }else if(action.equals("invalidate")){
        //delete the temporary shopping cart upon logout
            IngredientDAO.deleteIngredientTemplate(ShoppingCart);
            response.sendRedirect("Login.jsp");
        }else if(action.equals("save")){
            ShoppingCart.setDish_name(request.getParameter("name"));
            System.out.println(request.getParameter("name"));
            ShoppingCart.setDish_description(request.getParameter("description"));
            System.out.println(request.getParameter("description"));
            IngredientDAO.updateIngredientTemplate(ShoppingCart);
            Dish cart = new Dish(IngredientDAO.getIngredientTemplateID("1"), "Shopping Cart", 1, "A cart to place your ingredients in");
            session.setAttribute("CartId", cart.getDish_id());
            IngredientDAO.addIngredientTemplate(cart);
            response.sendRedirect("ShoppingCartDisplay.jsp");
            
        }else if(action.equals("select")){
            IngredientDAO.setSelectColumn(ShoppingCart.getVendor_id(), cartNum);
            response.sendRedirect("ManageTemplate.jsp");
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
        //System.out.print("something was sent here");
        //response.sendRedirect("TestButton.jsp");
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
