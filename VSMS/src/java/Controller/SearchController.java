/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.IngredientDAO;
import DAO.UserDAO;
import Model.Supplier;
import java.util.ArrayList;

/**
 *
 * @author David
 */
public class SearchController {
    IngredientDAO iDAO=new IngredientDAO();
    UserDAO uDAO=new UserDAO();
    
    public static ArrayList<Supplier> searchByIngredient(String ingredient_name){
        ArrayList<Supplier> supplierList=new ArrayList<Supplier>();
        ArrayList<Integer> idList=IngredientDAO.getSupplierIdByIngredient(ingredient_name);
        for(int i:idList){
            supplierList.add(UserDAO.getSupplierById(i));
        }
        return supplierList;
    }
}
