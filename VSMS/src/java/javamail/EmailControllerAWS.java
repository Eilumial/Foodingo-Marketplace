/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javamail;

import Controller.OrderController;
import Controller.UserController;
import Controller.UtilityController;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.Order;
import Model.Orderline;
import Model.Supplier;
import Model.Vendor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author vincentt.2013
 */
public class EmailControllerAWS {

    private static String host = "email-smtp.us-west-2.amazonaws.com";

    private static String user = "AKIAISJWKZRDXAJ2UNTQ";
    private static String password = "AqAvQKUVFnTtsjzWqrDt9hY2JqzFGHxP6Q0MaYlGgy2A";
    private static int port = 587;

    private static String from = "ognidoof@gmail.com";

    public EmailControllerAWS() {
    }

//    This method is to send confirmation message after the supplier has approved/ disapproved
    public static void sendConfirmationMessageToVendorSupplier(Order order, int vendor_id, String action) {
        if (!user.equals("") && !password.equals("")) {
            EmailControllerAWS emailController = new EmailControllerAWS();
        } else {
            System.out.println("User email and password are empty. Please correct the problem");
        }
        //Getting vendor
        Vendor vendor = UserController.retrieveVendorByID(vendor_id);
        //Getting hashmap of supplier and text message to send to each supplier / vendor
        HashMap<Integer, String> suppOrderMap = supplierMessageList(order);

        //Getting confirmation for vendors and suppliers
        String confirmation = "<h3>Your order has been ";
        if (action.equals("approve")) {
            confirmation += "<font color='green'>" + action + "d</font>";
        } else {
            confirmation += "<font color='red'>" + action + "ed</font>";
        }
        confirmation += "</h3>";
        EmailControllerAWS.sendMessageToSuppliers(vendor, order, suppOrderMap, confirmation);
        EmailControllerAWS.sendMessageToVendor(vendor, order, suppOrderMap, confirmation);
    }

//    This method is to send order message after orders have been created
    public static void sendOrderMessageToVendorSupplier(Order order, int vendor_id) {
        if (!user.equals("") && !password.equals("")) {
            EmailControllerAWS emailController = new EmailControllerAWS();
        } else {
            System.out.println("User email and password are empty. Please correct the problem");
        }
        //Getting vendor
        Vendor vendor = UserController.retrieveVendorByID(vendor_id);
        //Getting hashmap of supplier and text message to send to each supplier / vendor
        HashMap<Integer, String> suppOrderMap = EmailControllerAWS.supplierMessageList(order);

        //Getting link for supplier to confirm
        String link = "<h3><a href='http://vsms-env.us-west-2.elasticbeanstalk.com/OrderConfirmation.jsp?order_id=" + order.getOrder_id() + "'>Confirm here!</a></h3>";

        EmailControllerAWS.sendMessageToSuppliers(vendor, order, suppOrderMap, link);
        EmailControllerAWS.sendMessageToVendor(vendor, order, suppOrderMap, "");
    }

    //Convert the orders into message string for each supplier
    public static HashMap<Integer, String> supplierMessageList(Order order) {
        HashMap<Integer, String> suppOrderMap = new HashMap<Integer, String>();

        for (Orderline orderline : order.getOrderlines()) {
            int supplier_id = orderline.getSupplier_id();
            Supplier supplier = UserDAO.getSupplierById(supplier_id);
            if (suppOrderMap.containsKey(supplier_id)) {
                suppOrderMap.put(supplier_id, suppOrderMap.get(supplier_id) + orderline.toHTMLString());
            } else {
                suppOrderMap.put(supplier_id, orderline.toHTMLString());
            }
        }

        return suppOrderMap;
    }

    //convert the orders into message string for vendor
    public static void sendMessageToVendor(Vendor vendor, Order order, HashMap<Integer, String> suppOrderMap, String additional) {
        Iterator iter = suppOrderMap.keySet().iterator();
        StringBuffer messageText = new StringBuffer("");
        while (iter.hasNext()) {
            int supplier_id = (Integer) iter.next();
            Supplier supplier = UserDAO.getSupplierById(supplier_id);
            messageText.append("<h1>" + supplier.getSupplier_name() + "</h1>");
            //messageText.append("<h3>email : " + supplier.getEmail() + "|| phone number: " + supplier.getTelephone_number() + "</h3>");
            messageText.append("<h3>You have submitted the following order to " + supplier.getSupplier_name() + ".</h3>");
            messageText.append("<hr>");
            messageText.append("<h5>" + suppOrderMap.get(supplier_id) + "</h5>");
            messageText.append("<font color=\"red\">Total price is : $" + UtilityController.convertDoubleToCurrString(OrderController.createAggFinalPrice(order.getOrderlines())) + "</font>");
            messageText.append("<b>Special Request:</b> " + order.getSpecial_request());
        }

        sendMessage(vendor.getEmail(), "Your orders to suppliers", messageText + additional);
    }

    //send orderlist to multiple suppliers --> Make sure you have the domain ready
    public static void sendMessageToSuppliers(Vendor vendor, Order order, HashMap<Integer, String> suppOrderMap, String additional) {
        Iterator iter = suppOrderMap.keySet().iterator();
        StringBuffer messageText = new StringBuffer("");
        while (iter.hasNext()) {
            int supplier_id = (Integer) iter.next();
            Supplier supplier = UserDAO.getSupplierById(supplier_id);
            messageText.append("<h1>" + vendor.getVendor_name() + "</h1>");
            //messageText.append("<h3>email : " + vendor.getEmail() + "|| phone number: " + vendor.getTelephone_number() + "</h3>");
            messageText.append("<h3>You have received an order from " + vendor.getVendor_name() + ".</h3>");
            messageText.append("<hr>");
            messageText.append("<h5>" + suppOrderMap.get(supplier_id) + "</h5>");
            messageText.append("<font color=\"red\">Total price is : $" + UtilityController.convertDoubleToCurrString(OrderController.createAggFinalPrice(order.getOrderlines())) + "</font>");
            messageText.append("<b>Special Request:</b> " + order.getSpecial_request());
            sendMessage(supplier.getEmail(), "Order from Vendor " + vendor.getVendor_name(), messageText + additional);
        }
    }

//    This method is to send a general message to an email with subject and message string
    public static void sendMessage(String toEmail, String subject, String messageHTMLString) {

        //Get the session object  
        Properties props = System.getProperties();
        System.setProperty("line.separator", "\r\n");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", port);
        props.setProperty("mail.smtp.host", host);
        props.setProperty("mail.smtp.user", user);
        props.setProperty("mail.smtp.password", password);
        props.setProperty("mail.smtps.auth", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtps.ssl.enable", "true");

        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);

        //Compose the message  
        try {
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            message.setSubject(subject);
            message.setContent(messageHTMLString, "text/html");
            //send the message  
            Transport transport = session.getTransport();
            transport.connect(host, user, password);
            transport.sendMessage(message, message.getAllRecipients());

            System.out.println("Message is delivered");
        } catch (MessagingException e) {
            System.out.println("Message is not sent");
            e.printStackTrace();
        }
    }
}
