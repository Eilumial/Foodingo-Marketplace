<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.UtilityController"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.HashMap"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
        %>
        <title>Recipe Builder</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <%
            //To query Dish to be attached with an <Ingredient,IngredientQuantity> HashMap
            String dish_idStr = request.getParameter("dish_id");
            HashMap<Ingredient, ArrayList<String>> ingredientList = IngredientController.getIngredientQuantity(dish_idStr);
            Iterator iter = ingredientList.keySet().iterator();
            String valueSent = "";
        %>
        <script>
            $(document).ready(function () { // Prepare the document to ready all the dom functions before running this code
                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbyingredient
                $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchingredienttoadd", word: $('#searchingredient').val()}, function (responseText) {
                    $("#ingredientlist").html(responseText);
                });
                $("#searchingredient").keyup(function () {
                    $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchingredienttoadd", word: $('#searchingredient').val()}, function (responseText) {
                        $("#ingredientlist").html(responseText);
                    });
                });
                //To show up the modal with the list of ingredients
                $("#create-ingredient-button").click(function () {
                    console.log("My name is create ingredient button");
                    //show modal button
                    $("#create-ingredient-modal").modal('show');
                });




            <% while (iter.hasNext()) {
                    Ingredient ingredient = (Ingredient) iter.next();
                    int supplier_id = ingredient.getSupplier_id();
                    String name = ingredient.getName();
                    String identification = supplier_id + name;
                    identification = identification.replace(" ", "_");
                    ArrayList<String> stringArray = ingredientList.get(ingredient);
                    //Value sent gets all the naming and values from the inputs of the dishes quantity
                    valueSent += ",quantity" + identification + ":$('#quantity" + identification + "').val()";
            %>
                $(".delete-ingredient-button<%=identification%>").click(function () {

                    console.log("My name is delete-dish-button<%=identification%>");
                    //show modal button
                    $('#deletemodaldiv<%=identification%>').modal('show');
                });
            <%}
            %>
                //To confirm the creation of ingredients
                $("#confirm-dish").click(function () {
                    $.ajaxSetup({async: false});
                    $(".loading").show();

                    setTimeout(function () {
                        $.get("ingredientservlet", {dish_id: "<%=dish_idStr%>", action: "confirmIngredientQuantity"<%=valueSent%>}, function (responseText) {
                            alert("the confirmation is successful")
                            window.location.replace('Menu.jsp')
                        });
                    }, 1000);
                });
            });

            $(document).ajaxComplete(function () {
            <%  ArrayList<Ingredient> allIngredientList = IngredientController.getIngredientList();
                for (Ingredient ingredient : allIngredientList) {
                    int supplier_id = ingredient.getSupplier_id();
                    String name = ingredient.getName();
                    String identification = supplier_id + name;
                    identification = identification.replace(" ", "_");
            %>
                $("#add-ingredient-modal-button<%=identification%>").click(function () {
                    $.get("ingredientservlet", {dish_id: "<%=dish_idStr%>", ingredient_name: "<%=name%>", supplier_id: "<%=supplier_id%>", action: "addIngredient", quantity: 1}, function (responseText) {
                    });
                    //Reload the browser and exit modal
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                });
            <%}
                iter = ingredientList.keySet().iterator();
            %>

            });
            $(document).ajaxStart(function () {
                $(".loading").show();
            });
            $(document).ajaxStop(function () {
                $(".loading").hide();
            });
        </script>
        <!--CSS-->
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>

                <h1 class="ui header">
                    <img src="resource/pictures/dishIcon.png" alt="HTML5 Icon" style="width:45px;height:45px;">

                    <div class="content">
                        Recipe Builder
                        <div class="sub header" style="color:black">Designing your own Dish</div>
                    </div>
                </h1>
                <br/>

                <h1 style="color:black"><%=IngredientController.getDishByID(UtilityController.convertStringtoInt(dish_idStr)).getDish_name()%></h1>

                <table  class="ui padded large striped unstackable  table">
                    <tr>
                        <th><h2>Ingredient</h2></th><th><h2>Amount</h2></th><th><h2>Unit</h2></th>
                    </tr>
                    <% while (iter.hasNext()) {
                            Ingredient ingredient = (Ingredient) iter.next();
                            int supplier_id = ingredient.getSupplier_id();
                            String name = ingredient.getName();
                            String identification = supplier_id + name;
                            identification = identification.replace(" ", "_");
                            ArrayList<String> stringArray = ingredientList.get(ingredient);

                    %>
                    <tr>
                        <td><h3><%=ingredient.getName()%></h3><%=ingredient.getDescription()%></td>
                        <!--User inputs attributes-->
                        <td>
                            <div class="ui small input">
                                <input type="number" name="quantity<%=identification%>" id="quantity<%=identification%>" value="<%=stringArray.get(0)%>">
                            </div>
                        </td>
                        <td><h3><%=stringArray.get(1)%></h3></td>
                        <td><button class="ui red inverted button delete-ingredient-button<%=identification%>"> <i class="remove icon"></i>Remove Ingredient</button></td>
                    </tr>
                    <% }//Refreshing iter for later use               
                        iter = ingredientList.keySet().iterator();
                    %>
                </table>

                <!--Input hidden attributes (need to input dish_id,vendor_id,supplier_id)-->

                <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>">
                <input type="hidden" name="dish_id" value="<%=request.getParameter("dish_id")%>">
                <br/>
                <!--To open Search ingredient modal-->
                <button name="submit" class="ui large green button" id="create-ingredient-button"><i class="plus icon"></i>Add Ingredient</button>




                <!--To settle the quantities of all lines-->
                <button type="submit" name="submit" class="ui large green button" id="confirm-dish"><i class="checkmark icon"></i>Save Dish</button>
                <!--Shown while ajax is loading-->

                <div class="ui loading">
                    <p ><div class="ui active inline loader"></div><font color="red">&nbsp Your request is loading...</font></p>
                </div>
                <!--MODAL DIV //This will be used to put the filtering process -->

                <div id="create-ingredient-modal" class="ui small modal">

                    <div class="header">
                        <h2>Add Ingredients</h2> 
                    </div>
                    <div class="content">
                        <h3 style="color:black">Find Ingredient : </h3> 
                        <div class="ui input">
                            <input type="text" name="searchingredient" id="searchingredient" value=""/>


                        </div>

                        <div class="ui segment">
                            <div class="ui active inverted top dimmer loading">

                                <div class="ui text loader">Loading</div>
                            </div>
                            <div id="ingredientlist" class="ui middle aligned animated selection divided list">

                            </div>

                        </div>

                    </div>

                    <div class="actions">
                        <button class="ui inverted deny orange button">Cancel</button>
                    </div>
                </div


                <!--Create many modals for each ingredient to be deleted-->
                <% while (iter.hasNext()) {
                        Ingredient ingredient = (Ingredient) iter.next();
                        int supplier_id = ingredient.getSupplier_id();
                        String name = ingredient.getName();
                        String identification = supplier_id + name;
                        identification = identification.replace(" ", "_");
                        ArrayList<String> stringArray = ingredientList.get(ingredient);

                %>
                <div id="deletemodaldiv<%=identification%>" class="ui small modal">

                    <div class="header">
                        <h2>Delete Dish</h2>
                    </div>

                    <div class="content">
                        <form class="ui form" id="deleteIngredient" action="ingredientservlet" method="get"> 
                            <!--Inserting delete danger message. -->

                            <h3>Are you sure you want to remove this ingredient?</h3>

                            <!--Input hidden attributes-->
                            <input type="hidden" name="name" value="<%=ingredient.getName()%>">
                            <input type="hidden" name="supplier_id" value="<%=ingredient.getSupplier_id()%>">
                            <input type="hidden" name="dish_id" value="<%=dish_idStr%>">
                            <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>">

                            <input type="hidden" name="action" value="delete">



                            </div>
                            <div class="actions">
                                <input type="submit" value="Delete" class="ui inverted red button" /> 
                        </form>    
                        <button class="ui inverted deny orange button">Cancel</button>


                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>

<!--JAVASCRIPT-->
<!--for general Javascript please refer to the main js. For others, please just append the script line below-->
<script src="js/main.js" type="text/javascript"></script>
</body>
</html>

