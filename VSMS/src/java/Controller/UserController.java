package Controller;

import DAO.UserDAO;
import Model.Supplier;
import Model.Vendor;
import java.util.ArrayList;

public class UserController {

    public static ArrayList<Supplier> retrieveSupplierList() {
        return UserDAO.retrieveSupplierList();
    }

    public static Supplier loginSupplier(String supplier_name, String password) {
        return UserDAO.loginSupplier(supplier_name, password);
    }

    public static void signUpSupplier(Supplier supplier) {
        UserDAO.signUpSupplier(supplier);
    }
    public static Supplier retrieveSupplierByID(int supplierID){
        return UserDAO.getSupplierById(supplierID);
    }

    public static Vendor retrieveVendorByID(int vendorID){
        return UserDAO.getVendorByID(vendorID);
    }
    public static ArrayList<Vendor> retrieveVendorList() {
        return UserDAO.retrieveVendorList();
    }

    public static Vendor loginVendor(String vendor_name, String password) {
        return UserDAO.loginVendor(vendor_name, password);
    }

    public static void signUpVendor(Vendor vendor) {
        UserDAO.signUpVendor(vendor);
    }

    public static ArrayList<Supplier> retrieveSupplierListByVendor(int vendor_id) {
        return UserDAO.retrieveFavouriteSupplierListByVendor(vendor_id);
    }

    public static void saveAsFavouriteSupplier(int vendor_id, int supplier_id) {
        UserDAO.saveAsFavouriteSupplier(vendor_id, supplier_id);
    }

    public static void deleteFavouriteSupplier(int vendor_id, int supplier_id) {
        UserDAO.deleteFavouriteSupplier(vendor_id, supplier_id);
    }
}
