/*/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.IngredientDAO;
import static DAO.IngredientDAO.getIngredientBySupplier;
import DAO.UserDAO;
import Model.Dish;
import Model.Ingredient;
import Model.Order;
import Model.Supplier;
import Model.Vendor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testservlet/*")
public class TestController extends HttpServlet {

    @Override
    //doPost will be given to Menu.java
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //This String is to store the action that you did.
        String action = request.getParameter("action");

        //A dish needs: dish_id (controller generated),dish_name, vendor_id, dish_description, ingredientQuantity(to be added);
        String dish_name = "Vincent Pie";//request.getParameter("dish_name");
        String dish_description = "Made with only the best Vincents";//request.getParameter("dish_description");
        String vendor_idStr = "1";//request.getParameter("vendor_id");
        String filteredSearchString = "Hello, get here";
        String dish_id = "8";
//        Open out this code if you would like to test out request parameters
//        System.out.println("It reaches here: "+dish_name+","+dish_description+","+vendor_idStr);
        //Check null values to add the creation process

        //This block returns the search result in html format
        if (!UtilityController.checkNullStringArray(new String[]{dish_name, dish_description, vendor_idStr})) {
            System.out.println("Entered first if loop");
            if (action.equals("search")) {
                String word = request.getParameter("word");
//Do this if action equals search                
                System.out.println("Entered second if loop");

                //Give filtered search to be written
                ArrayList<Ingredient> ingredientList;
                //if word is null then give all the list, if word is there then do a filter function
                if (word == null || word.isEmpty()) {
                    System.out.println("Entered third if loop");
                    //get the list of suppliers
                    ingredientList = getIngredientsSuppliedByFav(UtilityController.convertStringtoInt(vendor_idStr));
                } else {
                    System.out.println("Entered else loop");
                    //filter the supplier based on the string word
                    ingredientList = filterIngredientBasedOnWord(word, UtilityController.convertStringtoInt(vendor_idStr));
                    System.out.println("Size of the result ingredientList is: " + ingredientList.size());
                }

                //put them into a html table string
                filteredSearchString = retrieveSupplierHTMLTable(UtilityController.convertStringtoInt(vendor_idStr), ingredientList);
                //put them into scripts for the buttons
//end of series of actions is action.equals search            
            } else if (action.equals("add")) {
                String ingredientName = request.getParameter("ingredient_name");
                String supplierId = request.getParameter("supplier_id");
                Ingredient ingredient = IngredientDAO.getIngredient(supplierId, ingredientName);
                Dish dish = IngredientDAO.getDishByID(UtilityController.convertStringtoInt(dish_id));
                dish.addIngredient(ingredient, "1", ingredient.getSupplyUnit());
                IngredientDAO.updateDish(dish);
                response.sendRedirect("IngredientSearch.jsp?dish_id=" + dish_id);
            }

        }
        //End of code block
        response.setContentType("text/plain");  // Set content type of the response so that AJAX knows what it can expect.
        response.setCharacterEncoding("UTF-8");
        System.out.println(filteredSearchString);
        response.getWriter().write(filteredSearchString);       // Write response body.
//        response.getWriter().write("<font color=\"red\">" + action + " successful</font>");       // Write response body.
    }

    //imported html table method from usercontroller
    public String retrieveSupplierHTMLTable(int vendor_id, ArrayList<Ingredient> ingredientList) {
        StringBuffer htmlTable = new StringBuffer("");

        //Create header
        htmlTable.append("<tr>");
        htmlTable.append("<th>Ingredient Name</th>");
        htmlTable.append("<th>Supplier Name</th>");
        htmlTable.append("</tr>");
        for (Ingredient ingredient : ingredientList) {
            htmlTable.append("<tr>");
            htmlTable.append("<td>" + ingredient.getName() + "</td>");
            htmlTable.append("<td>" + UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getSupplier_name() + "</td>");
            htmlTable.append("<td><a href=\"testservlet?supplier_id=" + ingredient.getSupplier_id() + "&ingredient_name=" + ingredient.getName() + "&action=add\">Add Ingredient</a></td>");
            htmlTable.append("</tr>");
        }
        return htmlTable.toString();
    }

    //End of method block
    @Override
    //doGet will be given to RecipeBuilder.java
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //To query Dish to be attached with an <Ingredient,IngredientQuantity> HashMap
        String dish_idStr = request.getParameter("dish_id");

        //An ingredient needs:dish_name, supplier_id, subcategory, ingredient_description, offeredprice
        String name = request.getParameter("name");
        String supplier_idStr = request.getParameter("supplier_id");
        String subcategory = request.getParameter("subcategory");
        String description = request.getParameter("description");
        String offeredPrice = request.getParameter("offeredPrice");

        String minimum_order_quantityStr = request.getParameter("minimum_order_quantity");
        String status = request.getParameter("status");
        //The ingredientQuantity needs quantity, unit, vendorid
        String quantityStr = request.getParameter("quantity");
        String supplyUnit = request.getParameter("supplyUnit");
        String vendor_idStr = request.getParameter("vendor_id");

        //Open out this code if you would like to test out request parameters
        System.out.println("It reaches here: " + dish_idStr + "," + supplier_idStr + "," + name + "," + supplyUnit + "," + subcategory + "," + description + "," + offeredPrice + "," + quantityStr + "," + supplyUnit + "," + vendor_idStr);

        //Check null values to add the creation process
        if (!UtilityController.checkNullStringArray(new String[]{dish_idStr, supplier_idStr, name, supplyUnit, subcategory, description, offeredPrice, quantityStr, supplyUnit, vendor_idStr})) {

            int supplier_id = UtilityController.convertStringtoInt(supplier_idStr);
            int dish_id = UtilityController.convertStringtoInt(dish_idStr);
            int minimum_order_quantity = UtilityController.convertStringtoInt(minimum_order_quantityStr);
            //Creating a new ingredient and add ingredient quantity
            Dish dish = IngredientDAO.getDishByID(dish_id);
            Ingredient ingredient = new Ingredient(supplier_id, name, supplyUnit, subcategory, description, offeredPrice, minimum_order_quantity, status);
            System.out.println(ingredient);
            // ----- This is to populate parent table (Ingredient) -------//
            IngredientDAO.addIngredient(ingredient);

            // ---- Creating ingredientQuantity based on user inputs ----- // 
            ArrayList<String> ingredientQuantity = new ArrayList<String>();
            ingredientQuantity.add(quantityStr);
            ingredientQuantity.add(ingredient.getSupplyUnit());

            // ----  adding the ingredientQuantity and put new dish ---- // 
            dish.getIngredientQuantity().put(ingredient, ingredientQuantity);

            // --- use this dish to populate IngredientQuantity Table ---- //
            IngredientDAO.updateDish(dish);

            response.sendRedirect("RecipeBuilder.jsp?dish_id=" + dish_id);

        }
        //if action is delete
        if (request.getParameter("action").equals("delete")) {
            IngredientDAO.deleteIngredientQuantity(dish_idStr, name, vendor_idStr, supplier_idStr);
            response.sendRedirect("RecipeBuilder.jsp?dish_id=" + dish_idStr);

            //        Reading the ingredients of a dish
            String ingredientListString = "";

            HashMap<Ingredient, ArrayList<String>> ingredientList = IngredientDAO.getIngredientQuantity(dish_idStr);
            System.out.println("The ingredient list is ");
            if (ingredientList.isEmpty()) {
                System.out.println("it is empty");
            } else {
                System.out.println("Not empty");
            }
            Iterator iter = ingredientList.keySet().iterator();
            while (iter.hasNext()) {
                Ingredient ingredient = (Ingredient) iter.next();
                ArrayList<String> stringArray = ingredientList.get(ingredient);
                ingredientListString += "<li>" + ingredient + "  " + stringArray + " </li>";
            }

            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("");       // Write response body.

        }
    }

    //This code returns all ingredients supplied by favourited suppliers
    public static ArrayList<Ingredient> getIngredientsSuppliedByFav(int vendorId) {
        ArrayList<Supplier> favouriteSuppliers = UserController.retrieveSupplierListByVendor(vendorId);
        ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();
        for (Supplier supplier : favouriteSuppliers) {
            ingredientList.addAll(IngredientController.getIngredientBySupplier(supplier.getSupplier_id()));
        }
        return ingredientList;
    }
    //End of method block

    //This code returns a list of ingredients
    public static ArrayList<Ingredient> filterIngredientBasedOnWord(String word, int ID) {
        ArrayList<Ingredient> returnIngredientList = new ArrayList<Ingredient>();
        //ArrayList<Supplier> favouriteSuppliers=UserController.retrieveSupplierListByVendor(ID);
        //ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();
        //for(Supplier supplier:favouriteSuppliers){
        //   ingredientList.addAll(IngredientController.getIngredientBySupplier(supplier.getSupplier_id()));
        //}
        ArrayList<Ingredient> ingredientList = getIngredientsSuppliedByFav(ID);
        String wordLower = word.toLowerCase();
        for (Ingredient ingredient : ingredientList) {
            String nameLower = ingredient.getName().toLowerCase();
            if (nameLower.contains(wordLower)) {
                returnIngredientList.add(ingredient);
            }
        }
        return returnIngredientList;
    }
    //End of method block

}
