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
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                Order order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList);
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
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList);
                
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
                ArrayList<Orderline> orderLineList = retrieveOrderLineList(vendor_id, order_id);

                Order order = new Order(order_id, vendor_id, total_final_price, dt_order, orderLineList);
                
                orderList.add(order);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            connManager.close(conn, stmt, rs);
        }
        return orderList;
    }

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
            sql = "insert into `order`( order_id, vendor_id, total_final_price,dt) values (#1,#2,#3,#4)";
            sql = sql.replace("#1", "" + order.getOrder_id());
            sql = sql.replace("#2", "" + order.getVendor_id());
            sql = sql.replace("#3", "" + order.getTotal_final_price());
            sql = sql.replace("#4", "" + UtilityController.convertSQLDateTimeString(order.getDtOrder()));
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();

            ArrayList<Orderline> orderLineList = order.getOrderlines();
            for (Orderline orderline : orderLineList) {
                sql = "insert into orderline (vendor_id, order_id, supplier_id, ingredient_name, price, quantity, buffer_percentage) values (#1,#2,#3,#4,#5,#6,#7)";
                sql = sql.replace("#1", "" + orderline.getVendor_id());
                sql = sql.replace("#2", "" + orderline.getOrder_id());
                sql = sql.replace("#3", "" + orderline.getSupplier_id());
                sql = sql.replace("#4", "" + "'"+orderline.getIngredient_name()+"'");
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

    public static void updateOrder(Order order){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        try{
            conn = ConnectionManager.getConnection();
            sql = "UPDATE orders"
                    + "SET total_final_price = #1"
                        + "WHERE order_id=#2 && vendor_id=#3";
            sql = sql.replace("#1", "" + order.getTotal_final_price());
            sql = sql.replace("#2", "" + order.getOrder_id());
            sql = sql.replace("#3", "" + order.getVendor_id());
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            
            ArrayList<Orderline> orderLineList = order.getOrderlines();
            updateOrderlines(orderLineList);
            
        }catch(SQLException e){
            handleSQLException(e, sql);
        }finally{
            ConnectionManager.close(conn, stmt, rs);
        }
    }
    
    public static void updateOrderlines(ArrayList<Orderline> orderlines){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        
        for(Orderline newOrderline : orderlines){
            try{
                conn = ConnectionManager.getConnection();
                sql = "UPDATE orderline"
                        + "SET ingredient_name = #1 , price = #2 , quantity = #3 , buffer_percentage = #4"
                            + "WHERE vendor_id = #5 && order_id = #6";
                sql = sql.replace("#1", newOrderline.getIngredient_name());
                sql = sql.replace("#2", "" + newOrderline.getFinalprice());
                sql = sql.replace("#3", "" + newOrderline.getQuantity());
                sql = sql.replace("#4", "" + newOrderline.getBufferpercentage());
                sql = sql.replace("#5", "" + newOrderline.getVendor_id());
                sql = sql.replace("#6", "" + newOrderline.getSupplier_id());
                stmt = conn.prepareStatement(sql);
                stmt.executeUpdate();
                
            }catch(SQLException e){
            handleSQLException(e, sql);
            }finally{
            ConnectionManager.close(conn, stmt, rs);
        }
        }
    }
}
