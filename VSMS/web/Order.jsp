<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="Controller.UtilityController"%>
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
        <title>Order</title>
        <link rel="stylesheet" href="css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>

        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            ArrayList<Dish> dishList = IngredientController.getDish(UtilityController.convertIntToString(currentVendor.getVendor_id()));
        %>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code

            }
        </script>

        <!--CSS-->
        <!-- Import CDN for semantic UI -->    

    </head>
    <body class="background">
        <div class="transparency">
            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>
                <h1 class="ui header">
                    <i class="in cart icon"></i>
                    <div class="content" >
                        Order Creation
                        <div  style="color:black"  class="sub header">Making an Order</div>
                    </div>
                </h1>
                <br/>
                <!--<h1 style="color: black">Order</h1>-->

                <!--Inputting form elements-->

                <form action="OrderBreakdown.jsp" method="POST">
                    <!--This table will send all the dishid info (textbox) with the dish_count as hidden parameter-->




                    <table  class="ui padded large striped unstackable table">
                        <tr>
                            <th><h2>Dish</h2></th><th><h2>Quantity</h2></th>
                        </tr>
                        <%
                            for (Dish dish : dishList) {
                        %>
                        <tr>

                            <td><h3><label for= "dish<%=dish.getDish_id()%>"> <%=dish.getDish_name()%></h3></td>
                            <td> <div class="ui input">
                                    <input type="number" value="0" min="0" max="99999" maxlength="5" placeholder="quantity.." name="dish<%=dish.getDish_id()%>" id="ordervalue<%=dish.getDish_id()%>" required>&nbsp;
                                </div>
                            </td>


                        </tr>
                        <%}%>
                        <!--Input hidden attributes-->
                    </table>
                   
                    <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>"/>
                    <br/>

                    <button type="submit" class="ui green large button" name="submit" id="submit"/><i class="checkmark icon"></i>Check Order Breakdown </button>


                </form>

            </div>

            <!--JAVASCRIPT-->
            <!--for general Javascript please refer to the main js. For others, please just html the script line below-->
            <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
