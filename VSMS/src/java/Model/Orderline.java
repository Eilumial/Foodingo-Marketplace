/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Joel
 */
public class Orderline {
    private int vendor_id;
    private int order_id;
    private int supplier_id;
    private String ingredient_name;
    private double finalprice;
    private int quantity;
    private double bufferpercentage;
    
    public Orderline (int vendor_id, int order_id, int supplier_id, String ingredient_name, double finalprice, int quantity, double bufferpercentage){
        this.vendor_id = vendor_id;
        this.order_id = order_id;
        this.supplier_id = supplier_id;
        this.ingredient_name = ingredient_name;
        this.finalprice = finalprice;
        this.quantity = quantity;
        this.bufferpercentage = bufferpercentage;
    }
    
    public int getVendor_id(){
        return vendor_id;
    }
    
    public int getOrder_id(){
        return order_id;
    }
    
    public int getSupplier_id(){
        return supplier_id;
    }
    
    public String getIngredient_name(){
        return ingredient_name;
    }
    
    public double getFinalprice(){
        return finalprice;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public double getBufferpercentage(){
        return bufferpercentage;
    }
    
    public void setVendor_id(int vendor_id){
        this.vendor_id = vendor_id;
    }
    
    public void setOrder_id(int order_id){
        this.order_id = order_id;
    }
    
    public void setSupplier_id(int supplier_id){
        this.supplier_id = supplier_id;
    }
    
    public void setIngredient_name(String ingredient_name){
        this.ingredient_name = ingredient_name;
    }
    
    public void setFinalprice(double finalprice){
        this.finalprice = finalprice;
    }
    
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }
    
    public void setBufferpercentage(double bufferpercentage){
        this.bufferpercentage = bufferpercentage;
    }
    
    public String toString(){
        return ingredient_name+" "+quantity+" "+finalprice +"\n";
    }
    
}