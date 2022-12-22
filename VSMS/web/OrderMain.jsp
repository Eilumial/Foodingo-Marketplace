<%-- 
    Document   : OrderMain
    Created on : Feb 12, 2016, 1:47:10 PM
    Author     : David
--%>

<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <%
            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
        %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Main</title>
    </head>
    <body>

        <div id="pc" class="background">


            <div class="transparency">


                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>
                    <a href="Order.jsp">Create a new order</a>
                    <a href="TemplateMain.jsp">Create order from template</a>

                </div>
            </div>
        </div>

    </body>
</html>
