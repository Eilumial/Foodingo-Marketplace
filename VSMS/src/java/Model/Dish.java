/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author David
 */
public class Dish {
    private int dish_id;
    private String dish_name;
    private int vendor_id;
    private String dish_description;
    private HashMap<Ingredient, ArrayList<String>> ingredientQuantity;
    
    public Dish(int dish_id, String dish_name, int vendor_id, String dish_description){
        this.dish_id=dish_id;
        this.dish_name=dish_name;
        this.vendor_id=vendor_id;
        this.dish_description=dish_description;
        this.ingredientQuantity = new HashMap<Ingredient,ArrayList<String>>();
    }
    public Dish(int dish_id, String dish_name, int vendor_id, String dish_description, HashMap<Ingredient, ArrayList<String>> ingredientQuantity){
        this.dish_id=dish_id;
        this.dish_name=dish_name;
        this.vendor_id=vendor_id;
        this.dish_description=dish_description;
        this.ingredientQuantity=ingredientQuantity;
    }

    public int getDish_id() {
        return dish_id;
    }

    public void setDish_id(int dish_id) {
        this.dish_id = dish_id;
    }

    public String getDish_name() {
        return dish_name;
    }

    public void setDish_name(String dish_name) {
        this.dish_name = dish_name;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    public String getDish_description() {
        return dish_description;
    }

    public void setDish_description(String dish_description) {
        this.dish_description = dish_description;
    }

    public HashMap<Ingredient, ArrayList<String>> getIngredientQuantity() {
        return ingredientQuantity;
    }

    public void setIngredientQuantity(HashMap<Ingredient, ArrayList<String>> ingredientQuantity) {
        this.ingredientQuantity = ingredientQuantity;
    }

    @Override
    public String toString() {
        String description = "";
        description+= "Dish{" + "dish_id=" + dish_id + ", dish_name=" + dish_name + ", vendor_id=" + vendor_id + ", dish_description=" + dish_description + ", }\n"; 
        
        System.out.println("ingredient quantity is "+ingredientQuantity);
        Set<Ingredient> ingredientSet = ingredientQuantity.keySet();
        
        for (Ingredient ingredient : ingredientSet){
            description += ingredient+"\n";
        }
        return description;
    }
    @Override
    public int hashCode() {
        return dish_id;
    }

    @Override
    public boolean equals(Object o) {
        return ((Dish) o).dish_id == this.dish_id;
    }

    
}
