/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author David
 */
public class OrderTemplate {
    private int order_id;
    private int vendor_id;
    private String name;
    private ArrayList<Dish> dishList;
    private ArrayList<Integer> stringList;
    
    public OrderTemplate(int order_id, int vendor_id, String name, ArrayList<Dish> dishList,ArrayList<Integer> stringList){
        this.order_id=order_id;
        this.vendor_id=vendor_id;
        this.name=name;
        this.dishList=dishList;
        this.stringList=stringList;
    }
    
    public OrderTemplate(int order_id, int vendor_id, String name){
        this.order_id=order_id;
        this.vendor_id=vendor_id;
        this.name=name;
        this.dishList=new ArrayList<Dish>();
        this.stringList=new ArrayList<Integer>();
    }
    
    public void addDish(Dish dish){
        dishList.add(dish);
    }
    
    public void addInt(int i){
        stringList.add(i);
    }

    /**
     * @return the order_id
     */
    public int getOrder_id() {
        return order_id;
    }

    /**
     * @param order_id the order_id to set
     */
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    /**
     * @return the vendor_id
     */
    public int getVendor_id() {
        return vendor_id;
    }

    /**
     * @param vendor_id the vendor_id to set
     */
    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the dishList
     */
    public ArrayList<Dish> getDishList() {
        return dishList;
    }

    /**
     * @param dishList the dishList to set
     */
    public void setDishList(ArrayList<Dish> dishList) {
        this.dishList = dishList;
    }

    /**
     * @return the stringList
     */
    public ArrayList<Integer> getStringList() {
        return stringList;
    }

    /**
     * @param stringList the stringList to set
     */
    public void setStringList(ArrayList<Integer> stringList) {
        this.stringList = stringList;
    }

   
    
}
