<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="DAO.IngredientDAO"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Order Breakdown</title>
        <link rel="stylesheet" href="css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <!--OrderBreakdown.jsp will receive vendor_id:, action: confirm and the list of dishid with their values-->
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            String vendor_idStr = request.getParameter("vendor_id");
            String action = request.getParameter("action");
            String cart = request.getParameter("cart");
            System.out.println(cart);
            ArrayList<Dish> dishList;
            if (cart != null && cart.equals("yes")) {
                System.out.println("I came here");
                dishList = IngredientDAO.getIngredientTemplates(vendor_idStr);
                System.out.println(dishList.size());
            } else {
                dishList = IngredientController.getDish(vendor_idStr);
                cart = "no";
            }
            //System.out.println(dishList.size());
            //    Empty String to contain POST AJAX String of Dish Quantity List
            String valueStr = "";
            int total = 0;
            for (Dish dish : dishList) {
                //System.out.println(dish==null);
                String str = request.getParameter("dish" + dish.getDish_id());
                if (str != null) {
                    int quan = Integer.parseInt(str);
                    total += quan;
                    if (quan != 0) {
                        valueStr += "," + "dish" + dish.getDish_id() + ":" + request.getParameter("dish" + dish.getDish_id());
                    }
                }

            }
        %>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
            //Hide AJAX Loading Message
            $(".loading").hide();
            //Generate the order breakdown
            $.post("orderservlet", {vendor_id:<%=vendor_idStr%>, action: 'confirm', cart:<%="'" + cart + "'"%> <%=valueStr%> }, function(responseText) {
            $(".content-model-table").html(responseText);
            });
            //Regenerate the order breakdown when bufferQtyTextbox is changed
            $("#bufferqtyperc").change(function() {
            //Make the value string
            $.post("orderservlet", {vendor_id:<%=vendor_idStr%>, action: 'confirm', bufferqtyperc : $('#bufferqtyperc').val(),cart:<%="'" + cart + "'"%> <%=valueStr%>}, function(responseText) {
            $(".content-model-table").html(responseText);
            });
            });
            //Confirm the order breakdown
            $("#confirm-order-breakdown").click(function() {
            $(".loading").show();
            console.log("Sending order breakdown");
            //Timeout is used to make sure that the loading text is shown first before the synchronous ajax kicks
//                    Synchronous ajax is used to make sure that the order processing could be done with a fixed buffer quantity
            setTimeout(function() {$.ajaxSetup({async:false});
            $.post("orderservlet", {vendor_id:<%=vendor_idStr%>, action: 'create', special_request:$('#special_request').val(), bufferqtyperc : $('#bufferqtyperc').val() <%=valueStr%>}, function(responseText) {                    });
            alert("Order has been sent to suppliers");
            window.location.replace('OrderHistory.jsp');
            }, 1000);
            });
            });
            //T
            $(document).ajaxStart(function() {
            $(".loading").show();
            });
            $(document).ajaxStop(function() {
            $(".loading").hide();
            });</script>

        <!--CSS-->
        <!-- Import CDN for semantic UI -->    

    </head>
    <body class="background">


        <div class="transparency">


            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>

                <h1 class="ui header">
                    <i class="cart icon"></i>
                    <div class="content" >
                        Order Breakdown
                        <div  style="color:black"  class="sub header">Confirming Order</div>
                    </div>
                </h1>


                <!--Inputting form elements-->
                <% if (total > 0) { %>
                <h3><label for= "bufferqtyperc"> Buffer Quantity (in Percentage)</label></h3>
                <div class="ui right labeled input">
                    <input type="number" min=0 max=100 value=0 name="bufferqtyperc" id="bufferqtyperc"/>
                    <div class="ui basic label">
                        %
                    </div>
                </div>
                <!--printing of loading status-->

                <hr>
                <% } else { %>
                No dishes selected.
                <% } %>
                <div class="ui segment">
                    <div class="ui active inverted dimmer loading">
                        <div class="ui large text loader">Loading</div>
                    </div>
                    <div class="content-model-table">  
                    </div>
                </div>
                <!--This table will send all the dishid info (textbox) with the dish_count as hidden parameter-->


                <% if (total > 0) { %>
                <h3><label for= "special_request"> Special Request</h3>
                <textarea  rows="4" cols="50" name="special_request" id="special_request"></textarea><br>
                <button class="ui green inverted large button" id="confirm-order-breakdown"> <i class="check icon"></i>Confirm Order Breakdown</button>

                <% }%>
            </div>
        </div>

        <!--JAVASCRIPT-->
        <!--for general Javascript please refer to the main js. For others, please just html the script line below-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
