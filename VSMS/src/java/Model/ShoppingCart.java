/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author David
 */
public class ShoppingCart extends Dish{
    public ShoppingCart(int dish_id, String dish_name, int vendor_id, String dish_description){
        super(dish_id, dish_name, vendor_id, dish_description);
    }
    
    public ShoppingCart(int dish_id, String dish_name, int vendor_id, String dish_description, HashMap<Ingredient, ArrayList<String>> ingredientQuantity){
        super(dish_id, dish_name, vendor_id, dish_description,ingredientQuantity);
    }
}
