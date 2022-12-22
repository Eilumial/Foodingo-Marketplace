/*
 * To open up Supplier, Vendor, FavSupplier
 * Left to do:
 *  Add on attributes to suppliers and vendors?
 *  Sign up
 *  Adding Favourite Supplier
 *  Save and delete account
 *  Do email communication
 */
package DAO;

import Controller.ConnectionManager;
import Model.*;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class UserDAO {

//    //For testing purpose
    public static void main(String[] args) {
        //Test general SQL
        ArrayList<Supplier> supplierList = retrieveSupplierList();
        ArrayList<Vendor> vendorList = retrieveVendorList();
        ArrayList<FavouriteSupplier> favouriteSupplierList = retrieveFavouriteSupplierList();
        for (Supplier supplier : supplierList) {
            System.out.println(supplier);
        }
        for (Vendor vendor : vendorList) {
            System.out.println(vendor);
        }
        for (FavouriteSupplier favSupplier : favouriteSupplierList) {
            System.out.println(favSupplier);
        }

        //Test special sql
        System.out.println(loginSupplier("FreshFruitz", ""));
        System.out.println(loginVendor("Bob's Bakery And Bistro", ""));

        //signUpSupplier
//        signUpSupplier(new Supplier(9,"password123","FreshIngredientz","Fresh Ingredientz only","chinese","vincentt.2013@sis.smu.edu.sg",65,87221272,"Punggol Street 20 #03-02"));
        //signUpVendor
//        signUpVendor(new Vendor(2, "password", "Spiffy Dapper", "We sell the best quality coffee", "vincentt.2013@sis.smu.edu.sg", 65, 87221272, "Arab Street #03-02"));
        //saveAsFavouriteSupplier
//        saveAsFavouriteSupplier(2,1);
        //deleteFavouriteSupplier
//        deleteFavouriteSupplier(2,1);
    }

    private static void handleSQLException(SQLException e, String sql, String... parameters) {
        String msg = "Unable to access data. SQL : " + sql + "\n";

        for (String para : parameters) {
            msg += para + "\n";
        }

        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, msg, e);
        throw new RuntimeException(msg, e);
    }

    //SUPPLIER SQL
    public static ArrayList<Supplier> retrieveSupplierList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Supplier> supplierList = new ArrayList<Supplier>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from supplier";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                int supplier_id = rs.getInt("supplier_id");
                String supplier_name = rs.getString("supplier_name");
                String password = rs.getString("password");
                String supplier_description = rs.getString("supplier_description");
                String supplier_type = rs.getString("supplier_type");
                String email = rs.getString("email");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                int zipcode = rs.getInt("zipcode");
                int min_leadtime = rs.getInt("min_leadtime");
                int max_leadtime = rs.getInt("max_leadtime");

                Supplier supplier = new Supplier(supplier_id, password, supplier_name, supplier_description, supplier_type, email, area_code, telephone_number, address, zipcode, min_leadtime, max_leadtime);
                supplierList.add(supplier);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return supplierList;
    }

    public static Supplier getSupplierById(int supplier_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Supplier supplier = null;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from supplier where supplier_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, supplier_id);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                String password = rs.getString("password");
                String supplier_name = rs.getString("supplier_name");
                String supplier_description = rs.getString("supplier_description");
                String supplier_type = rs.getString("supplier_type");
                String email = rs.getString("email");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");

                int zipcode = rs.getInt("zipcode");
                int min_leadtime = rs.getInt("min_leadtime");
                int max_leadtime = rs.getInt("max_leadtime");

                supplier = new Supplier(supplier_id, password, supplier_name, supplier_description, supplier_type, email, area_code, telephone_number, address, zipcode, min_leadtime, max_leadtime);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return supplier;
    }

    public static void updateSupplier(Supplier supplier) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "UPDATE supplier"
                    + " SET password = #1, supplier_description = #2, supplier_type = #3 , email = #4, area_code = #5 , telephone_number = #6, address = #7, min_leadtime = #8, max_leadtime = #9 "
                    + " WHERE supplier_id = "+supplier.getSupplier_id();

            sql = sql.replace("#1", "'" + supplier.getPassword() + "'");
            sql = sql.replace("#2", "'" + supplier.getSupplier_description() + "'");
            sql = sql.replace("#3", "'" + supplier.getSupplier_type() + "'");
            sql = sql.replace("#4", "'" + supplier.getEmail() + "'");
            sql = sql.replace("#5", "'" + supplier.getArea_code() + "'");
            sql = sql.replace("#6", "'" + supplier.getTelephone_number() + "'");
            sql = sql.replace("#7", "'" + supplier.getAddress() + "'");
            sql = sql.replace("#8", "'" + supplier.getMin_leadtime() + "'");
            sql = sql.replace("#9", "'" + supplier.getMax_leadtime() + "'");
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found

        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    public static Supplier loginSupplier(String username, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Supplier supplier = null;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from supplier where email like '#1%' and password = '#2'";
            sql = sql.replace("#1", username);
            sql = sql.replace("#2", password);
            stmt = conn.prepareStatement(sql);

            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                int supplier_id = rs.getInt("supplier_id");
                String supplier_name = rs.getString("supplier_name");
                String supplier_description = rs.getString("supplier_description");
                String supplier_type = rs.getString("supplier_type");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                String email = rs.getString("email");

                int zipcode = rs.getInt("zipcode");
                int min_leadtime = rs.getInt("min_leadtime");
                int max_leadtime = rs.getInt("max_leadtime");

                supplier = new Supplier(supplier_id, password, supplier_name, supplier_description, supplier_type, email, area_code, telephone_number, address, zipcode, min_leadtime, max_leadtime);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return supplier;
    }

    public static void signUpSupplier(Supplier supplier) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "INSERT INTO supplier VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, supplier.getSupplier_id());
            statement.setString(2, supplier.getSupplier_name());
            statement.setString(3, supplier.getSupplier_description());
            statement.setString(4, supplier.getSupplier_type());
            statement.setString(5, supplier.getPassword());
            statement.setString(6, supplier.getEmail());
            statement.setInt(7, supplier.getArea_code());
            statement.setInt(8, supplier.getTelephone_number());
            statement.setString(9, supplier.getAddress());
            statement.setInt(10, supplier.getZipcode());
            statement.setInt(11, supplier.getMin_leadtime());
            statement.setInt(12, supplier.getMax_leadtime());
            statement.executeUpdate();
            statement.close();
            conn.close();
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

    //VENDOR SQL
    public static ArrayList<Vendor> retrieveVendorList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Vendor> vendorList = new ArrayList<Vendor>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from vendor";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                int vendor_id = rs.getInt("vendor_id");
                String vendor_name = rs.getString("vendor_name");
                String password = rs.getString("password");
                String vendor_description = rs.getString("vendor_description");
                String email = rs.getString("email");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                int zipcode = rs.getInt("zipcode");
                Vendor vendor = new Vendor(vendor_id, password, vendor_name, vendor_description, email, area_code, telephone_number, address, zipcode);
                vendorList.add(vendor);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            //conn.close();
            ConnectionManager.close(conn, stmt, rs);
        }
        return vendorList;

    }

    public static Vendor loginVendor(String username, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Vendor vendor = null;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from vendor where email like '#1%' and password = '#2'";
            sql = sql.replace("#1", username);
            sql = sql.replace("#2", password);
            stmt = conn.prepareStatement(sql);

            rs = stmt.executeQuery();

            //Retrieves the vendor info from database and create a new vendor object to return
            while (rs.next()) {
                int vendor_id = rs.getInt("vendor_id");
                String vendor_name = rs.getString("vendor_name");
                String vendor_description = rs.getString("vendor_description");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                String email = rs.getString("email");
                int zipcode = rs.getInt("zipcode");
                vendor = new Vendor(vendor_id, password, vendor_name, vendor_description, email, area_code, telephone_number, address, zipcode);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Vendor is not found
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return vendor;
    }

    public static void signUpVendor(Vendor vendor) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "INSERT INTO vendor VALUES (?,?,?,?,?,?,?,?,?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, vendor.getVendor_id());
            statement.setString(2, vendor.getVendor_name());
            statement.setString(3, vendor.getVendor_description());
            statement.setString(4, vendor.getPassword());
            statement.setString(5, vendor.getEmail());
            statement.setInt(6, vendor.getArea_code());
            statement.setInt(7, vendor.getTelephone_number());
            statement.setString(8, vendor.getAddress());
            statement.setInt(9, vendor.getZipcode());
            statement.executeUpdate();
            statement.close();
            conn.close();
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

    public static void updateVendor(Vendor vendor) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";

        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "UPDATE vendor"
                    + " SET password = #1, vendor_description = #2, email = #3, area_code = #4 , telephone_number = #5, address = #6, zipcode = #7"
                    + " WHERE vendor_id = #8";

            sql = sql.replace("#1", "'" + vendor.getPassword() + "'");
            sql = sql.replace("#2", "'" + vendor.getVendor_description() + "'");
            sql = sql.replace("#3", "'" + vendor.getEmail() + "'");
            sql = sql.replace("#4", "'" + vendor.getArea_code() + "'");
            sql = sql.replace("#5", "'" + vendor.getTelephone_number() + "'");
            sql = sql.replace("#6", "'" + vendor.getAddress() + "'");
            sql = sql.replace("#7", "'" + vendor.getZipcode() + "'");
            sql = sql.replace("#8", "'" + vendor.getVendor_id() + "'");
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found

        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    //FAVOURITE SUPPPLIER SQL
    public static ArrayList<FavouriteSupplier> retrieveFavouriteSupplierList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<FavouriteSupplier> favouriteSupplierList = new ArrayList<FavouriteSupplier>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from favourite_supplier";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                int vendor_id = rs.getInt("vendor_id");
                int supplier_id = rs.getInt("supplier_id");
                FavouriteSupplier favouriteSupplier = new FavouriteSupplier(vendor_id, supplier_id);
                favouriteSupplierList.add(favouriteSupplier);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            //conn.close();
            ConnectionManager.close(conn, stmt, rs);
        }
        return favouriteSupplierList;

    }

    public static Vendor getVendorByID(int vendor_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Vendor vendor = null;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from vendor where vendor_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, vendor_id);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                String vendor_name = rs.getString("vendor_name");
                String password = rs.getString("password");
                String vendor_description = rs.getString("vendor_description");
                String email = rs.getString("email");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                int zipcode = rs.getInt("zipcode");
                vendor = new Vendor(vendor_id, password, vendor_name, vendor_description, email, area_code, telephone_number, address, zipcode);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return vendor;
    }

    public static ArrayList<Supplier> retrieveFavouriteSupplierListByVendor(int vendor_id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        ArrayList<Supplier> supplierList = new ArrayList<Supplier>();
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from favourite_supplier fs, supplier s where fs.supplier_id = s.supplier_id and vendor_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, vendor_id);
            rs = stmt.executeQuery();

            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                int supplier_id = rs.getInt("supplier_id");
                String supplier_name = rs.getString("supplier_name");
                String password = rs.getString("password");
                String supplier_description = rs.getString("supplier_description");
                String supplier_type = rs.getString("supplier_type");
                String email = rs.getString("email");
                int area_code = rs.getInt("area_code");
                int telephone_number = rs.getInt("telephone_number");
                String address = rs.getString("address");
                int zipcode = rs.getInt("zipcode");
                int min_leadtime = rs.getInt("min_leadtime");
                int max_leadtime = rs.getInt("max_leadtime");

                Supplier supplier = new Supplier(supplier_id, password, supplier_name, supplier_description, supplier_type, email, area_code, telephone_number, address, zipcode, min_leadtime, max_leadtime);

                supplierList.add(supplier);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } finally {
            //conn.close();
            ConnectionManager.close(conn, stmt, rs);
        }
        return supplierList;

    }

    public static void saveAsFavouriteSupplier(int vendor_id, int supplier_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "INSERT INTO favourite_supplier " + "(vendor_id,supplier_id) VALUES(?,?)";
            //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setInt(1, vendor_id);
            statement.setInt(2, supplier_id);
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

    public static void deleteFavouriteSupplier(int vendor_id, int supplier_id) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";

        try {
            conn = ConnectionManager.getConnection();
            query = "Delete from favourite_supplier where vendor_id=? and supplier_id=?";
            //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setInt(1, vendor_id);
            statement.setInt(2, supplier_id);
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

    //TIM TEMP
    private HashMap suppliers = new HashMap();

    public HashMap getSuppliers() {
        return suppliers;
    }

    public UserDAO() {
        //int supplier_id, String password, String supplier_name, String supplier_description, String supplier_type, String email, int area_code, int telephone_number, String address
        //Supplier s = new Supplier(1, "abc123", "FreshFoodz", "something here", "western", "lala@gmail.com", 65, 646464, "asd");
        //suppliers.put("1", new Supplier(1, "abc123", "FreshFoodz", "something here", "western", "lala@gmail.com", 65, 646464, "asd"));
        //suppliers.put("2", new Supplier(2, "abc123", "Animal Farm", "something here", "western", "lala@gmail.com", 65, 646464, "asd"));

        ArrayList<Supplier> supList = retrieveSupplierList();

        int count = 1;
        for (Supplier s : supList) {
            suppliers.put(count + "", s);
            count++;
        }
    }

    public static int getAvailableVendorID() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        int lastID = 1;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select vendor_id from vendor order by vendor_id desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the last vendor id if any entries exist in database and increment by 1, else default 1
            
            if (rs.next()) {
                lastID = rs.getInt("vendor_id");
                lastID++;
            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return lastID;
    }
    
    public static int getAvailableSupplierID() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        int lastID = 1;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select supplier_id from supplier order by supplier_id desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            //Retrieves the last supplier id if any entries exist in database and increment by 1, else default 1
            
            if (rs.next()) {
                lastID = rs.getInt("supplier_id");
                lastID++;
            }

        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return lastID;
    }
    
    public static boolean checkVendorEmail(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        boolean check = false;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from vendor where email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            //if email exists in vendor table
            if (rs.next()) {
                check = true;
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        
        //true if email exists, false if not
        return check;
    }
    
    public static boolean checkSupplierEmail(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        boolean check = false;
        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "Select * from supplier where email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            //if email exists in supplier table
            if (rs.next()) {
                check = true;
            }
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        
        //true if email exists, false if not
        return check;
    }
    
    public static int updateVendorPassword(String email, String newPW) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        int updateNum = 0;

        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "UPDATE vendor"
                    + " SET password = #1"
                    + " WHERE email = '"+ email + "'";

            sql = sql.replace("#1", "'" + newPW + "'");
            
            stmt = conn.prepareStatement(sql);
            updateNum = stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found

        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        
        return updateNum;
    }
    
    public static int updateSupplierPassword(String email, String newPW) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        
        int updateNum = 0;

        try {
            //creates connections to database
            conn = ConnectionManager.getConnection();
            sql = "UPDATE supplier"
                    + " SET password = #1"
                    + " WHERE email = '"+ email + "'";

            sql = sql.replace("#1", "'" + newPW + "'");
            
            stmt = conn.prepareStatement(sql);
            updateNum = stmt.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, sql);
        } catch (Exception e) {
            //Supplier is not found

        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        
        return updateNum;
    }
}
