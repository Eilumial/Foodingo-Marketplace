<%-- 
    Document   : ManageTemplate
    Created on : Mar 13, 2016, 5:10:51 PM
    Author     : David
--%>

<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Dish"%>
<%@page import="DAO.IngredientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="protect.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <title>Ingredient Template</title>
    </head>
    <body>
        <div id="pc pusher" class="background">


            <div class="transparency">


                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>

                    <h1 class="ui header">
                        <i class="file text outline icon"></i>
                        <div class="content" >
                            Order Templates by Ingredients
                            <div  style="color:black"  class="sub header">Managing/Ordering With Ingredient Order Templates</div>
                        </div>
                    </h1>
                    <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
                        if (currentVendor == null) {
                            currentVendor = UserController.retrieveVendorByID(1);
                        }
                        int cartID = (Integer) IngredientDAO.getIngredientTemplateID(currentVendor.getVendor_id() + "") - 1;
                        Dish cart = (Dish) IngredientDAO.getIngredientTemplateByID(cartID);
                        IngredientDAO.updateIngredientTemplate(cart);

                    %>
                    <h2 style="color:black"> Ingredient Order Template</h2>


                    <div class="ui middle aligned animated selection divided list">
                        <% ArrayList<Dish> dishList = IngredientDAO.getIngredientTemplates(currentVendor.getVendor_id() + "");
                            for (Dish dish : dishList) {
                                if (dish.getDish_id() != cartID) {
//                                    out.print(dish.getDish_name());
//                                    out.print(dish.getDish_description());
                        %>




                        <div class="item test template" data-content="Click to view/edit order template"  data-variation="inverted">
                            <div class="right floated content">


                                <%if (IngredientDAO.isOneClickOrder(dish.getDish_id())) {%>
                                <h3>Default Template</h3>
                                <%} else {%>
                                <form action="OrderByIngredientServlet" method="get">
                                    <input type="hidden" name="CartId" value="<%=dish.getDish_id()%>">
                                    <input type="hidden" name="action" value="select">
                                    <input class="ui button" type="submit" value="Make Default">
                                </form>
                                <%}%>

                            </div>
                            <div class="content">
                                <h3 style="color:black">
                                    <%=dish.getDish_name()%>

                                </h3>
                                <text><%=dish.getDish_description()%>
                                </text>
                                <br/>
                            </div>
                        </div>
                        <%      }
                            }%>
                    </div>





                </div>
            </div>
        </div>

    </body>
</html>
