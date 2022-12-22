/*
 * To change this license head

 er, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controller.ConnectionManager;
import Controller.UtilityController;
import static DAO.IngredientDAO.getTemplateQuantity;
import Model.Dish;
import Model.Ingredient;
import Model.Supplier;
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

    public static Ingredient getIngredient(String supplierId, String ingredientName) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Ingredient ingredient = null;

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, supplierId);
            statement.setString(2, ingredientName);
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                ingredient = new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"), UtilityController.convertBlobToInputStream(rs.getBlob("picture")),rs.getInt("minimum_order_quantity"),rs.getString("status"));
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
        return ingredient;
    }

    public static void addIngredient(Ingredient ingredient) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "insert into ingredient (supplier_id, ingredient_name, supply_unit, category, ingredient_description, offered_price,minimum_order_quantity,status,picture) values (?,?,?,?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplier_id() + "");
            statement.setString(2, ingredient.getName());
            statement.setString(3, ingredient.getSupplyUnit());
            statement.setString(4, ingredient.getSubcategory());
            statement.setString(5, ingredient.getDescription());
            statement.setString(6, ingredient.getOfferedPrice());
            statement.setInt(7, ingredient.getMinimum_order_quantity());
            statement.setString(8, ingredient.getStatus());
            //Insert picture if exists
            if (ingredient.getPicture() != null) {
                statement.setBinaryStream(9, ingredient.getPicture());
            }
            statement.executeUpdate();
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

    }

    public static void deleteIngredient(Ingredient ingredient) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from ingredient where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplier_id() + "");
            statement.setString(2, ingredient.getName());
            int row = statement.executeUpdate();
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
    }

    public static void updateIngredient(Ingredient ingredient) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "update ingredient set supply_unit=?, category=?, ingredient_description=?, offered_price=? ,picture=?, minimum_order_quantity=?, status =? where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient.getSupplyUnit());
            statement.setString(2, ingredient.getSubcategory());
            statement.setString(3, ingredient.getDescription());
            statement.setString(4, ingredient.getOfferedPrice());
            statement.setInt(6, ingredient.getMinimum_order_quantity());
            statement.setString(7, ingredient.getStatus());
            statement.setInt(8, ingredient.getSupplier_id());
            statement.setString(9, ingredient.getName());
            
            //Insert picture if exists
            if (ingredient.getPicture() != null) {
                statement.setBinaryStream(5, ingredient.getPicture());
            }
            int row = statement.executeUpdate();
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
    }

    public static ArrayList<Ingredient> getIngredientList() {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                Ingredient ingredient = new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"), UtilityController.convertBlobToInputStream(rs.getBlob("picture")),rs.getInt("minimum_order_quantity"),rs.getString("status"));
                System.out.println(ingredient);
                ingredientList.add(ingredient);
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
        return ingredientList;
    }

    public static HashMap<String, Ingredient> getIngredientMap() {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        //ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();
        HashMap<String, Ingredient> ingredientMap = new HashMap<>();

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                String name = rs.getString("ingredient_name");
                Ingredient ingredient = new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"), UtilityController.convertBlobToInputStream(rs.getBlob("picture")),rs.getInt("minimum_order_quantity"),rs.getString("status"));
                ingredientMap.put(name + "|@|" + supId, ingredient);
                
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
        return ingredientMap;
    }

    public static ArrayList<Ingredient> getIngredientBySupplier(int supplier_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient where supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, supplier_id + "");
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                Ingredient ingredient = new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"), UtilityController.convertBlobToInputStream(rs.getBlob("picture")),rs.getInt("minimum_order_quantity"),rs.getString("status"));
                ingredientList.add(ingredient);
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
        return ingredientList;
    }

    public static ArrayList<Ingredient> getIngredientByName(String ingredient_name) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient where ingredient_name like ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, "%" + ingredient_name + "%" + "");
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                Ingredient ingredient = new Ingredient(supId, rs.getString("ingredient_name"), rs.getString("supply_unit"), rs.getString("category"), rs.getString("ingredient_description"), rs.getString("offered_price"), UtilityController.convertBlobToInputStream(rs.getBlob("picture")),rs.getInt("minimum_order_quantity"),rs.getString("status"));                
                ingredientList.add(ingredient);
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
        return ingredientList;
    }

    public static ArrayList<Dish> getDish(String vendor_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Dish> dishList = new ArrayList<Dish>();
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from dish where vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, vendor_id);
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("dish_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dishList.add(new Dish(dishId, rs.getString("dish_name"), venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id"))));
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
        return dishList;
    }

    //Loads all shopping cart templates of a vendor
    public static ArrayList<Dish> getIngredientTemplates(String vendor_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Dish> dishList = new ArrayList<Dish>();
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template where vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, vendor_id);
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("template_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dishList.add(new Dish(dishId, rs.getString("template_name"), venId, rs.getString("template_description"), getTemplateQuantity(rs.getString("template_id"))));
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
        return dishList;
    }

    //End loading of templates
//This method generates a new dishID
    public static int getDishID(String vendor_id) {
        int dishId = 0;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from dish order by dish_id desc";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            rs.next();
            dishId = Integer.parseInt(rs.getString("dish_id"));
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
        return dishId + 1;
    }
//End of dishID generation

    //This method generates a new TemplateID
    public static int getIngredientTemplateID(String vendor_id) {
        int dishId = 0;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template order by template_id desc";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next()) {
                dishId = Integer.parseInt(rs.getString("template_id"));
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
        return dishId + 1;
    }
//End of templateID generation

    //This method decides if an ingredient method is selected as one-click-order
    public static boolean isOneClickOrder(int dish_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        int selected = 0;
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template where template_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, UtilityController.convertIntToString(dish_id));
            rs = statement.executeQuery();

            while (rs.next()) {
                selected = rs.getInt("selected");
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
        return selected == 1;
    }

    //end method
    public static HashMap<Ingredient, ArrayList<String>> getIngredientQuantity(String dish_id) {
        HashMap<Ingredient, ArrayList<String>> toReturn = new HashMap<Ingredient, ArrayList<String>>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_quantity where dish_id=?";
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

    //This method gets the ingredient template quantities
    public static HashMap<Ingredient, ArrayList<String>> getTemplateQuantity(String dish_id) {
        HashMap<Ingredient, ArrayList<String>> toReturn = new HashMap<Ingredient, ArrayList<String>>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template_quantity where template_id=?";
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
    //End method

    public static void addDish(Dish dish) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "insert into dish (dish_id, dish_name, vendor_id, dish_description) values (?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getDish_name());
            statement.setString(3, dish.getVendor_id() + "");
            statement.setString(4, dish.getDish_description());
            int rows = statement.executeUpdate();
            HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
            Set<Ingredient> iSet = map.keySet();
            Iterator<Ingredient> iter = iSet.iterator();
            while (iter.hasNext()) {
                Ingredient tempI = iter.next();
                ArrayList<String> tempList = map.get(tempI);
                addIngredientQuantity(tempI, tempList.get(0), tempList.get(1), dish.getDish_id() + "", dish.getVendor_id() + "");
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

    }

    //Adds ingredient template to database
    public static void addIngredientTemplate(Dish dish) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "insert into ingredient_template (template_id, template_name, vendor_id, template_description) values (?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getDish_name());
            statement.setString(3, dish.getVendor_id() + "");
            statement.setString(4, dish.getDish_description());
            int rows = statement.executeUpdate();
            HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
            Set<Ingredient> iSet = map.keySet();
            Iterator<Ingredient> iter = iSet.iterator();
            while (iter.hasNext()) {
                Ingredient tempI = iter.next();
                ArrayList<String> tempList = map.get(tempI);
                addTemplateQuantity(tempI, tempList.get(0), tempList.get(1), dish.getDish_id() + "", dish.getVendor_id() + "");
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

    }
    //End adding ingredient template

    public static void addIngredientQuantity(Ingredient ingredient, String quantity, String unit, String dish_id, String vendor_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "insert into ingredient_quantity (dish_id, ingredient_name, vendor_id, supplier_id, quantity, unit) values (?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            statement.setString(2, ingredient.getName());
            statement.setString(3, vendor_id);
            statement.setString(4, ingredient.getSupplier_id() + "");
            statement.setString(5, quantity);
            statement.setString(6, unit);
            int rows = statement.executeUpdate();

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

    }

    //adds a new ingredient template quantity into the database
    public static void addTemplateQuantity(Ingredient ingredient, String quantity, String unit, String dish_id, String vendor_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "insert into ingredient_template_quantity (template_id, ingredient_name, vendor_id, supplier_id, quantity, unit) values (?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            statement.setString(2, ingredient.getName());
            statement.setString(3, vendor_id);
            statement.setString(4, ingredient.getSupplier_id() + "");
            statement.setString(5, quantity);
            statement.setString(6, unit);
            int rows = statement.executeUpdate();

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

    }
    //End method block

    public static void deleteDish(Dish dish) {
        HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            deleteIngredientQuantity(dish.getDish_id() + "", tempI.getName(), dish.getVendor_id() + "", tempI.getSupplier_id() + "");
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from dish where dish_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getVendor_id() + "");
            int row = statement.executeUpdate();
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

    }

    //Method deletes and ingredient template
    public static void deleteIngredientTemplate(Dish dish) {
        HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            deleteTemplateQuantity(dish.getDish_id() + "", tempI.getName(), dish.getVendor_id() + "", tempI.getSupplier_id() + "");
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from ingredient_template where template_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getVendor_id() + "");
            int row = statement.executeUpdate();
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

    }

    //end deletion method
    public static void deleteIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from ingredient_quantity where dish_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            statement.setString(2, ingredient_name);
            statement.setString(3, vendor_id);
            statement.setString(4, supplier_id);
            int row = statement.executeUpdate();
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

    }

    //This method deletes an ingredient_template_quantity from the database
    public static void deleteTemplateQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from ingredient_template_quantity where template_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish_id);
            statement.setString(2, ingredient_name);
            statement.setString(3, vendor_id);
            statement.setString(4, supplier_id);
            int row = statement.executeUpdate();
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

    }
    //End method block

    //Method updates ingredient template
    public static void updateIngredientTemplate(Dish dish) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "update ingredient_template set template_id=?, template_name=?, vendor_id=?, template_description=? where template_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getDish_name());
            statement.setString(3, dish.getVendor_id() + "");
            statement.setString(4, dish.getDish_description());
            statement.setString(5, dish.getDish_id() + "");
            statement.setString(6, dish.getVendor_id() + "");
            int row = statement.executeUpdate();
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
        HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            int row = updateTemplateQuantity(dish.getDish_id() + "", tempI.getName(), dish.getVendor_id() + "", tempI.getSupplier_id() + "", tempList.get(0), tempList.get(1));
            if (row == 0) {
                addTemplateQuantity(tempI, tempList.get(0), tempList.get(1), dish.getDish_id() + "", dish.getVendor_id() + "");
            }
        }
    }
    //End updating of ingredient template

    //This method clears the select column in ingredient template
    public static void setSelectColumn(int vendorID, int templateID) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template where vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, vendorID + "");
            rs = statement.executeQuery();
            while (rs.next()) {
                String template_id = rs.getString("template_id");
                String template_name = rs.getString("template_name");
                String vendor_id = rs.getString("vendor_id");
                String template_description = rs.getString("template_description");
                String selected = rs.getString("selected");
                if (template_id.equals(templateID + "")) {
                    query = "update ingredient_template set template_id=?, template_name=?, vendor_id=?, template_description=?, selected=? where template_id=? AND vendor_id=?";
                    statement = conn.prepareStatement(query);
                    statement.setString(1, template_id);
                    statement.setString(2, template_name);
                    statement.setString(3, vendor_id);
                    statement.setString(4, template_description);
                    statement.setInt(5, 1);
                    statement.setString(6, template_id);
                    statement.setString(7, vendor_id);
                    int row = statement.executeUpdate();
                } else {
                    query = "update ingredient_template set template_id=?, template_name=?, vendor_id=?, template_description=?, selected=? where template_id=? AND vendor_id=?";
                    statement = conn.prepareStatement(query);
                    statement.setString(1, template_id);
                    statement.setString(2, template_name);
                    statement.setString(3, vendor_id);
                    statement.setString(4, template_description);
                    statement.setInt(5, 0);
                    statement.setString(6, template_id);
                    statement.setString(7, vendor_id);
                    int row = statement.executeUpdate();
                }
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
    }
    //end clear method

    public static void updateDish(Dish dish) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "update dish set dish_id=?, dish_name=?, vendor_id=?, dish_description=? where dish_id=? AND vendor_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, dish.getDish_id() + "");
            statement.setString(2, dish.getDish_name());
            statement.setString(3, dish.getVendor_id() + "");
            statement.setString(4, dish.getDish_description());
            statement.setString(5, dish.getDish_id() + "");
            statement.setString(6, dish.getVendor_id() + "");
            int row = statement.executeUpdate();
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
        HashMap<Ingredient, ArrayList<String>> map = dish.getIngredientQuantity();
        Set<Ingredient> iSet = map.keySet();
        Iterator<Ingredient> iter = iSet.iterator();
        while (iter.hasNext()) {
            Ingredient tempI = iter.next();
            ArrayList<String> tempList = map.get(tempI);
            int row = updateIngredientQuantity(dish.getDish_id() + "", tempI.getName(), dish.getVendor_id() + "", tempI.getSupplier_id() + "", tempList.get(0), tempList.get(1));
            if (row == 0) {
                addIngredientQuantity(tempI, tempList.get(0), tempList.get(1), dish.getDish_id() + "", dish.getVendor_id() + "");
            }
        }
    }

    public static int updateIngredientQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id, String quantity, String unit) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "update ingredient_quantity set quantity=?, unit=? where dish_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, quantity);
            statement.setString(2, unit);
            statement.setString(3, dish_id);
            statement.setString(4, ingredient_name);
            statement.setString(5, vendor_id);
            statement.setString(6, supplier_id);
            int row = statement.executeUpdate();
            return row;
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
        return 0;
    }

    //This method updates a record in the ingredient_template_quantity table
    public static int updateTemplateQuantity(String dish_id, String ingredient_name, String vendor_id, String supplier_id, String quantity, String unit) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try {
            conn = ConnectionManager.getConnection();
            query = "update ingredient_template_quantity set quantity=?, unit=? where template_id=? AND ingredient_name=? AND vendor_id=? AND supplier_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, quantity);
            statement.setString(2, unit);
            statement.setString(3, dish_id);
            statement.setString(4, ingredient_name);
            statement.setString(5, vendor_id);
            statement.setString(6, supplier_id);
            int row = statement.executeUpdate();
            return row;
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
        return 0;
    }
    //End method block

    public static ArrayList<Integer> getSupplierIdByIngredient(String ingredient_name) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Integer> idList = new ArrayList<Integer>();

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient where ingredient_name=? group by supplier_id";
            statement = conn.prepareStatement(query);
            statement.setString(1, ingredient_name);
            rs = statement.executeQuery();
            while (rs.next()) {
                int supId = Integer.parseInt(rs.getString("supplier_id"));
                idList.add(supId);
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
        return idList;
    }

    public static ArrayList<Dish> getAllDish() {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        ArrayList<Dish> dishList = new ArrayList<Dish>();
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from dish";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("dish_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dishList.add(new Dish(dishId, rs.getString("dish_name"), venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id"))));
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
        return dishList;
    }

    public static Dish getDishByID(int dish_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Dish dish = null;
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from dish where dish_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, UtilityController.convertIntToString(dish_id));
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("dish_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dish = new Dish(dishId, rs.getString("dish_name"), venId, rs.getString("dish_description"), getIngredientQuantity(rs.getString("dish_id")));
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
        return dish;
    }

//This method retrieves an ingredient template with the same id as the one passed in
    public static Dish getIngredientTemplateByID(int dish_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Dish dish = null;
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template where template_id=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, UtilityController.convertIntToString(dish_id));
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("template_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dish = new Dish(dishId, rs.getString("template_name"), venId, rs.getString("template_description"), getTemplateQuantity(rs.getString("template_id")));
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
        return dish;
    }

//End retrieving ingredient template
//Retrieves the template that is selected as one-click-order
    public static Dish getOneClickIngredientTemplate(int vendor_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        Dish dish = null;
        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template where vendor_id=? AND selected=?";
            statement = conn.prepareStatement(query);
            statement.setInt(1, vendor_id);
            statement.setInt(2, 1);
            rs = statement.executeQuery();
            while (rs.next()) {
                int dishId = Integer.parseInt(rs.getString("template_id"));
                int venId = Integer.parseInt(rs.getString("vendor_id"));
                dish = new Dish(dishId, rs.getString("template_name"), venId, rs.getString("template_description"), getTemplateQuantity(rs.getString("template_id")));
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
        return dish;
    }

    public static boolean checkIngredientQuantity(String supplierId, String ingredientName) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        //Ingredient ingredient = null;
        boolean check = true;

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_quantity where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, supplierId);
            statement.setString(2, ingredientName);
            rs = statement.executeQuery();
            if (!rs.next()) {
                check = false;
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
        return check;
    }

    public static boolean checkIngredientTemplateQuantity(String supplierId, String ingredientName) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        //Ingredient ingredient = null;
        boolean check = true;

        try {
            conn = ConnectionManager.getConnection();
            query = "select * from ingredient_template_quantity where supplier_id=? AND ingredient_name=?";
            statement = conn.prepareStatement(query);
            statement.setString(1, supplierId);
            statement.setString(2, ingredientName);
            rs = statement.executeQuery();

            if (!rs.next()) {
                check = false;
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
        return check;
    }

    
}
//End of template retrieval

