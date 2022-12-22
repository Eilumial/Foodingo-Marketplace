<!--NOT USED, for Ingredient searches specialized-->
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Ingredient"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Ingredient Search</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <%
            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            //Receive Dish ID from RecipeBuilder.jsp
            String dish_idStr = request.getParameter("dish_id");
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> supplierList = UserController.retrieveSupplierList();
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> favSupplierList = UserController.retrieveSupplierListByVendor(currentVendor.getVendor_id());

            String ingredientName = request.getParameter("ingredient_name");
            if (ingredientName == null) {
                ingredientName = "";
            }
        %>

        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
                //SEARCHING AND FILTERING
                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbyname
                $('.menu .item').tab();

                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbyingredient
                $.get("userservlet", {vendor_id: "1", supplier_id: "1", action: "searchingredienttoadd", word: $('#searchingredient').val()}, function(responseText) {
                    $("#ingredientlist").html(responseText);
                });
                $("#searchingredient").keyup(function() {
                    $.get("userservlet", {vendor_id: "1", supplier_id: "1", action: "searchingredienttoadd", word: $('#searchingredient').val()}, function(responseText) {
                        $("#ingredientlist").html(responseText);
                    });
                });
                initialise();
            });
            $(document).ajaxComplete(function() {
                initialise();
            });
            function initialise() {
                //Prepare modals for each type of ingredients in which you can input the quantity value
            <%// Get a list of ingredients with their possible
                ArrayList<Ingredient> ingredientList = IngredientController.getIngredientList();
                for (Ingredient ingredient : ingredientList) {%>
                //              Will go through edit-dish-button1 or edit-dish-button2 (regarding the dish id)
                $("#add-ingredient-modal-button<%=ingredient.getSupplier_id()%><%=ingredient.getName().replaceAll("\\s+","")%>").click(function() {
                    console.log("My name is #add-ingredient-modal-button<%=ingredient.getSupplier_id()%><%=ingredient.getName().replaceAll("\\s+","")%>");
                    //show modal button
                    $('#add-ingredient-modal-div<%=ingredient.getSupplier_id()%><%=ingredient.getName().replaceAll("\\s+","")%>').modal('show');
                });
            <%}
            %>
            }
            ;


        </script>
        <!--CSS-->
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

    </head>
    <body class="background">
        <div class="transparency">
            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>

                <h1>Ingredient Name Search</h1>


                Ingredient Name : <input type="text" name="searchingredient" id="searchingredient" value="<%=ingredientName%>"/>

                <table id="ingredientlist" class="ui single line table">                                
                </table>

                <!--Create modal list for all the types of ingredients-->
                <%
                    for (Ingredient ingredient : ingredientList) {
                %>
                <div id="add-ingredient-modal-div<%=ingredient.getSupplier_id()%><%=ingredient.getName().replaceAll("\\s+","")%>" class="ui small modal">
                    <i class="close icon"></i>
                    <div class="header">
                        Please insert the quantity for <%=ingredient.getName().replaceAll("\\s+","")%>
                    </div>

                    <div class="content">
                        <form class="ui form" action="ingredientservlet" method="get"> 
                            <!--Inputting form elements-->
                            <h2><label for= "quantity"> Quantity</label></h2>
                            <div class="ui right labeled input">
                                <input type="number" value=0 name="quantity" id="quantity"/>
                                <div class="ui basic label">
                                    <%=ingredient.getSupplyUnit()%>
                                </div>
                            </div>

                            <!--Input hidden attributes-->
                            <input type="hidden" name="ingredient_name" value="<%=ingredient.getName()%>">
                            <input type="hidden" name="supplier_id" value="<%=ingredient.getSupplier_id()%>">
                            <input type="hidden" name="quantity_unit" value="<%=ingredient.getSupplyUnit()%>">
                            <input type="hidden" name="dish_id" value="<%=dish_idStr%>">
                            <input type="hidden" name="vendor_id" value="1">
                            <input type="hidden" name="action" value="addIngredient"><br>

                            <input type="submit" value="Add This Ingredient" class="ui teal button" /> 
                        </form>
                    </div>
                    <div class="actions">
                        <div class="ui positive right labeled icon button">
                            <a class="text-white" href="<?php echo site_url('home/order');?>">Back to Home</a>
                            <i class="checkmark icon"></i>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</body>
</html>
