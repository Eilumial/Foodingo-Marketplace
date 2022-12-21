/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.IngredientDAO;
import Model.Dish;
import Model.Ingredient;
import Model.Order;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ingredientservlet/*")
public class IngredientController extends HttpServlet {

    @Override
    //doPost will be given to Menu.java
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //A dish needs: dish_id (controller generated),dish_name, vendor_id, dish_description, ingredientQuantity(to be added);
        String dish_name = request.getParameter("dish_name");
        String dish_description = request.getParameter("dish_description");
        String vendor_idStr = request.getParameter("vendor_id");
        
//        Open out this code if you would like to test out request parameters
//        System.out.println("It reaches here: "+dish_name+","+dish_description+","+vendor_idStr);
        
        //Check null values to add the creation process
        if(!UtilityController.checkNullStringArray(new String[]{dish_name,dish_description,vendor_idStr})){
            // Getting the id of dish and vendors
            //Get the number of dishes and add by one to become dish_id and create blank ingredient dish first. 
            //This is less efficient, cause need to call dishes at least twice, but it would be faster than iterating or filtering alldish
            ArrayList<Dish> getAllDish = getAllDish();
            int dish_id = getAllDish.size()+1;
            int vendor_id = UtilityController.convertStringtoInt(vendor_idStr);

            addDish(new Dish(dish_id,dish_name,vendor_id,dish_description));
            response.sendRedirect("Menu.jsp");

        }
        
        String dishListString = "";        
        ArrayList<Dish> dishList = getDish("1");
        
        for (Dish dish :dishList){
            dishListString += "<li>"+dish+"</li>";
            dishListString += "<a href=\"RecipeBuilder.jsp?dish_id="+dish.getDish_id()+"\"> Edit </a>";
        }
        
        response.setContentType("text/plain");  // Set content type of the response so that AJAX knows what it can expect.
        response.setCharacterEncoding("UTF-8"); 
        response.getWriter().write(dishListString);       // Write response body.
    }
    
    @Override
    //doGet will be given to RecipeBuilder.java
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //To query Dish to be attached with an <Ingredient,IngredientQuantity> HashMap
        String dish_idStr = request.getParameter("dish_id");
        
        //An ingredient needs:dish_name, supplier_id, subcategory, ingredient_description, offeredprice
        String name = request.getParameter("name");
        String supplier_idStr = request.getParameter("supplier_id");
        String subcategory = request.getParameter("subcategory");
        String description = request.getParameter("description");
        String offeredPrice = request.getParameter("offeredPrice");
        
        //The ingredientQuantity needs quantity, unit, vendorid
        String quantityStr = request.getParameter("quantity");
        String supplyUnit = request.getParameter("supplyUnit");
        String vendor_idStr = request.getParameter("vendor_id");
        
        
        //Open out this code if you would like to test out request parameters
        System.out.println("It reaches here: "+dish_idStr+","+supplier_idStr+","+name+","+supplyUnit+","+subcategory+","+description+","+offeredPrice+","+quantityStr+","+supplyUnit+","+vendor_idStr);
        
        //Check null values to add the creation process
        if(!UtilityController.checkNullStringArray(new String[]{dish_idStr,supplier_idStr,name,supplyUnit,subcategory,description,offeredPrice,quantityStr,supplyUnit,vendor_idStr})){
            
            int supplier_id = UtilityController.convertStringtoInt(supplier_idStr); 
            int dish_id = UtilityController.convertStringtoInt(dish_idStr);
            
            //Creating a new ingredient and add ingredient quantity
            Dish dish = getDishByID(dish_id); 
            Ingredient ingredient = new Ingredient(supplier_id,name,supplyUnit, subcategory,description,offeredPrice);
            System.out.println(ingredient);
            // ----- This is to populate parent table (Ingredient) -------//
            addIngredient(ingredient);
            
            // ---- Creating ingredientQuantity based on user inputs ----- // 
            ArrayList<String> ingredientQuantity = new ArrayList<String>();
            ingredientQuantity.add(quantityStr);
            ingredientQuantity.add(ingredient.getSupplyUnit());
            
            // ----  adding the ingredientQuantity and put new dish ---- // 
            dish.getIngredientQuantity().put(ingredient, ingredientQuantity);
           
            // --- use this dish to populate IngredientQuantity Table ---- //
            updateDish(dish);
            
            response.sendRedirect("RecipeBuilder.jsp?dish_id="+dish_id);
            
          }
        
        
        //        Reading the ingredients of a dish
        String ingredientListString = "";
        
        HashMap<Ingredient,ArrayList<String>> ingredientList =  getIngredientQuantity(dish_idStr);
        System.out.println("The ingredient list is ");
        if(ingredientList.isEmpty()){
            System.out.println("it is empty");
        } else{
            System.out.println("Not empty");
        }
        Iterator iter = ingredientList.keySet().iterator();
        while (iter.hasNext()){
            Ingredient ingredient = (Ingredient)iter.next();
            ArrayList<String> stringArray = ingredientList.get(ingredient);
            ingredientListString += "<li>"+ingredient+" "+stringArray+"</li>";
        }
        
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); 
        response.getWriter().write(ingredientListString);       // Write response body.
        
    }

    public static Dish getDishByID(int dish_id){
        return IngredientDAO.getDishByID(dish_id);
    }
    public static ArrayList<Ingredient> getIngredientBySupplier(int supplier_id) {
        return IngredientDAO.getIngredientBySupplier(supplier_id);
    }

    public static Ingredient getIngredient(String supplierId, String ingredientName) {
        return IngredientDAO.getIngredient(supplierId, ingredientName);
    }

    public static void addIngredient(Ingredient ingredient) {
        IngredientDAO.addIngredient(ingredient);
    }

    public static void deleteIngredient(Ingredient ingredient) {
        IngredientDAO.deleteIngredient(ingredient);
    }

    public static void updateIngredient(Ingredient ingredient) {
        IngredientDAO.updateIngredient(ingredient);
    }
    
    public static ArrayList<Dish> getAllDish() {
        return IngredientDAO.getAllDish();
    }
    
    public static ArrayList<Dish> getDish(String vendor_id) {
        return IngredientDAO.getDish(vendor_id);
    }

    public static HashMap<Ingredient, ArrayList<String>> getIngredientQuantity(String dish_id) {
        return IngredientDAO.getIngredientQuantity(dish_id);
    }

    public static void addDish(Dish dish) {
        IngredientDAO.addDish(dish);
    }

    public static void addIngredientQuantity(Ingredient ingredient, String quantity, String unit, String dish_id, String vendor_id) {
        IngredientDAO.addIngredientQuantity(ingredient, quantity, unit, dish_id, vendor_id);
    }

    public static void deleteDish(Dish dish) {
        IngredientDAO.deleteDish(dish);
    }

    public static void deleteIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id) {
        IngredientDAO.deleteIngredientQuantity(dish_id, ingredient_name, vendor_id, supplier_id);
    }

    public static void updateDish(Dish dish) {
        IngredientDAO.updateDish(dish);
    }

    public static void updateIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id, String quantity, String unit) {
        IngredientDAO.updateIngredientQuantity(dish_id, ingredient_name, vendor_id, supplier_id, quantity, unit);
    }

    public static ArrayList<Integer> getSupplierIdByIngredient(String ingredient_name) {
        return IngredientDAO.getSupplierIdByIngredient(ingredient_name);
    }
}
