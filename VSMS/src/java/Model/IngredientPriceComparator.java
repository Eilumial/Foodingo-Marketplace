/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.UtilityController;
import java.util.Comparator;

/**
 *
 * @author David
 */
public class IngredientPriceComparator implements Comparator<Ingredient>{
    public int compare(Ingredient ingredient1, Ingredient ingredient2){
        double price1=Double.parseDouble(ingredient1.getOfferedPrice());
        double price2=Double.parseDouble(ingredient2.getOfferedPrice());
        if(price1>price2){
            return 1;
        }else if(price1==price2){
            return 0;
        }else{
            return -1;
        }
    }
}
