/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controller.ConnectionManager;
import Controller.UtilityController;
import Model.Dish;
import Model.Ingredient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 *
 * @author David
 */
public class IngredientDAO {
    public static Ingredient getIngredient(String supplierId, String ingredientName){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Ingredient ingredient=null;
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from ingredient where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1,supplierId);
            statement.setString(2,ingredientName);
            rs = statement.executeQuery();
            while(rs.next()){
                int supId=Integer.parseInt(rs.getString("supplier_id"));
                ingredient=new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"));                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return ingredient;
    }
    
    public static void addIngredient(Ingredient ingredient){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query = "insert into ingredient (supplier_id, ingredient_name, supply_unit, category, ingredient_description, offered_price) values (?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplier_id()+"");
            statement.setString(2, ingredient.getName());
            statement.setString(3, ingredient.getSupplyUnit());
            statement.setString(4, ingredient.getSubcategory());
            statement.setString(5, ingredient.getDescription());
            statement.setString(6, ingredient.getOfferedPrice());
            statement.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }

    }
    
    public static void deleteIngredient(Ingredient ingredient){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query = "Delete from ingredient where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplier_id()+"");
            statement.setString(2, ingredient.getName());
            int row = statement.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        } 
    }
    
    public static void updateIngredient(Ingredient ingredient){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query = "update Ingredient set supply_unit=?, category=?, ingredient_description=?, offered_price=? where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplyUnit());
            statement.setString(2, ingredient.getSubcategory());
            statement.setString(3, ingredient.getDescription());
            statement.setString(4, ingredient.getOfferedPrice());
            statement.setString(5, ingredient.getSupplier_id()+"");
            statement.setString(6, ingredient.getName());
            int row = statement.executeUpdate();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
    }
    
    public static ArrayList<Ingredient> getIngredientBySupplier(int supplier_id){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Ingredient> ingredientList=new ArrayList<Ingredient>();
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from ingredient where supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1,supplier_id+"");
            rs = statement.executeQuery();
            while(rs.next()){
                int supId=Integer.parseInt(rs.getString("supplier_id"));
                Ingredient ingredient=new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"));
                ingredientList.add(ingredient);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return ingredientList;
    }
    
    public static ArrayList<Dish> getDish(String vendor_id){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Dish> dishList=new ArrayList<Dish>();
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from Dish where vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, vendor_id);
            rs = statement.executeQuery();
            while(rs.next()){
               int dishId=Integer.parseInt(rs.getString("dish_id"));
               int venId=Integer.parseInt(rs.getString("vendor_id"));
               dishList.add(new Dish(dishId,rs.getString("dish_name"),venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id"))));   
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return dishList;
    }
        
    public static HashMap<Ingredient, ArrayList<String>> getIngredientQuantity(String dish_id) {
        HashMap<Ingredient, ArrayList<String>> toReturn = new HashMap<Ingredient, ArrayList<String>>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from Ingredient_Quantity where dish_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            rs = statement.executeQuery();
            while (rs.next()) {
                ArrayList<String> tempList = new ArrayList<String>();
                tempList.add(rs.getString("quantity"));
                tempList.add(rs.getString("unit"));
                toReturn.put(getIngredient(rs.getString("supplier_id"), rs.getString("ingredient_name")), tempList);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return toReturn;
    }
    
    public static void addDish(Dish dish){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "insert into Dish (dish_id, dish_name, vendor_id, dish_description) values (?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1,dish.getDish_id()+"");
            statement.setString(2,dish.getDish_name());
            statement.setString(3,dish.getVendor_id()+"");
            statement.setString(4,dish.getDish_description());
            int rows = statement.executeUpdate();
            HashMap<Ingredient, ArrayList<String>> map=dish.getIngredientQuantity();
            Set<Ingredient> iSet=map.keySet();
            Iterator<Ingredient> iter=iSet.iterator();
            while(iter.hasNext()){
                Ingredient tempI=iter.next();
                ArrayList<String> tempList=map.get(tempI);
                addIngredientQuantity(tempI, tempList.get(0), tempList.get(1), dish.getDish_id()+"", dish.getVendor_id()+"");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        
    }
    
    public static void addIngredientQuantity(Ingredient ingredient,String quantity, String unit, String dish_id, String vendor_id){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query ="insert into ingredient_quantity (dish_id, ingredient_name, vendor_id, supplier_id, quantity, unit) values (?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1,dish_id);
            statement.setString(2,ingredient.getName());
            statement.setString(3,vendor_id);
            statement.setString(4,ingredient.getSupplier_id()+"");
            statement.setString(5, quantity);   
            statement.setString(6, unit);
            int rows = statement.executeUpdate();
           
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        
    }
    
    public static void deleteDish(Dish dish){
        HashMap<Ingredient, ArrayList<String>> map=dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            deleteIngredientQuantity(dish.getDish_id()+"", tempI.getName(), dish.getVendor_id()+"", tempI.getSupplier_id() + "");
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "Delete from Dish where dish_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id()+"");
            statement.setString(2, dish.getVendor_id()+"");
            int row = statement.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        
        
    }
    
    public static void deleteIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query = "Delete from Ingredient_Quantity where dish_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            statement.setString(2, ingredient_name);
            statement.setString(3, vendor_id);
            statement.setString(4, supplier_id);
            int row = statement.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        
    }
    
    public static void updateDish(Dish dish){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "update Dish set dish_id=?, dish_name=?, vendor_id=?, dish_description=? where dish_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id()+"");
            statement.setString(2, dish.getDish_name());
            statement.setString(3, dish.getVendor_id()+"");
            statement.setString(4, dish.getDish_description());
            statement.setString(5, dish.getDish_id()+"");
            statement.setString(6, dish.getVendor_id()+"");
            int row = statement.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        HashMap<Ingredient, ArrayList<String>> map=dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            int row = updateIngredientQuantity(dish.getDish_id()+"", tempI.getName(), dish.getVendor_id()+"", tempI.getSupplier_id() + "",tempList.get(0),tempList.get(1));
            if (row == 0){
                addIngredientQuantity(tempI,tempList.get(0), tempList.get(1), dish.getDish_id()+"", dish.getVendor_id()+"");
            }
        }
    }
    
    public static int updateIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id, String quantity, String unit){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try
        {
            conn=ConnectionManager.getConnection();
            query = "update Ingredient_Quantity set quantity=?, unit=? where dish_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, quantity);
            statement.setString(2, unit);
            statement.setString(3, dish_id);
            statement.setString(4, ingredient_name);
            statement.setString(5, vendor_id);
            statement.setString(6, supplier_id);
            int row = statement.executeUpdate();
            return row;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return 0;
    }
    
    public static ArrayList<Integer> getSupplierIdByIngredient(String ingredient_name){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Integer> idList=new ArrayList<Integer>();
        
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from ingredient where ingredient_name=? group by supplier_id";
            statement = conn.prepareStatement(query);
            statement.setString(1,ingredient_name);
            rs = statement.executeQuery();
            while(rs.next()){
                int supId=Integer.parseInt(rs.getString("supplier_id"));
                idList.add(supId);        
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return idList;
    }

    public static ArrayList<Dish> getAllDish(){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Dish> dishList=new ArrayList<Dish>();
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from Dish";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while(rs.next()){
               int dishId=Integer.parseInt(rs.getString("dish_id"));
               int venId=Integer.parseInt(rs.getString("vendor_id"));
               dishList.add(new Dish(dishId,rs.getString("dish_name"),venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id"))));   
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return dishList;
    }

    public static Dish getDishByID(int dish_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Dish dish = null;
        try
        {
            conn=ConnectionManager.getConnection();
            query = "select * from Dish where dish_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, UtilityController.convertIntToString(dish_id));
            rs = statement.executeQuery();
            while(rs.next()){
               int dishId=Integer.parseInt(rs.getString("dish_id"));
               int venId=Integer.parseInt(rs.getString("vendor_id"));
               dish =new Dish(dishId,rs.getString("dish_name"),venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id")));   
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        return dish;
    }
}
    

