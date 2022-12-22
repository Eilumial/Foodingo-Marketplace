<%-- 
    Document   : OrderTemplate
    Created on : Feb 12, 2016, 1:48:50 PM
    Author     : David
--%>

<%@page import="Controller.UtilityController"%>
<%@page import="Model.Dish"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="Model.OrderTemplate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <%@ include file="protect.jsp" %>
        <%
            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Template</title>
    </head>
    <body>

        <div id="pc" class="background">


            <div class="transparency">


                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>

                    <p></p>
                    <h1 style="color:black">Edit Order Template</h1>
                    <!--Displays an order template-->
                    <form action="EditTemplateServlet" method="get">
                        <table  class="ui padded large striped  table">
                            <tr><th><h2>Dish Name</h2></th><th><h2>Dish Quantity</h2></th></tr>
                            <%                ArrayList<OrderTemplate> templates = OrderDAO.retrieveOrderTemplates(currentVendor.getVendor_id());
                                String orderId = request.getParameter("orderId");
                                for (OrderTemplate template : templates) {
                                    if (template.getOrder_id() == UtilityController.convertStringtoInt(orderId)) {
                                        %>
                                        <td><div class="ui input">
                                    <input type="text" value=<%=template.getName()%> placeholder="<%=template.getName()%>" name="templateName" id="templateName"/>&nbsp;
                                </div></td><%
                                        ArrayList<Dish> dishList = template.getDishList();
                                        ArrayList<Integer> intList = template.getStringList();
                                        for (int i = 0; i < dishList.size(); i++) {
                                            Dish dish = dishList.get(i);
                                            int num = intList.get(i);
                            %>

                            <tr>
                                <td><h3><label for= "dish<%=dish.getDish_id()%>"> <%=dish.getDish_name()%></label></h3></td>
                                
                                <td><div class="ui input">
                                    <input type="number" value=<%=num%> placeholder="quantity.." name="dish<%=dish.getDish_id()%>" id="ordervalue<%=dish.getDish_id()%>"/>&nbsp;
                                </div></td>
                            </tr>
                            <%
                                        }
                                    }
                                }
                            %>
                        </table>
                        <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>"/>
                        <input type="hidden" name="order_id" value="<%=UtilityController.convertStringtoInt(orderId)%>"/>
                        <button type="submit" class="ui green large button" name="submit" id="submit"/><i class="checkmark icon"></i>Edit</button>
                    </form>  
                    <%
                    %>    
                    <!--End displaying an order template-->
                </div>
            </div>
        </div>
    </body>
</html>