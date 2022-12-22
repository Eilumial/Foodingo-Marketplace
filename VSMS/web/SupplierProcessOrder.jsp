<%@page import="Model.*"%>
<%@page import="Controller.UserController"%>
<%@page import="Controller.OrderController"%>
<%@page import="java.util.ArrayList"%>






<html>
    <head>
        <%@ include file="protect_supplier.jsp" %>
        <meta charset="utf-8" />
        <title>Order History</title>

        <!--CSS-->
        <!-- Import CDN for semantic UI -->    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <!-- JSP Controller/ Variables Initiation -->
        <%            String action = request.getParameter("action");
            String ord_id = request.getParameter("order_id");
            if (action.equals("accept")) {
                OrderController.updateOrdStatus(Integer.parseInt(ord_id), "incoming");
            } else if (action.equals("reject")) {
                OrderController.updateOrdStatus(Integer.parseInt(ord_id), "rejected");
            } else if (action.equals("delivered")) {
                OrderController.updateOrdStatus(Integer.parseInt(ord_id), "delivered");
            }
        %>

    </head>
    <body class="background">


        <div class="transparency">


            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="SuppNavbar.jsp" %>


                <h1 style="color: black">Order History List</h1>
                <%
                    if (action.equals("accept")) {
                %> <h2>You have <font color="green">ACCEPTED</font> Order #<%=ord_id%></h2>
                    <%
                    } else if (action.equals("reject")) {
                    %> <h2>You have <font color="red">REJECTED</font> Order #<%=ord_id%></h2>
                    <%
                    } else if (action.equals("delivered")) {
                    %> <h2>You have <font color="green">delivered</font> Order #<%=ord_id%></h2>
                    <%
                        }
                    %>

                <div class="actions">
                    <form action="SupplierHome.jsp">
                        <button class="ui deny inverted orange button" type="submit">Take me Back</button>
                    </form>
                </div>
            </div>






            <!--JAVASCRIPT-->
            <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
            <script src="js/main.js" type="text/javascript"></script>


        </div>
    </body>
</html>