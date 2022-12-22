/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author Benjamin
 */
import Controller.ConnectionManager;
import Controller.UtilityController;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.*;

public class OrderDAO {

    private static void handleSQLException(SQLException e, String sql, String... parameters) {
        String msg = "Unable to access data. SQL : " + sql + "\n";

        for (String para : parameters) {
            msg += para + "\n";

        }

        Logger.getLogger(UserDAO.class
                .getName()).log(Level.SEVERE, msg, e);
        throw new RuntimeException(msg, e);
    }

    //methods retrieves ALL orders in the database regardless of vendor or supplier
    public static ArrayList<Order> retrieveAllOrderList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from `order`";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders from the database
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int vendor_id = rs.getInt("vendor_id");
                double total_final_price = rs.getDouble("total_final_price");
                Date dt_order = rs.getDate("dt");
                String status = rs.getString("status");
                Date expected_delivery = rs.getDate("expected_delivery");
                String special_request = rs.getString("special_request");
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                Order order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList, status, expected_delivery, special_request);
                orderList.add(order);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return orderList;
    }

    //retrieve all order on that are expected to be delivered at the input date.
    public static ArrayList<Order> retrieveOrderByDate(int vendorId, Date date) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from `order` WHERE vendor_id =" + vendorId + " && expected_delivery = " + date;
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders from the database
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int vendor_id = rs.getInt("vendor_id");
                double total_final_price = rs.getDouble("total_final_price");
                Date dt_order = rs.getDate("dt");
                String status = rs.getString("status");
                Date expected_delivery = rs.getDate("expected_delivery");
                String special_request = rs.getString("special_request");
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                Order order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList, status, expected_delivery, special_request);
                orderList.add(order);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return orderList;
    }

//methods retrieves order from order id    
    public static Order retrieveOrderByID(int order_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Order order = null;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from `order` WHERE order_id = ##";
            sql = sql.replace("##", "" + order_id);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            while (rs.next()) {
                int vendor_id = rs.getInt("vendor_id");

                //int vendor_id = rs.getInt("vendor_id");
                double total_final_price = rs.getDouble("total_final_price");
                Date dt_order = rs.getDate("dt");
                String status = rs.getString("status");
                Date expected_delivery = rs.getDate("expected_delivery");
                String special_request = rs.getString("special_request");
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList, status, expected_delivery, special_request);

            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return order;
    }

    //methods retrieves all order from a particular vendor
    public static ArrayList<Order> retrieveOrderList(int vendor_id) {
        ConnectionManager connManager = new ConnectionManager();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            //creates connections to database
            conn = connManager.getConnection();
            sql = "Select * from `order` WHERE vendor_id = ##";
            sql = sql.replace("##", "" + vendor_id);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            while (rs.next()) {
                int order_id = rs.getInt("order_id");

                //int vendor_id = rs.getInt("vendor_id");
                double total_final_price = rs.getDouble("total_final_price");
                Date dt_order = rs.getDate("dt");
                String status = rs.getString("status");
                Date expected_delivery = rs.getDate("expected_delivery");
                String special_request = rs.getString("special_request");
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                Order order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList, status, expected_delivery, special_request);

                orderList.add(order);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }
        return orderList;
    }

    //methods retrieves all order templates from a particular vendor
    public static ArrayList<OrderTemplate> retrieveOrderTemplates(int vendor_id) {
        ConnectionManager connManager = new ConnectionManager();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<OrderTemplate> templateList = new ArrayList<OrderTemplate>();
        try {
            //creates connections to database
            conn = connManager.getConnection();
            sql = "Select * from `order_template` WHERE vendor_id = ## order by order_id";
            sql = sql.replace("##", "" + vendor_id);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            ArrayList<Integer> checkList = new ArrayList<Integer>();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                String name = rs.getString("name");

                OrderTemplate template = new OrderTemplate(order_id, vendor_id, name);
                populateOrderTemplates(template);
                templateList.add(template);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }
        return templateList;
    }

    //starts code to generate order_id for template

    public static int generateTemplateId(String vendor_id) {
        ConnectionManager connManager = new ConnectionManager();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        int orderId = 0;
        try {
            //creates connections to database
            conn = connManager.getConnection();
            sql = "Select * from `order_template` WHERE vendor_id = ## order by order_id asc; ";
            sql = sql.replace("##", "" + vendor_id);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            while (rs.next()) {
                orderId = rs.getInt("order_id");

            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }
        return orderId;

    }

    //End code to generate order_id for template
    //Start population of order quantity
    public static void populateOrderTemplates(OrderTemplate template) {
        ConnectionManager connManager = new ConnectionManager();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            //creates connections to database
            conn = connManager.getConnection();
            sql = "Select * from `template_quantity` WHERE order_id = ## ";
            sql = sql.replace("##", "" + template.getOrder_id());
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            while (rs.next()) {
                int dish_id = rs.getInt("dish_id");
                int dish_quantity = rs.getInt("dish_quantity");

                template.addDish(IngredientDAO.getDishByID(dish_id));
                template.addInt(dish_quantity);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }

    }
    //End population of order quantity

    //Method to verify that a template name has not been used
    public static boolean verifyTemplateName(String name, int vendor_id) {
        int i = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        //insert new order into data base
        try {
            conn = ConnectionManager.getConnection();
            sql = "select * from order_template where vendor_id=#1 AND name=#2";
            sql = sql.replace("#1", "" + "'" + vendor_id + "'");
            sql = sql.replace("#2", "" + "'" + name + "'");
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return i == 0;
    }
    //End of method to ensure uniqueness of template names

//Method to save template to database
    public static void saveTemplate(OrderTemplate template) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        //insert new order into data base
        try {
            conn = ConnectionManager.getConnection();
            sql = "insert into order_template( order_id, vendor_id, name) values (#1,#2,#3)";
            sql = sql.replace("#1", "" + template.getOrder_id());
            sql = sql.replace("#2", "" + template.getVendor_id());
            sql = sql.replace("#3", "" + "'" + template.getName() + "'");
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();

            ArrayList<Dish> dishList = template.getDishList();
            for (int i = 0; i < dishList.size(); i++) {
                Dish dish = dishList.get(i);
                sql = "insert into template_quantity (order_id, dish_id, dish_quantity) values (#1,#2,#3)";
                sql = sql.replace("#1", "" + template.getOrder_id());
                sql = sql.replace("#2", "" + dish.getDish_id());
                sql = sql.replace("#3", "" + template.getStringList().get(i));
                stmt = conn.prepareStatement(sql);
                stmt.executeUpdate();

            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }
    //End method to save template to database

    //Method to save changes to an order template to database
    public static void updateTemplate(OrderTemplate template) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        //insert new order into data base
        try {
            conn = ConnectionManager.getConnection();
            sql = "UPDATE `order_template`" + " SET name = #1" + " WHERE order_id=#2 && vendor_id=#3";
            sql = sql.replace("#1", "" + "'" + template.getName() + "'");
            sql = sql.replace("#2", "" + template.getOrder_id());
            sql = sql.replace("#3", "" + template.getVendor_id());
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();

            ArrayList<Dish> dishList = template.getDishList();
            for (int i = 0; i < dishList.size(); i++) {
                Dish dish = dishList.get(i);
                int quantity = template.getStringList().get(i);
                if (quantity > 0) {
                    sql = "UPDATE `template_quantity`" + " SET dish_quantity = #1" + " WHERE order_id=#2 && dish_id=#3";
                    sql = sql.replace("#1", "" + quantity);
                    sql = sql.replace("#2", "" + template.getOrder_id());
                    sql = sql.replace("#3", "" + dish.getDish_id());
                    stmt = conn.prepareStatement(sql);
                    stmt.executeUpdate();
                } else {
                    deleteTemplateQuantity(template.getOrder_id(), dish.getDish_id());
                }
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }
    //End method to save changes to an order template to database

    //Start method to delete order templates
    public static void deleteTemplate(OrderTemplate template) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = ConnectionManager.getConnection();
            sql = "Delete from template_quantity where order_id=#1";
            sql = sql.replace("#1", "" + template.getOrder_id());
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            sql = "Delete from order_template where order_id=#1 AND vendor_id=#2";
            sql = sql.replace("#1", "" + template.getOrder_id());
            sql = sql.replace("#2", "" + template.getVendor_id());
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }
    //end method to delete order templates

    //Method to delete a row in template_quantity
    public static void deleteTemplateQuantity(int order_id, int dish_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = ConnectionManager.getConnection();
            sql = "Delete from template_quantity where order_id=#1 AND dish_id=#2";
            sql = sql.replace("#1", "" + order_id);
            sql = sql.replace("#2", "" + dish_id);
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }
    //End method to delete row in template_quantity

    //method retrieves all orderline items of a particular order
    public static ArrayList<Orderline> retrieveOrderLineList(int vendor_id, int order_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Orderline> orderLineList = new ArrayList<Orderline>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "SELECT * FROM `orderline` WHERE vendor_id = #1 && order_id = #2";
            sql = sql.replace("#1", "" + vendor_id);
            sql = sql.replace("#2", "" + order_id);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orderline info from database
            while (rs.next()) {

//                int vendor_id = rs.getInt("vendor_id");
//                int order_id = rs.getInt("order_id");
                int supplier_id = rs.getInt("supplier_id");
                String ingredient_name = rs.getString("ingredient_name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                double buffer_percentage = rs.getDouble("buffer_percentage");

                Orderline orderline = new Orderline(vendor_id, order_id, supplier_id, ingredient_name, price, quantity, buffer_percentage);
                orderLineList.add(orderline);
            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return orderLineList;
    }

    public static void addOrder(Order order) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        //insert new order into data base
        try {
            conn = ConnectionManager.getConnection();
            sql = "insert into `order`( order_id, vendor_id, total_final_price,dt,status,expected_delivery,special_request) values (#1,#2,#3,#4,#5,#6,#7)";
            sql = sql.replace("#1", "" + order.getOrder_id());
            sql = sql.replace("#2", "" + order.getVendor_id());
            sql = sql.replace("#3", "" + order.getTotal_final_price());
            sql = sql.replace("#4", "" + UtilityController.convertSQLDateTimeString(order.getDtOrder()));
            sql = sql.replace("#5", "" + "'" + order.getStatus() + "'");
            sql = sql.replace("#6", "" + UtilityController.convertSQLDateTimeString(order.getExpected_delivery()));
            sql = sql.replace("#7", "" + "'" + order.getSpecial_request() + "'");
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();

            ArrayList<Orderline> orderLineList = order.getOrderlines();
            for (Orderline orderline : orderLineList) {
                sql = "insert into orderline (vendor_id, order_id, supplier_id, ingredient_name, price, quantity, buffer_percentage) values (#1,#2,#3,#4,#5,#6,#7)";
                sql = sql.replace("#1", "" + orderline.getVendor_id());
                sql = sql.replace("#2", "" + order.getOrder_id());
                sql = sql.replace("#3", "" + orderline.getSupplier_id());
                sql = sql.replace("#4", "" + "'" + orderline.getIngredient_name() + "'");
                sql = sql.replace("#5", "" + orderline.getFinalprice());
                sql = sql.replace("#6", "" + orderline.getQuantity());
                sql = sql.replace("#7", "" + orderline.getBufferpercentage());
                stmt = conn.prepareStatement(sql);
                stmt.executeUpdate();

            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

    }

    public static void deleteOrder(Order order) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = ConnectionManager.getConnection();
            sql = "Delete from ingredient where order_id=#1 AND vendor_id=#2";
            sql = sql.replace("#1", "" + order.getOrder_id());
            sql = sql.replace("#2", "" + order.getVendor_id());
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();

            ArrayList<Orderline> orderLineList = order.getOrderlines();
            for (Orderline orderline : orderLineList) {
                sql = "Delete from orderline where vendor_id=#1 AND order_id=#2";
                sql = sql.replace("#1", "" + orderline.getVendor_id());
                sql = sql.replace("#2", "" + orderline.getOrder_id());
                stmt = conn.prepareStatement(sql);
                stmt.executeUpdate();
            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    public static void updateOrder(Order order) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = ConnectionManager.getConnection();
            sql = "UPDATE `order`" + " SET total_final_price = #1 , status = #2  , expected_delivery = #3 , special_request = #4 " + " WHERE order_id=#5 && vendor_id=#6";
            sql = sql.replace("#1", "" + order.getTotal_final_price());
            sql = sql.replace("#2", "" + "'" + order.getStatus() + "'");
            sql = sql.replace("#3", "" + UtilityController.convertSQLDateTimeString(order.getExpected_delivery()));
            sql = sql.replace("#4", "" + "'" + order.getSpecial_request() + "'");
            sql = sql.replace("#5", "" + order.getOrder_id());
            sql = sql.replace("#6", "" + order.getVendor_id());

            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            //When I want to modify the order, I don't want to modify the orderlines. 
//            ArrayList<Orderline> orderLineList = order.getOrderlines();
//            updateOrderlines(orderLineList);

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    public static ArrayList<Integer> retrieveSupplierOrders(int suppID) {
        ConnectionManager connManager = new ConnectionManager();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Integer> suppOrdList = new ArrayList<Integer>();
        try {
            //creates connections to database
            conn = connManager.getConnection();
            sql = "Select DISTINCT order_id from `orderline` WHERE supplier_id = ##";
            sql = sql.replace("##", "" + suppID);
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the orders
            while (rs.next()) {
                int order_id = rs.getInt("order_id");

                suppOrdList.add(order_id);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }
        return suppOrdList;
    }

    public static void updateOrderStatus(int order_id, String status) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = ConnectionManager.getConnection();
            sql = "UPDATE `order`" + " SET status = #1" + " WHERE order_id=#2";
            sql = sql.replace("#1", "" + "'" + status + "'");
            sql = sql.replace("#2", "" + order_id);

            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            //When I want to modify the order, I don't want to modify the orderlines. 
//            ArrayList<Orderline> orderLineList = order.getOrderlines();
//            updateOrderlines(orderLineList);

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    public static boolean checkOrderline(String supplierId, String ingredientName) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        //Ingredient ingredient = null;
        boolean check = true;
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from orderline where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, supplierId);
            statement.setString(2, ingredientName);
            rs = statement.executeQuery();
            if (!rs.next()) {
                check = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return check;
    }
//    public static void updateOrderlines(ArrayList<Orderline> orderlines) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        String sql = "";
//
//        for (Orderline newOrderline : orderlines) {
//            try {
//                conn = ConnectionManager.getConnection();
//                sql = "UPDATE orderline"
//                        + " SET ingredient_name = #1 , price = #2 , quantity = #3 , buffer_percentage = #4"
//                        + " WHERE vendor_id = #5 && order_id = #6";
//                sql = sql.replace("#1", "" + "'"+newOrderline.getIngredient_name()+"'");
//                sql = sql.replace("#2", "" + newOrderline.getFinalprice());
//                sql = sql.replace("#3", "" + newOrderline.getQuantity());
//                sql = sql.replace("#4", "" + newOrderline.getBufferpercentage());
//                sql = sql.replace("#5", "" + newOrderline.getVendor_id());
//                sql = sql.replace("#6", "" + newOrderline.getSupplier_id());
//                stmt = conn.prepareStatement(sql);
//                stmt.executeUpdate();
//
//            } catch (SQLException e) {
//                handleSQLException(e, sql);
//            } finally {
//                ConnectionManager.close(conn, stmt, rs);
//            }
//        }
//    }
}
