package Model;

import java.util.logging.Logger;

public class Vendor {

    private int vendor_id;
    private String password;
    private String vendor_name;
    private String vendor_description;
    private String email;
    private int area_code;
    private int telephone_number;
    private String address;

    public Vendor(int vendor_id, String password, String vendor_name, String vendor_description, String email, int area_code, int telephone_number, String address) {
        this.vendor_id = vendor_id;
        this.password = password;
        this.vendor_name = vendor_name;
        this.vendor_description = vendor_description;
        this.email = email;
        this.area_code = area_code;
        this.telephone_number = telephone_number;
        this.address = address;
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

    public int getVendor_id() {
        return vendor_id;
    }

    public String getPassword() {
        return password;
    }

    public String getVendor_name() {
        return vendor_name;
    }

    public String getVendor_description() {
        return vendor_description;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setVendor_name(String vendor_name) {
        this.vendor_name = vendor_name;
    }

    public void setVendor_description(String vendor_description) {
        this.vendor_description = vendor_description;
    }

    public String toString() {
        return "Vendor ID: " + vendor_id + ", name: " + vendor_name + ", password: " + password + " description " + vendor_description +", email: "+email+" telephone_number "+area_code+telephone_number +" address "+address;
    }
    @Override
    public int hashCode() {
        return vendor_id;
    }

    @Override
    public boolean equals(Object o) {
        return ((Vendor) o).vendor_id == this.vendor_id;
    }

}
