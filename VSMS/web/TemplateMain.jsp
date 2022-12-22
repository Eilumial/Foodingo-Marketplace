<%-- 
    Document   : TemplateMain
    Created on : Feb 17, 2016, 10:02:46 PM
    Author     : David
--%>

<%@page import="Model.OrderTemplate"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <title>Order Template Main</title>
        <script>

            $(document).ready(function () {
                $('.test.template').popup({
                    position: 'top left'
                });
            });
        </script>
        <title>Template by Dish</title>
    </head>
    <body>
        <div id="pc" class="background">


            <div class="transparency">


                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>
                    <h1 class="ui header">
                        <i class="file text outline icon"></i>
                        <div class="content" >
                            Order Templates by Dish
                            <div  style="color:black"  class="sub header">Managing/Ordering With Dish Order Templates</div>
                        </div>
                    </h1>
                    <br/>
                    <h2 style="color:black"> Dish Order Templates</h2>

                    <%
                        //in case current vendor does not exist
                        if (currentVendor == null) {
                            currentVendor = UserController.retrieveVendorByID(1);
                        }

                        ArrayList<OrderTemplate> templates = OrderDAO.retrieveOrderTemplates(currentVendor.getVendor_id());
                    %>
                    <div class="ui middle aligned animated selection divided list">
                        <%
                            for (OrderTemplate template : templates) {
                        %>
                        <div class="item test template" data-content="Click to view/edit order template"  data-variation="inverted">
                            <div class="right floated content">
                                <form action="DeleteTemplateServlet">
                                    <input type="hidden" value="1" name="vendor_id"> 
                                    <input type="hidden" value="<%=template.getOrder_id()%>" name="orderId">
                                    <button class="ui large inverted red button"><i class="delete icon"></i>Delete Template</button>
                                </form>
                            </div>
                            <div class="content">
                                <h3>
                                    <a href="OrderTemplate.jsp?orderId=<%=template.getOrder_id()%>"><%=template.getName()%></a>
                                </h3>
                                <br/>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <br/>
                    <button class="ui large green button"> <a style="color:white" href="CreateTemplate.jsp"><i class="plus icon"></i>Create New Order Template</a> </button>


                </div>
            </div>
        </div>
    </body>
</html>
