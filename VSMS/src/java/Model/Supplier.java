package Model;

import java.util.ArrayList;

public class Supplier {

    private int supplier_id;
    private String password;
    private String supplier_name;
    private String supplier_description;
    private String supplier_type;
    private String email;
    private int area_code;
    private int telephone_number;
    private String address;
    private int zipcode;
    private int min_leadtime;
    private int max_leadtime;

    public Supplier(int supplier_id, String password, String supplier_name, String supplier_description, String supplier_type, String email, int area_code, int telephone_number, String address, int zipcode, int min_leadtime, int max_leadtime) {
        this.supplier_id = supplier_id;
        this.password = password;
        this.supplier_name = supplier_name;
        this.supplier_description = supplier_description;
        this.supplier_type = supplier_type;
        this.email = email;
        this.area_code = area_code;
        this.telephone_number = telephone_number;
        this.address = address;
        this.zipcode = zipcode;
        this.min_leadtime = min_leadtime;
        this.max_leadtime = max_leadtime;
    }

    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public int getMin_leadtime() {
        return min_leadtime;
    }

    public void setMin_leadtime(int min_leadtime) {
        this.min_leadtime = min_leadtime;
    }

    public int getMax_leadtime() {
        return max_leadtime;
    }

    public void setMax_leadtime(int max_leadtime) {
        this.max_leadtime = max_leadtime;
    }


    public String getEmail() {
        return email;
    }

    public int getArea_code() {
        return area_code;
    }

    public int getTelephone_number() {
        return telephone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setArea_code(int area_code) {
        this.area_code = area_code;
    }

    public void setTelephone_number(int telephone_number) {
        this.telephone_number = telephone_number;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public String getPassword() {
        return password;
    }

    public String getSupplier_name() {
        return supplier_name;
    }

    public String getSupplier_description() {
        return supplier_description;
    }

    public String getSupplier_type() {
        return supplier_type;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

    public void setSupplier_description(String supplier_description) {
        this.supplier_description = supplier_description;
    }

    public void setSupplier_type(String supplier_type) {
        this.supplier_type = supplier_type;
    }

    public String toString() {
        return "Supplier ID: " + supplier_id + ", name: " + supplier_name + ", password: " + password + ", type: " + supplier_type + " description " + supplier_description + ", email: " + email + " telephone_number " + area_code + telephone_number + " address " + address +" zipcode "+zipcode+" min leadtime "+min_leadtime+" max leadtime "+max_leadtime;
    }

    @Override
    public int hashCode() {
        return supplier_id;
    }

    @Override
    public boolean equals(Object o) {
        return ((Supplier) o).supplier_id == this.supplier_id;
    }

}
