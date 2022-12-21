/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.IngredientDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.Dish;
import Model.Ingredient;
import Model.Order;
import Model.Orderline;
import Model.Supplier;
import Model.Vendor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import javamail.EmailController;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderservlet/*")
public class OrderController extends HttpServlet {

    @Override
    //doPost will be given to Order.java
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //An order order_id, vendor_id, total_final_price, dt_order;

        //A dish will have int dish_id; String dish_name; int vendor_id;String dish_description;HashMap<Ingredient, ArrayList<String>> ingredientQuantity;
        //An ingredient will have  int supplier_id; String name;private String supplyUnit;private String subcategory;private String description;private String offeredPrice;
        //A OrderLine will have int vendor_id;int order_id;int supplier_id;String ingredient_name;double finalprice;int quantity;double bufferpercentage;
        //An  order int order_id,int vendor_id; double total_final_price;Date dt_order;ArrayList<Orderline> orderlines;
        ArrayList<Dish> dishList = IngredientDAO.getDish("1");
        String vendor_idStr = request.getParameter("vendor_id");

        //supplier id and order id is auto generated
        //final price is aggregated, ingredient name is there
        //check if the form is submitted or not, if the form is submitted then the dish_countStr should not be null
        if (!UtilityController.checkNullStringArray(new String[]{vendor_idStr})) {
            //Create a hashmap with <Dishid, quantity input)
            HashMap<Integer, Integer> dishQuantityMap = createDishQuantityMap(dishList, request);
            int vendor_id = UtilityController.convertStringtoInt(vendor_idStr);

            //Create an hashmap with <Ingredient, aggregated quantity> (TESTED)
            HashMap<Ingredient, Integer> ingredientAggQuantityMap = createIngredientAggQuantityMap(dishQuantityMap);
            //Make an arraylist of all orderline (non aggregated)
            ArrayList<Orderline> orderlineList = createOrderlineList(ingredientAggQuantityMap, vendor_id, getLatestOrderID() + 1);
            //Create a hashmap of orderlines based on suppliers
            HashMap<Supplier, ArrayList<Orderline>> supplierOrderlineMap = createSupplierOrderlineMap(orderlineList);
            //Create a hashmap of Order based on suppliers
            HashMap<Supplier, Order> SupplierOrderMap = createSupplierOrderMap(supplierOrderlineMap, getLatestOrderID() + 1, vendor_id);

            //iterate the output
            Iterator iter = SupplierOrderMap.keySet().iterator();
            while (iter.hasNext()) {
                Supplier supplier = (Supplier) iter.next();
                Order order = SupplierOrderMap.get(supplier);
                //Do 2 things: 1. Insert these orders inside the database 2. send these orders to the suppliers and vendors with email
                addOrder(order);

                //MailController Method
//              Will send the email to all the suppliers and the vendor
                EmailController.sendMessageToVendorSupplier(order, UserDAO.getVendorByID(vendor_id));

            }
            response.sendRedirect("Order.jsp");
        }

        String dishListString = "";

        for (Dish dish : dishList) {
            //Create a component inside the table one <tr> at a time
            dishListString += "<tr>";
            dishListString += "<td>" + dish + "</td>";
            dishListString += "<td><input type=\"text\" value=1 name=\"dish" + dish.getDish_id() + "\"/></td>";
            dishListString += "</tr>";
        }

        response.setContentType("text/plain");  // Set content type of the response so that AJAX knows what it can expect.
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(dishListString);       // Write response body.
    }

//    Test controller
//    public static void main(String[] args) {
//        ArrayList<Order> orderList = OrderDAO.retrieveAllOrderList();
//        for (Order order: orderList){
//            System.out.println(order);
//        }
//    }
    public static HashMap<Integer, Integer> createDishQuantityMap(ArrayList<Dish> dishList, HttpServletRequest request) {
//            Prepare array to store the map of dish id and the quantity put
        HashMap<Integer, Integer> dishQuantityMap = new HashMap<Integer, Integer>();

//            This will iterate through the list of the dishes and names
        for (Dish dish : dishList) {
            //Read the parameter quantity for this particular dish
            String quantityStr = request.getParameter("dish" + dish.getDish_id());
            int quantity = UtilityController.convertStringtoInt(quantityStr);
            //put this inside the hashmap
            dishQuantityMap.put(dish.getDish_id(), quantity);
        }
        //for debugging purpose
        System.out.println(dishQuantityMap.toString());
        return dishQuantityMap;
    }

    public HashMap<Ingredient, Integer> createIngredientAggQuantityMap(HashMap<Integer, Integer> dishQuantityMap) {
        HashMap<Ingredient, Integer> ingredientAggQuantityMap = new HashMap<Ingredient, Integer>();

        //iterate through dishQuantityMap
        Iterator iter = dishQuantityMap.keySet().iterator();
        while (iter.hasNext()) {
            int dish_id = (int) iter.next();
            int quantityOrder = dishQuantityMap.get(dish_id);

            Dish dish = IngredientDAO.getDishByID(dish_id);
            //Open the dish to ingredients and accumulate their quantity
            HashMap<Ingredient, ArrayList<String>> ingredientQuantity = dish.getIngredientQuantity();
            Iterator iterIngQuantity = ingredientQuantity.keySet().iterator();
            while (iterIngQuantity.hasNext()) {
                Ingredient ingredient = (Ingredient) iterIngQuantity.next();
                ArrayList<String> quantityUnitStr = ingredientQuantity.get(ingredient);
                String quantityStr = quantityUnitStr.get(0);
                String unit = quantityUnitStr.get(1);

                //aggregate the quantity
                int quantityAgg = quantityOrder * UtilityController.convertStringtoInt(quantityStr);

                if (!ingredientAggQuantityMap.containsKey(ingredient)) {
                    //insert ingredient and aggregated quantity to map
                    ingredientAggQuantityMap.put(ingredient, quantityAgg);
                } else {
                    //poll ingredient and aggregated quantity to map
                    ingredientAggQuantityMap.put(ingredient, ingredientAggQuantityMap.get(ingredient) + quantityAgg);
                }
            }
        }
        //for debugging purpose
        System.out.println(dishQuantityMap.toString());
        return ingredientAggQuantityMap;
    }

    public ArrayList<Orderline> createOrderlineList(HashMap<Ingredient, Integer> ingredientAggQuantityMap, int vendor_id, int order_id) {
        ArrayList<Orderline> orderlineList = new ArrayList<Orderline>();

        //iterate through ingredientAggQuantityMap
        Iterator iter = ingredientAggQuantityMap.keySet().iterator();
        while (iter.hasNext()) {
            Ingredient ingredient = (Ingredient) iter.next();
            int aggQuantity = ingredientAggQuantityMap.get(ingredient);

            //    an orderline needs int vendor_id, int order_id, int supplier_id, String ingredient_name, double finalprice, int quantity, double bufferpercentage        //A OrderLine will have int vendor_id;int order_id;int supplier_id;String ingredient_name;double finalprice;int quantity;double bufferpercentage;
            Orderline orderline = new Orderline(vendor_id, order_id, ingredient.getSupplier_id(), ingredient.getName(), UtilityController.convertStringtoInt(ingredient.getOfferedPrice()) * aggQuantity, aggQuantity, 0.0);
            orderlineList.add(orderline);
        }
        //for debugging purpose
        System.out.println(orderlineList.toString());
        return orderlineList;
    }

    public HashMap<Supplier, ArrayList<Orderline>> createSupplierOrderlineMap(ArrayList<Orderline> orderlineList) {
        HashMap<Supplier, ArrayList<Orderline>> supplierOrderlineListMap = new HashMap<Supplier, ArrayList<Orderline>>();

        //iterate through orderlineList
        for (Orderline orderline : orderlineList) {
            Supplier supplier = UserDAO.getSupplierById(orderline.getSupplier_id());

            //do polling of map
            if (!supplierOrderlineListMap.containsKey(supplier)) {
                ArrayList<Orderline> mapOrderlineList = new ArrayList<Orderline>();
                mapOrderlineList.add(orderline);
                supplierOrderlineListMap.put(supplier, mapOrderlineList);
            } else {
                ArrayList<Orderline> mapOrderlineList = supplierOrderlineListMap.get(supplier);
                mapOrderlineList.add(orderline);
                supplierOrderlineListMap.put(supplier, mapOrderlineList);
            }
        }
        //for debugging purpose
        System.out.println(supplierOrderlineListMap.toString());
        return supplierOrderlineListMap;
    }

    public HashMap<Supplier, Order> createSupplierOrderMap(HashMap<Supplier, ArrayList<Orderline>> supplierOrderlineMap, int order_id, int vendor_id) {
        HashMap<Supplier, Order> supplierOrderMap = new HashMap<Supplier, Order>();

        //iterate through dishQuantityMap
        Iterator iter = supplierOrderlineMap.keySet().iterator();
        while (iter.hasNext()) {
            Supplier supplier = (Supplier) iter.next();
            ArrayList<Orderline> orderlineList = supplierOrderlineMap.get(supplier);
            //  order has int order_id, int vendor_id, double total_final_price, Date dt_order, ArrayList<Orderline> orderlines) {
            Order order = new Order(order_id, vendor_id, createAggFinalPrice(orderlineList),new Date(), orderlineList);
            supplierOrderMap.put(supplier, order);
            //to compensate for subsequent orders, so that there would be no duplication
            order_id+=1;
        }
        //for debugging purpose
        System.out.println(supplierOrderMap.toString());
        return supplierOrderMap;
    }

    public static double createAggFinalPrice(ArrayList<Orderline> orderlineList) {
        double aggFinalPrice = 0.0;
        for (Orderline orderline : orderlineList) {
            aggFinalPrice += orderline.getFinalprice();
        }
        return aggFinalPrice;
    }

    public static int getLatestOrderID() {
        int latest = 0;
        ArrayList<Order> orderList = retrieveAllOrderList();
        for (Order order : orderList) {
            int order_id = order.getOrder_id();
            if (latest < order_id) {
                latest = order_id;
            }
        }
        return latest;
    }

    public static ArrayList<Order> retrieveAllOrderList() {
        return OrderDAO.retrieveAllOrderList();
    }

    public static Order retrieveOrderByID(int order_id) {
        return OrderDAO.retrieveOrderByID(order_id);
    }

    public static ArrayList<Order> retrieveOrderList(int vendor_id) {
        return OrderDAO.retrieveOrderList(vendor_id);
    }

    public static ArrayList<Orderline> retrieveOrderLineList(int vendor_id, int order_id) {
        return OrderDAO.retrieveOrderLineList(vendor_id, order_id);
    }

    public static void addOrder(Order order) {
        OrderDAO.addOrder(order);
    }

    public static void deleteOrder(Order order) {
        OrderDAO.deleteOrder(order);
    }

}
