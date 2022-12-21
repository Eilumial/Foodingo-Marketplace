
package Model;

public class FavouriteSupplier {
    private int supplier_id;
    private int vendor_id;

    public FavouriteSupplier(int vendor_id, int supplier_id) {
        this.supplier_id = supplier_id;
        this.vendor_id = vendor_id;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }
    public String toString() {
        return "Vendor ID: " + vendor_id +", supplier_id: "+supplier_id;
    }
    
    
}
