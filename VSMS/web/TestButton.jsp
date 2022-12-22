<%-- 
    Document   : TestButton
    Created on : Feb 27, 2016, 11:46:34 AM
    Author     : David
--%>

<%@page import="Model.Vendor"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Dish"%>
<%@page import="Controller.IngredientController"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.IngredientDAO"%>
<%@page import="Model.Ingredient"%>
<%@page import="Model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <div id="pc pusher" class="background">


            <div class="transparency">

                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>
                    <h1>OrderIngredientTest</h1>
                    <%
                        int cartID = (Integer) IngredientDAO.getIngredientTemplateID("1") - 1;
                        Dish cart = (Dish) IngredientDAO.getIngredientTemplateByID(cartID);
                        IngredientDAO.updateIngredientTemplate(cart);

                        ArrayList<Ingredient> ingredientList = IngredientDAO.getIngredientBySupplier(1);
                    %><table border="1"><%
                        for (Ingredient ingredient : ingredientList) {
                        %>
                        <!--adds an ingredient to cart-->
                        <tr><td><%=ingredient.getName()%></td><td>
                                <form action="OrderByIngredientServlet" method="get">
                                    Quantity<input type="text" value="0" name="quantity">
                                    <input type="hidden" name="ingredientname" value="<%=ingredient.getName()%>">
                                    <input type="hidden" name="supplierId" value="1">
                                    <input type="hidden" name="CartId" value="<%=cartID%>">
                                    <input type="hidden" name="action" value="add">
                                    <input type="submit">
                                </form>
                            </td></tr>
                            <%}%>
                    </table>
                    <!--End of adding-->
                    <!--Prints out the contents of a shopping cart named cart-->
                    <br>
                    <br>
                    Contents of cart
                    <table border="1">
                        <tr><td>Ingredient</td><td>Quantity</td><td>Units</td></tr>
                        <%
                            HashMap<Ingredient, ArrayList<String>> map = cart.getIngredientQuantity();
                            Set<Ingredient> ingredientSet = map.keySet();
                            Iterator iter = ingredientSet.iterator();
                            while (iter.hasNext()) {
                                Ingredient ing = (Ingredient) iter.next();
                                ArrayList<String> list = map.get(ing);
                        %>
                        <tr><td><%=ing.getName()%></td><td><%=list.get(0)%></td><td><%=list.get(1)%></td></tr>
                        <%
                            }
                        %>

                    </table>
                    <!--End printing of shopping cart contents-->

                    <!--Sends shopping cart to orderbreakdown servlet to convert into order-->
                    <br>
                    <br>
                    Send cart to orderbreakdown
                    <form action="OrderBreakdown.jsp" method="POST">
                        <input type="hidden" value="1" name="dish<%=cart.getDish_id()%>">
                        <input type="hidden" name="vendor_id" value="1">
                        <input type="hidden" name="cart" value="yes">
                        <input type="submit" value="Submit"> 
                    </form>
                    <!--End order sending-->
                    <!--Saves shopping cart to template-->
                    <br>
                    <br>
                    Save current shopping cart to template
                    <table border="1"><tr>
                        <form action="OrderByIngredientServlet" method="get">
                            <td>Template name<input type="text" value="" name="name" required></td>
                            <td>Template description<input type="text" value="" name="description" required></td>
                            <input type="hidden" name="action" value="save">
                            <input type="hidden" name="CartId" value="<%=cartID%>">
                            <td><input type="submit" value="save"></td>
                        </form>
                        </tr>
                    </table>
                    <!--End of saving shopping card-->
                    <!--Loads a list of templates while excluding the current shopping cart-->
                    <br>
                    <br>
                    Templates in database
                    <table border="1">
                        <%
                            ArrayList<Dish> dishList = IngredientDAO.getIngredientTemplates("1");
                            for (Dish dish : dishList) {
                                if (dish.getDish_id() != cartID) {

                        %>
                        <tr>
                            <td><%=dish.getDish_name()%><br></td>
                            <td><%=dish.getDish_description()%><br></td>




                            <td>
                                <!--End loading list of templates-->
                                <!--sets a selected template as the one-click-order-->
                                <form action="OrderByIngredientServlet" method="get">
                                    <input type="hidden" name="CartId" value="<%=dish.getDish_id()%>">
                                    <input type="hidden" name="action" value="select">
                                    <input type="submit">
                                </form>
                            </td>
                        </tr>
                        <%      }
                        }%>
                    </table>
                        <!--end-->
                        <br>
                        <br>
                        <table><tr><td>
                                    Delete shopping cart stored in session
                                </td><td>
                                    <form action="OrderByIngredientServlet" method="get">
                                        <input type="hidden" name="action" value="invalidate">
                                        <input type="hidden" name="CartId" value="<%=cartID%>">
                                        <input type="submit" value="delete">
                                    </form>
                                </td></tr></table>
----------------------------Start of One-Click-Order---------------------------------------------------------------------                
            <%
                   Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
                   Dish oneClickOrder=IngredientDAO.getOneClickIngredientTemplate(currentVendor.getVendor_id());
                %>
                
                    <form action="OrderBreakdown.jsp" method="POST">
                        <input type="hidden" value="1" name="dish<%=oneClickOrder.getDish_id()%>">
                        <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>">
                        <input type="hidden" name="cart" value="yes">
                        <input type="submit" value="One Click Order"> 
                    </form>
--------------------------------------------------------------------------------------------------------------------                
                
                </div>
            </div>
        </div>
    </body>
</html>
