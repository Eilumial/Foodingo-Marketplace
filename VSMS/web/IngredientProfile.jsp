<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="com.sun.faces.io.Base64InputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Model.Ingredient"%>
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
        <title>Ingredient Profile</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code

            });
        </script>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>


                <%                    Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
                    if (currentVendor == null) {
                        currentVendor = UserController.retrieveVendorByID(1);
                    }
                    //this will get the ingredient name and supplier as the unique identifier of Ingredient
                    String supplierIdStr = request.getParameter("supplier_id");
                    String ingredientName = request.getParameter("ingredient_name");
                    Ingredient ingredient = IngredientController.getIngredient(supplierIdStr, ingredientName);
                %>

                <h1 class="ui header">
                    <img src="resource/pictures/carrot.png" alt="HTML5 Icon" style="width:45px;height:45px;">

                    <div class="content">
                        Ingredient Profile
                        <div style="color:black" class="sub header">Check this ingredient</div>
                    </div>
                </h1>
                <h1 style="color:black"><%=ingredient.getName()%></h1>
                <table class="ui very padded large striped  table">

                    <tr>
                        <th><h2>Description</h2></th>
                    <td><h3><%=ingredient.getDescription()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Supplier</h2></th>
                    <td><h3><%=UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getSupplier_name()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Supply Unit</h2></th>
                    <td><h3><%=ingredient.getSupplyUnit()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Sub Category</h2></th>
                    <td><h3><%=ingredient.getSubcategory()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Offered Price</h2></th>
                    <td><h3>S$<%=UtilityController.convertDoubleToCurrString(Double.parseDouble(ingredient.getOfferedPrice()))%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Minimum Order Quantity</h2></th>
                    <td><h3><%=ingredient.getMinimum_order_quantity()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Status</h2></th>
                        <%String status = ingredient.getStatus();
                    if (status.equals("available")) {%>
                    <td><h3><font color="green"><%=status%></font></h3></td>
                            <% } else {%>
                    <td><h3><font color="red"><%=status%></font></h3></td>
                            <%}%>    
                    </tr>
                    <tr>
                        <th><h2>Picture</h2></th>
                        <%
                            InputStream picture = ingredient.getPicture();
                            System.out.println("the picture is " + picture);
                            String image = "resource\\pictures\\default-placeholder.png";
                            if (picture != null) {
                                image = UtilityController.convertInputStreamToString(picture);
                            }
                        %>
                    <td><img id="image" src="<%=image%>" class='ingredientImage' alt="your image" /></td>
                    </tr>
                </table>
                <a style="color:white" href="SupplierSearchProfile.jsp?supplier_id=<%=ingredient.getSupplier_id()%>" ><button class="ui large orange button">To <%=UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getSupplier_name()%>'s Page</button></a>
            </div>
        </div>
        <!--JAVASCRIPT-->
        <script>$("#form").validate();</script>
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

