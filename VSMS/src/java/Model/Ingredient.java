/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author David
 */
public class Ingredient {
    private int supplier_id;
    private String name;
    private String supplyUnit;
    private String subcategory;
    private String description;
    private String offeredPrice;
    
    public Ingredient(int supplier_id,String name,String supplyUnit,String subcategory,String description,String offeredPrice){
        this.supplier_id=supplier_id;
        this.name=name;
        this.supplyUnit=supplyUnit;
        this.subcategory=subcategory;
        this.description=description;
        this.offeredPrice=offeredPrice;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSupplyUnit() {
        return supplyUnit;
    }

    public void setSupplyUnit(String supplyUnit) {
        this.supplyUnit = supplyUnit;
    }

    public String getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(String subcategory) {
        this.subcategory = subcategory;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOfferedPrice() {
        return offeredPrice;
    }

    public void setOfferedPrice(String offeredPrice) {
        this.offeredPrice = offeredPrice;
    }

    public String toString() {
        return "Ingredient{" + "supplier_id=" + supplier_id + ", name=" + name + ", supplyUnit=" + supplyUnit + ", subcategory=" + subcategory + ", description=" + description + ", offeredPrice=" + offeredPrice + '}';
    }
    
    
    
         
}
