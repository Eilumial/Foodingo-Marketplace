<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="Model.Ingredient"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Model.Supplier"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>

        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
                //To edit user account and password changes

                //Will go through the edit profile button
                $(".favorite-supplier").click(function() {
                    //show modal button
                    $('#favoritesupppliermodal').modal('show');
                });
                //Will go through the edit password button
                $(".unfavorite-supplier").click(function() {
                    //show modal button
                    $('#unfavoritesuppliermodal').modal('show');
                });

                $('.menu .item').tab();

                $('.test.ingredients').popup({
                    position: 'top left'
                });
            });
        </script>
        <style>
            #map {
                width: 400px;
                height: 400px;
            }
        </style>
        <title>Supplier Search Profile</title>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>

                <%                    Vendor vendor = (Vendor) session.getAttribute("currentVendor");
                    if (vendor == null) {
                        vendor = UserController.retrieveVendorByID(1);
                    }
                    int vendor_id = vendor.getVendor_id();
                    String supplier_idStr = request.getParameter("supplier_id");
                    int supplier_id = UtilityController.convertStringtoInt(supplier_idStr);
                    Supplier supplier = UserController.retrieveSupplierByID(supplier_id);
                %>
                <h2 class="ui header">
                    <i class="shipping icon"></i>
                    <div class="content">
                        Supplier Profile
                        <div class="sub header">View Supplier Profile</div>
                    </div>
                </h2>
                <div class="ui warning message disclaimer">
                    <i class="close icon"></i>
                    <div class="header">
                        Disclaimer:
                    </div>
                    By viewing this page, you promise not to abuse this information. Any suspicious activities/spam will cause in direct actions from administration.
                </div>



                <h1 style="color:black"><%=supplier.getSupplier_name()%></h1>


                <div class="ui top attached tabular menu">
                    <a class="item active" style="font-size:18px" data-tab="supplierDescription" id="supplier_name_tab">Supplier Details</a>
                    <a class="item"  style="font-size:18px" data-tab="ingredients" id="supplier_type_tab">Supplied Ingredients</a>
                </div>
                <!--Email and telephone number will be hidden-->
                <div class="ui bottom attached tab segment active" id="supplier_name_div" data-tab="supplierDescription">
                    <table class="ui very padded large striped  table">
                        <tr>
                            <th><h2>Description</h2></th>
                        <td><h3><%=supplier.getSupplier_description()%></h3></td>
                        </tr>
                        <!--<tr>-->
                        <!--                            <th><h2>Email</h2></th>
                                                <td><h3></h3></td>-->
                        <!--supplier.getEmail()-->
                        <!--</tr>-->

                        <!--                        <tr>
                                                    <th><h2>Telephone Number</h2></th>
                                                <td><h3></h3></td>
                        "(" + supplier.getArea_code() + ")" + supplier.getTelephone_number()
                                                </tr>-->
                        <tr>
                            <th><h2>Expected Delivery Range</h2></th>
                        <td><h3><%= supplier.getMin_leadtime() + " - " + supplier.getMax_leadtime()%> Days</h3></td>
                        </tr>
                        <tr>
                            <th><h2>Address</h2></th>
                        <td><h3><%=supplier.getAddress()%> <%=supplier.getZipcode()%></h3></td>
                        </tr>


                    </table>
                    <div id="map"></div>
                    <br/>

                    <%
                        ArrayList<Supplier> favSupplierList = UserController.retrieveSupplierListByVendor(vendor.getVendor_id());
                        if (favSupplierList.contains(supplier)) {
                    %>
                    <button class="ui red large button unfavorite-supplier"><i class="remove icon"></i>Remove from Favorites</button>
                    <%
                    } else {
                    %><button class="ui green large button favorite-supplier"><i class="star icon"></i>Add to Favorites</button>
                    <%
                        }
                    %>
                    <a href="ChatVendor.jsp?hiddenvalue=<%=supplier.getSupplier_name()%>"><button class="ui deny inverted green button">Chat with Supplier</button></a>

                </div>

                <div class="ui bottom attached tab segment" id="supplier_name_div" data-tab="ingredients">
                    <!--Table to show the ingredient list-->
                    <table class="ui padded large striped  table">
                        <tr>
                            <th><h2>Ingredients Supplied</h2></th>
                        </tr>
                        <%
                            ArrayList<Ingredient> ingredientList = IngredientController.getIngredientBySupplier(supplier_id);
                            for (Ingredient ingredient : ingredientList) {
                        %>
                        <tr>

                            <td>
                                <div class="item test ingredients" data-content="Click to view ingredient details"  data-variation="inverted">
                                    <h3>
                                        <a href="IngredientProfile.jsp?ingredient_name=<%=ingredient.getName()%>&supplier_id=<%=supplier_id%>"><%=ingredient.getPicture()%></a>
                                        <a href="IngredientProfile.jsp?ingredient_name=<%=ingredient.getName()%>&supplier_id=<%=supplier_id%>"><%=ingredient.getName()%></a>
                                        <a href="IngredientProfile.jsp?ingredient_name=<%=ingredient.getName()%>&supplier_id=<%=supplier_id%>">(S$<%=UtilityController.convertDoubleToCurrString(Double.parseDouble(ingredient.getOfferedPrice()))%> per <%=ingredient.getSupplyUnit()%>)</a>
                                    </h3>
                                </div>
                                <div>
                                    <form action="OrderByIngredientServlet" method="get">
                                        <div class="ui right labeled input">
                                            <div class="ui label">Quantity:</div>
                                            <input type="number" name="quantity">
                                            <div class="ui basic label"><%=ingredient.getSupplyUnit()%></div>
                                        </div> 

                                        <input type="hidden" name="ingredientname" value="<%=ingredient.getName()%>">
                                        <input type="hidden" name="supplierId" value="<%=ingredient.getSupplier_id()%>">
                                        <input type="hidden" name="CartId" value="<%=(Integer) session.getAttribute("CartId")%>">
                                        <input type="hidden" name="action" value="add">
                                        <button type="submit" class="ui green button ">Add to Cart</button>

                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <!--Create a modal for favorite the supplier-->
                </div>





                <div id="favoritesupppliermodal" class="ui small modal">
                    <div class="header">
                        Favorite This Supplier
                    </div>

                    <div class="content">
                        <form class="ui form" id="deleteFavsupplier" action="userservlet" method="get"> 
                            <!--Inserting delete danger message. -->

                            <h3>Are you sure you would like to add <font color="orange"><%=supplier.getSupplier_name()%></font> to favorites?</h3> 

                            <!--Input hidden attributes-->
                            <input type="hidden" name="supplier_id" value="<%=supplier.getSupplier_id()%>">
                            <input type="hidden" name="vendor_id" value="<%=vendor_id%>">
                            <input type="hidden" name="action" value="create">


                            </div>
                            <div class="actions">
                                <input type="submit" value="Favorite this Supplier" class="ui inverted green button" /> 
                        </form>
                        <button class="ui deny orange inverted button">Cancel</button>
                    </div>
                </div>

                <!--Create a modal for unfavorite the supplier-->
                <div id="unfavoritesuppliermodal" class="ui small modal">
                    <i class="close icon"></i>
                    <div class="header">
                        Remove Supplier from Favorites
                    </div>

                    <div class="content">
                        <form class="ui form" id="deleteFavsupplier" action="userservlet" method="get"> 
                            <!--Inserting delete danger message. -->

                            <h3>
                                Are you sure you would like remove <font color="orange"><%=supplier.getSupplier_name()%></font> from Favorites?</h3>

                            <!--Input hidden attributes-->
                            <input type="hidden" name="supplier_id" value="<%=supplier.getSupplier_id()%>">
                            <input type="hidden" name="vendor_id" value="<%=vendor_id%>">
                            <input type="hidden" name="action" value="delete">


                            </div>
                            <div class="actions">
                                <input type="submit" value="Remove from Favorites" class="ui red inverted button" /> 
                        </form>
                        <button class="ui inverted orange deny button">Cancel</button>
                    </div>
                </div>

            </div>
        </div>
        <!--JAVASCRIPT-->
        <script>$("#form").validate();</script>
        <!-- Google Maps JS API -->
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <!-- GMaps Library (settings of div style is at the head) -->
        <script src="js/gmaps.js"></script>
        <script>
            /* Map Object */
            var mapObj = new GMaps({
                el: '#map',
                lat: 48.857,
                lng: 2.295
            });
            GMaps.geocode({
                address: '<%=supplier.getAddress()%>',
                callback: function(results, status) {
                    if (status == 'OK') {
                        latlng = results[0].geometry.location;
                        mapObj.setCenter(latlng.lat(), latlng.lng());
                        mapObj.addMarker({
                            lat: latlng.lat(),
                            lng: latlng.lng(),
                            title: '<%=supplier.getSupplier_name()%>',
                            infoWindow: {
                                content: '<h4><%=supplier.getSupplier_name()%></h4><div><%=supplier.getAddress()%><br> Singapore, <%=supplier.getZipcode()%></div>',
                                maxWidth: 100
                            }
                        });
                    } else if (status == 'ZERO_RESULTS') {
                        alert('Sorry, no results found');
                    }
                }
            })
        </script>
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

