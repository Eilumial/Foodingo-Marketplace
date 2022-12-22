<%-- 
    Document   : ShoppingCartDisplay
    Created on : Mar 13, 2016, 4:17:38 PM
    Author     : David
--%>

<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Dish"%>
<%@page import="DAO.IngredientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.ui.accordion').accordion();

                $('.title.template.prompt').popup({
                    position: 'bottom left'
                });

            });
        </script>
        <link rel="stylesheet" href="css/main.css">
        <title>My Shopping Cart</title>

    </head>
    <body class="background">


        <div class="transparency">


            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>
                <h1 class="ui header">
                    <i class="cart icon"></i>
                    <div class="content" >
                        Shopping Cart
                        <div  style="color:black"  class="sub header">Viewing My Shopping Cart</div>
                    </div>
                </h1>

                <h2 style="color:black">Contents of My Cart</h2>
                <table class="ui selectable collapsing celled padded unstackable table" >
                    <thread><tr><th><div class="ui ribbon label">No. </div></th><th>Ingredient</th><th>Quantity</th><th>Units</th></tr></thread>
                                <%
                                    Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
                                    if (currentVendor == null) {
                                        currentVendor = UserController.retrieveVendorByID(1);
                                    }
                                    int cartID = (Integer)session.getAttribute("CartId");
                                    int count = 0;

                                    Dish cart = (Dish) IngredientDAO.getIngredientTemplateByID(cartID);
                                    IngredientDAO.updateIngredientTemplate(cart);
                                    HashMap<Ingredient, ArrayList<String>> map = cart.getIngredientQuantity();
                                    Set<Ingredient> ingredientSet = map.keySet();
                                    Iterator iter = ingredientSet.iterator();
                                    while (iter.hasNext()) {
                                        count++;
                                        Ingredient ing = (Ingredient) iter.next();
                                        ArrayList<String> list = map.get(ing);
                                %>
                    <tr><td><div class="ui ribbon label"><%=count%> </div>&nbsp;</td><td><%=ing.getName()%></td><td><%=list.get(0)%></td><td><%=list.get(1)%></td></tr>
                    <%
                        }
                    %>

                </table>
                <br/>
                <form action="OrderBreakdown.jsp" method="POST">
                    <input type="hidden" value="1" name="dish<%=cart.getDish_id()%>">
                    <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>">
                    <input type="hidden" name="cart" value="yes">
                    <input class="ui large green button" type="submit" value="Submit Order"> 
                </form>

                <br>
                <br>


                <div class="ui accordion field">
                    <div class="title template prompt" data-content="Click to Save Template"  data-variation="inverted">
                        <h3 style="color:black"><i class="icon dropdown"></i>Save your current Shopping Cart as an Order Template</h3>
                    </div>
                    <div class="content field">
                        <form class="ui form" action="OrderByIngredientServlet" method="get">
                            <h4>Template Name:</h4>
                            <div class="ui input">
                                <input type="text" placeholder="Template Name..." name="name">
                            </div>
                            <br/>
                            <h4>Template Description:</h4>
                            <textarea id="template_description" rows="3" name="description" required></textarea>

                            <input type="hidden" name="action" value="save"/>
                            <input type="hidden" name="CartId" value="<%=cartID%>"/>
                            <br/><br/>
                            <input class="ui large green button" type="submit" value="Save Template"/>
                        </form>
                    </div>
                </div>





            </div>
        </div>

    </body>
</html>
