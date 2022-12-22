package Model;

import Controller.UtilityController;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

public class Order {

    private int order_id;
    private int vendor_id;
    private double total_final_price;
    private Date dt_order;
    private ArrayList<Orderline> orderlines;
    private String status; //status will have 4 values "Delivered","Rejected","Pending","Incoming" in proper case
    private DecimalFormat df = new DecimalFormat("0.00");
    private Date expected_delivery;
    private String special_request;

    public Order(int order_id, int vendor_id, double total_final_price, Date dt_order, ArrayList<Orderline> orderlines, String status, Date expected_delivery, String special_request) {
        this.order_id = order_id;
        this.vendor_id = vendor_id;
        this.total_final_price = total_final_price;
        this.dt_order = dt_order;
        this.orderlines = orderlines;
        this.status = status;
        this.expected_delivery = expected_delivery;
        this.special_request = special_request;
    }

    public Order(int order_id, int vendor_id, double total_final_price, Date dt_order, String status) {
        this.order_id = order_id;
        this.vendor_id = vendor_id;
        this.total_final_price = total_final_price;
        this.orderlines = orderlines;
        this.status = status;
    }

    public Date getDt_order() {
        return dt_order;
    }

    public void setDt_order(Date dt_order) {
        this.dt_order = dt_order;
    }

    public DecimalFormat getDf() {
        return df;
    }

    public void setDf(DecimalFormat df) {
        this.df = df;
    }

    public Date getExpected_delivery() {
        return expected_delivery;
    }

    public void setExpected_delivery(Date expected_delivery) {
        this.expected_delivery = expected_delivery;
    }

    public String getSpecial_request() {
        return special_request;
    }

    public void setSpecial_request(String special_request) {
        this.special_request = special_request;
    }
    
    
    public void addOrderlines (Orderline orderline){
        this.orderlines.add(orderline);
    }

    public int getOrder_id() {
        return order_id;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public double getTotal_final_price() {
        return Double.parseDouble(df.format(total_final_price));
    }

    public ArrayList<Orderline> getOrderlines() {
        return orderlines;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    public void setTotal_final_price(double total_final_price) {
        this.total_final_price = total_final_price;
    }

    public void setOrderlines(ArrayList<Orderline> orderlines) {
        this.orderlines = orderlines;
    }

    public Date getDtOrder() {
        return dt_order;
    }

    public void setDtOrder(Date dt_order) {
        this.dt_order = dt_order;
    }
    public String getStatus(){
        return status;
    }
    public void setStatus(String status){
        this.status = status;
    }

    public String toString() {
        return "Order_id: " + order_id + "Vendor_id: " + vendor_id + "Total final price: " + UtilityController.convertDoubleToCurrString(total_final_price)+" The status is "+status+" the OrderTime is "+dt_order.toString() +" The expected delivery is "+expected_delivery;
    }
    
    @Override
    public int hashCode() {
        return order_id;
    }

    @Override
    public boolean equals(Object o) {
        return ((Order) o).order_id == this.order_id;
    }
}
