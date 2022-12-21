/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javamail;

import DAO.OrderDAO;
import DAO.UserDAO;
import Model.Order;
import Model.Supplier;
import Model.Vendor;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author vincentt.2013
 */
public class Test {

    public static void main(String[] args) {

        String host = "smtp.gmail.com";
        final String user = "ognidoof";
        final String password = "AbC12321CbA";
        String subject = "Receiving order from <supplier>; Order ID : ...";

        if (!user.equals("") && !password.equals("")) {
          EmailController emailController = new EmailController(host,user,password);
//          emailController.sendMessage("vincentt.2013@sis.smu.edu.sg","Receiving order from <supplier>; Order ID : ...", "Your order is tested here \n Hello I am your <ul><li>d</li></ul>");
        } else {
            System.out.println("User email and password are empty. Please correct the problem");
        }
        
        Order order = OrderDAO.retrieveOrderByID(10);
        Vendor vendor = UserDAO.getVendorByID(order.getVendor_id());
        
        //Getting hashmap of supplier and text message to send to each supplier / vendor
        HashMap<Integer,String> suppOrderMap = EmailController.supplierMessageList(order);
        
        EmailController.sendMessageToSuppliers(vendor.getVendor_name(),suppOrderMap);
        EmailController.sendMessageToVendor(vendor, suppOrderMap);
    }
      
    
}
