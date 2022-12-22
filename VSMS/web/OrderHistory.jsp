<%@page import="org.ocpsoft.prettytime.PrettyTime"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Orderline"%>
<%@page import="Controller.UserController"%>
<%@page import="Controller.OrderController"%>
<%@page import="Controller.ConnectionManager"%>
<%@page import="Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>

<html>
    <head>
        <%@ include file="protect.jsp" %>
        <meta charset="utf-8" />
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            DecimalFormat df = new DecimalFormat("0.00");
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
        %>
        <title>Order History</title>

        <!--CSS-->
        <!-- Import CDN for semantic UI -->    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <!-- JSP Controller/ Variables Initiation -->
        <%
            ArrayList<Order> orderList = OrderController.retrieveOrderList(currentVendor.getVendor_id());
        %>


        <script>
            $(document).ready(function () {
                $('.secondary.menu .item').tab();

                $('.test.order').popup({
                    position: 'top left'
                });



            <%
                for (Order orderModal : orderList) {
            %>
//              Will go through edit-dish-button1 or edit-dish-button2 (regarding the dish id)
                $(".test.order.<%=orderModal.getOrder_id()%>").click(function () {

                    $('#modalOrder<%=orderModal.getOrder_id()%>').modal('show');
                });

            <%}%>
            });
        </script>


    </head>
    <body class="background">

        <div class="transparency">


            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>
                <h1 class="ui header">
                    <i class="history icon"></i>
                    <div class="content" >
                        Order History
                        <div  style="color:black"  class="sub header">Viewing Previous Made Orders</div>
                    </div>
                </h1>
                <br/>

                <%
                    ArrayList<Order> pendingOrders = new ArrayList<Order>();
                    ArrayList<Order> incomingOrders = new ArrayList<Order>();
                    ArrayList<Order> deliveredOrders = new ArrayList<Order>();
                    ArrayList<Order> rejectedOrders = new ArrayList<Order>();

//                    creation of order modals and sorting of orders done here
                    for (Order order : orderList) {
                %>


                <div id="modalOrder<%=order.getOrder_id()%>" class="ui modal">

                    <div class="header">
                        <h1>Order No. <%=order.getOrder_id()%></h1>
                    </div>
                    <div class="image content">
                        <div class="ui medium image">
                            <img src="./resource/pictures/Cart.png">
                        </div>
                        <div class="description">
                            <div class="ui header" style="color: black"  >
                                Order ID : <%=order.getOrder_id()%> <br/>
                                Supplier : <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> <br/>
                                <%PrettyTime p = new PrettyTime();%>
                                Date : <%=order.getDtOrder()%> ( <%=p.format(order.getDtOrder())%> )<br/><br/>
                                Items:

                            </div>
                            <table class="ui single line unstackable table" >
                                <thead>
                                    <tr>
                                        <th><div class="ui ribbon label">No. </div></th>
                                        <th>Name</th>
                                        <th>Unit</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <%
                                    int count = 0;
                                    for (Orderline orderLine : order.getOrderlines()) {
                                        count++;

                                %>
                                <tr>

                                    <td><div class="ui ribbon label"><%=count%> </div>&nbsp;</td>
                                    <td><%=orderLine.getIngredient_name()%> &nbsp;</td>

                                    <!--units to be edited-->
                                    <%--<%=IngredientController.getIngredient(Integer.toString(orderLine.getSupplier_id()), orderLine.getIngredient_name()).getSupplyUnit()%>--%>
                                    <td><%=orderLine.getQuantity()%> &nbsp;</td>
                                    <td>$<%=df.format(orderLine.getFinalprice())%>&nbsp;</td>

                                </tr>
                                <%}%>

                            </table>
                        </div>

                    </div>

                    <div class="actions">
                        <a href="Invoice.jsp?order_id=<%=order.getOrder_id()%>"><button class="ui deny inverted red button">View Invoice</button></a>
                        <a href="ChatVendor.jsp?order_id=<%=order.getOrder_id()%>&hiddenvalue=<%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%>"><button class="ui deny inverted green button">Chat with Supplier</button></a>
                        <button class="ui deny inverted orange button">Take me Back</button>
                    </div>
                </div>


                <%

                        if (order.getStatus().equals("pending")) {
                            pendingOrders.add(order);
                        } else if (order.getStatus().equals("incoming")) {
                            incomingOrders.add(order);
                        } else if (order.getStatus().equals("delivered")){
                            deliveredOrders.add(order);
                        } else if (order.getStatus().equals("rejected")) {
                            rejectedOrders.add(order);
                        }
                    }
                %>

                <!--tabs menu-->
                <div class="ui pointing secondary menu">
                    <a class="item active" style="font-size:18px" data-tab="first">Pending Orders</a>
                    <a class="item"  style="font-size:18px" data-tab="second">Incoming Orders</a>
                    <a class="item" style="font-size:18px" data-tab ="third">Delivered Orders</a>
                    <a class="item" style="font-size:18px" data-tab="fourth">Rejected Orders</a>
                </div>

                <!--Pending orders section-->
                <div class="ui tab segment active" data-tab="first" id="ignorePDF">
                    <%
                        int pendingList = pendingOrders.size();
                        int pendingPageNo = pendingList / 10;
                        if (pendingPageNo > 0) {
                            if (pendingList % 10 != 0) {
                                pendingPageNo++;
                            }
                        }

                    %>


                    <!--printing first 10 pendings orders-->
                    <div class="ui active tab middle aligned animated selection divided list" data-tab="101">


                        <%for (int count = 0; count < 10; count++) {
                                if (pendingOrders.size() > count) {

                                    Order order = pendingOrders.get(count);
                        %>



                        <div  class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> 
                                    <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>


                        <%}
                            }%>


                    </div>


                    <!--Printing the beyond the 10th pending order-->
                    <%
                        for (int j = 2; j <= pendingPageNo; j++) {
                    %>

                    <div class="ui tab middle aligned animated selection divided list" data-tab="<%=j + 100%>">

                        <%for (int count = (j - 1) * 10; count < j * 10; count++) {
                                if (pendingOrders.size() > count) {

                                    Order order = pendingOrders.get(count);
                        %>


                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> )  
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>



                        <%}
                            }%>
                    </div>

                    <%}%>


                    <!--Start of pagination-->
                    <div>
                        <%
                            if (pendingPageNo > 1) {
                        %>
                        <div class="ui pagination secondary menu">
                            <a class="active item" data-tab="101">
                                1
                            </a>
                            <%
                                for (int j = 1; j < pendingPageNo; j++) {
                            %>
                            <a class="item" data-tab="<%=j + 101%>">
                                <%=j + 1%>
                            </a>
                            <%}%>
                        </div>
                        <% }
                        %>

                    </div>
                    <!--End of pagination-->
                </div>


















                <!--Start of section for Incoming orders-->
                <div class="ui tab segment" data-tab="second">

                    <%
                        int incomingList = incomingOrders.size();
                        int incomingPageNo = incomingList / 10;
                        if (incomingPageNo > 0) {
                            if (incomingList % 10 != 0) {
                                incomingPageNo++;
                            }
                        }

                    %>





                    <!--printing first 10 completed orders-->  

                    <div class="ui active tab middle aligned animated selection divided list" data-tab="201">


                        <%for (int count = 0; count < 10; count++) {
                                if (incomingOrders.size() > count) {

                                    Order order = incomingOrders.get(count);
                        %>



                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>

                        <%}
                            }%>

                    </div>
                    <!--end of printing first 10 completed orders-->  





                    <!--Printing the beyond the 10th incoming order-->
                    <%
                        for (int j = 2; j <= incomingPageNo; j++) {
                    %>

                    <div class="ui tab middle aligned animated selection divided list" data-tab="<%=j + 200%>">

                        <%for (int count = (j - 1) * 10; count < j * 10; count++) {
                                if (incomingOrders.size() > count) {

                                    Order order = incomingOrders.get(count);
                        %>


                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 

                                </div>
                            </a>
                        </div>



                        <%}
                            }%>
                    </div>

                    <%}%>

                    <!--end of Printing the beyond the 10th completed order-->




                    <!--Start of pagination-->
                    <div>
                        <%
                            if (incomingPageNo > 1) {
                        %>
                        <div class="ui pagination secondary menu">
                            <a class="active item" data-tab="201">
                                1
                            </a>
                            <%
                                for (int j = 1; j < incomingPageNo; j++) {
                            %>
                            <a class="item" data-tab="<%=j + 201%>">
                                <%=j + 1%>
                            </a>
                            <%}%>
                        </div>
                        <% }
                        %>

                    </div>

                    <!--End of pagination-->  

                </div>










                <!--Start of Delivered Orders section-->

                <div class="ui tab segment" data-tab="third">





                    <%
                        int deliveredList = deliveredOrders.size();
                        int deliveredPageNo = deliveredList / 10;
                        if (deliveredPageNo > 0) {
                            if (deliveredList % 10 != 0) {
                                deliveredPageNo++;
                            }
                        }

                    %>





                    <!--printing first 10 completed orders-->  

                    <div class="ui active tab middle aligned animated selection divided list" data-tab="301">


                        <%for (int count = 0; count < 10; count++) {
                                if (deliveredOrders.size() > count) {

                                    Order order = deliveredOrders.get(count);
                        %>



                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>

                        <%}
                            }%>

                    </div>
                    <!--end of printing first 10 completed orders-->  





                    <!--Printing the beyond the 10th completed order-->
                    <%
                        for (int j = 2; j <= deliveredPageNo; j++) {
                    %>

                    <div class="ui tab middle aligned animated selection divided list" data-tab="<%=j + 300%>">

                        <%for (int count = (j - 1) * 10; count < j * 10; count++) {
                                if (deliveredOrders.size() > count) {

                                    Order order = deliveredOrders.get(count);
                        %>


                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>



                        <%}
                            }%>
                    </div>

                    <%}%>

                    <!--end of Printing the beyond the 10th completed order-->




                    <!--Start of pagination-->
                    <div>
                        <%
                            if (deliveredPageNo > 1) {
                        %>
                        <div class="ui pagination secondary menu">
                            <a class="active item" data-tab="301">
                                1
                            </a>
                            <%
                                for (int j = 1; j < deliveredPageNo; j++) {
                            %>
                            <a class="item" data-tab="<%=j + 301%>">
                                <%=j + 1%>
                            </a>
                            <%}%>
                        </div>
                        <% }
                        %>

                    </div>

                    <!--End of pagination-->  
                </div>


























                <!--Start of Rejected Orders section-->

                <div class="ui tab segment" data-tab="fourth">





                    <%
                        int rejectedList = rejectedOrders.size();
                        int rejectedPageNo = rejectedList / 10;
                        if (rejectedPageNo > 0) {
                            if (rejectedList % 10 != 0) {
                                rejectedPageNo++;
                            }
                        }

                    %>





                    <!--printing first 10 completed orders-->  

                    <div class="ui active tab middle aligned animated selection divided list" data-tab="301">


                        <%for (int count = 0; count < 10; count++) {
                                if (rejectedOrders.size() > count) {

                                    Order order = rejectedOrders.get(count);
                        %>



                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>

                        <%}
                            }%>

                    </div>
                    <!--end of printing first 10 completed orders-->  





                    <!--Printing the beyond the 10th completed order-->
                    <%
                        for (int j = 2; j <= rejectedPageNo; j++) {
                    %>

                    <div class="ui tab middle aligned animated selection divided list" data-tab="<%=j + 300%>">

                        <%for (int count = (j - 1) * 10; count < j * 10; count++) {
                                if (rejectedOrders.size() > count) {

                                    Order order = rejectedOrders.get(count);
                        %>


                        <div class="item test order <%=order.getOrder_id()%>" id="<%=order.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">

                            <a>
                                <div class="content">
                                    <h2>Order No. <%=order.getOrder_id()%></h2> <%PrettyTime p = new PrettyTime();%>
                                    <%=order.getDtOrder()%>( <%=p.format(order.getDtOrder())%> ) 
                                </div>
                                <div>
                                    Supplier: <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> &nbsp;
                                    Price: $<%=df.format(order.getTotal_final_price())%> 


                                </div>
                            </a>
                        </div>



                        <%}
                            }%>
                    </div>

                    <%}%>

                    <!--end of Printing the beyond the 10th completed order-->




                    <!--Start of pagination-->
                    <div>
                        <%
                            if (rejectedPageNo > 1) {
                        %>
                        <div class="ui pagination secondary menu">
                            <a class="active item" data-tab="301">
                                1
                            </a>
                            <%
                                for (int j = 1; j < rejectedPageNo; j++) {
                            %>
                            <a class="item" data-tab="<%=j + 301%>">
                                <%=j + 1%>
                            </a>
                            <%}%>
                        </div>
                        <% }
                        %>

                    </div>

                    <!--End of pagination-->  
                </div>






                <!--JAVASCRIPT-->
                <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
                <script src="js/main.js" type="text/javascript"></script>

                </script>
            </div>
        </div>
    </body>
</html>
