/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.UtilityController;
import java.io.InputStream;
import java.sql.Blob;

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
    private String compo_id;
    private InputStream picture;
    private int minimum_order_quantity;
    private String status;

    public Ingredient(int supplier_id, String name, String supplyUnit, String subcategory, String description, String offeredPrice, InputStream picture,int minimum_order_quantity,String status) {
        this.supplier_id = supplier_id;
        this.name = name;
        this.supplyUnit = supplyUnit;
        this.subcategory = subcategory;
        this.description = description;
        this.offeredPrice = offeredPrice;
        this.compo_id = name + "|@|" + supplier_id;
        this.picture = picture;
        this.minimum_order_quantity = minimum_order_quantity;
        this.status = status;
    }

    public Ingredient(int supplier_id, String name, String supplyUnit, String subcategory, String description, String offeredPrice,int minimum_order_quantity,String status) {
        this.supplier_id = supplier_id;
        this.name = name;
        this.supplyUnit = supplyUnit;
        this.subcategory = subcategory;
        this.description = description;
        this.offeredPrice = offeredPrice;
        this.compo_id = name + "|@|" + supplier_id;
        this.picture = null;
        this.minimum_order_quantity = minimum_order_quantity;
        this.status = status;
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

    public InputStream getPicture() {
        return picture;
    }

    public void setPicture(InputStream picture) {
        this.picture = picture;
    }

    public int getMinimum_order_quantity() {
        return minimum_order_quantity;
    }

    public void setMinimum_order_quantity(int minimum_order_quantity) {
        this.minimum_order_quantity = minimum_order_quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toString() {
        if (picture!=null) {
            return "Ingredient{" + "supplier_id=" + supplier_id + ", name=" + name + ", supplyUnit=" + supplyUnit + ", subcategory=" + subcategory + ", description=" + description + ", offeredPrice=" + UtilityController.convertDoubleToCurrString(UtilityController.convertStringtoDouble(offeredPrice)) + '}' + " moq: " +minimum_order_quantity+" status "+status+ " picture: " +picture.toString() ;
        } else {
            return "Ingredient{" + "supplier_id=" + supplier_id + ", name=" + name + ", supplyUnit=" + supplyUnit + ", subcategory=" + subcategory + ", description=" + description + ", offeredPrice=" + UtilityController.convertDoubleToCurrString(UtilityController.convertStringtoDouble(offeredPrice)) + '}' + " moq: " +minimum_order_quantity+" status "+status+ " picture: null" ;
        }
    }

    public boolean equalCheck(Ingredient i) {
        if (i.getName().equals(name) && i.getSupplier_id() == supplier_id) {
            return true;
        } else {
            return false;
        }
    }

    public String getCompo_ID() {
        return compo_id;
    }

    public void setCompo_ID(String compo_id) {
        this.compo_id = compo_id;
    }

}
