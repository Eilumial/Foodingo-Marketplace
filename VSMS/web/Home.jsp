<%-- 
    Document   : MainMenu
    Created on : Jan 18, 2016, 1:03:48 PM
    Author     : Benjamin
--%>

<%@page import="Model.Dish"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Orderline"%>
<%@page import="Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ShoppingCart"%>
<%@page import="DAO.IngredientDAO"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Controller.OrderController"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <%@ include file="protect.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            DecimalFormat df = new DecimalFormat("0.00");
            int vendor_id = currentVendor.getVendor_id();
//Creates a shopping cart whenever a user logs in to be used by that user
            if (session.getAttribute("CartId") == null) {
                Dish cart = new Dish(IngredientDAO.getIngredientTemplateID("1"), "Shopping Cart", vendor_id, "A cart to place your ingredients in");
                IngredientDAO.addIngredientTemplate(cart);
                session.setAttribute("CartId", cart.getDish_id());
            }
//End of shopping cart creation

            ArrayList<Order> orderList = OrderController.retrieveOrderList(currentVendor.getVendor_id());
            ArrayList<Order> pendingOrders = new ArrayList<Order>();
            ArrayList<Order> incomingOrders = new ArrayList<Order>();
            ArrayList<Order> rejectedOrders = new ArrayList<Order>();


        %>
        <script>
            $(document).ready(function() {
                $('.message').click(function() {
                    //show modal button
                    $('#modalMessage').modal('show');
                });
                $('.profile').click(function() {
                    //show modal button
                    $('#modalAccount').modal('show');
                });
                //This is for the navbar ingredient search input
                $('.ingredient-name-input-home').keypress(function(e) {
                    console.log("Keypress  is pressed");
                    if (e.which == 13) {
                        document.location.href = "SupplierSearch.jsp?ingredient_name=" + $('.ingredient-name-input-home').val();
                    }
                });
                $('.ingredient-name-input-button-home').click(function() {
                    document.location.href = "SupplierSearch.jsp?ingredient_name=" + $('.ingredient-name-input-home').val();
                });

//              //For mobile view, will implement later
//                $(window).on('load resize', function () {
//                    var width = $(window).width();
//                    var height = $(window).height();
//
//                    if ((width <= 800) || (height <= 600)) {
//                        $("#pc").css("display", "none");
//                        $("#mobile").css("display", "");
//                    } else {
//                        
//                        $("#mobile").css("display", "none");
//                        $("#pc").css("display", "");
//                    }
//                });

            });
        </script>



        <script>
            $(document).ready(function() {
                $("#testing").click(function() {
                    $('.vertical.menu').sidebar('setting', {closable: false})
                            .sidebar('setting', {dimPage: false})
                            .sidebar('setting', 'transition', 'overlay')
                            .sidebar('toggle');
                    $("body").removeClass("pushable");

                });
//                $('#testaccordion').css("display", "none");
                $('#testaccordion').accordion();
                $("#accordion").click(function() {
                    $('#testaccordion').transition('vertical flip');
                    $('.ui.accordion').accordion();

                });

                $('.test.order').popup({
                    position: 'top left'
                });
            <%                for (Order orderModal : orderList) {
            %>
//              Will go through edit-dish-button1 or edit-dish-button2 (regarding the dish id)
                $(".test.order.<%=orderModal.getOrder_id()%>").click(function() {

                    $('#modalOrder<%=orderModal.getOrder_id()%>').modal('show');
                });

            <%}%>


            });
        </script>



        <title>Main Menu</title>
    </head>



    <body>

        <div id="pc pusher" class="background">


            <div class="transparency">


                <div  class="ui segment" style="left:5%;width:90%">

                    <%@ include file="Navbar.jsp" %>

                    <p></p>
                    <%
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
                                <div class="ui header" style="color: black">
                                    Order ID : <%=order.getOrder_id()%> <br/>
                                    Supplier : <%=UserController.retrieveSupplierByID(order.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%> <br/>
                                    Date : <%=order.getDtOrder()%> <br/><br/>
                                    Items:

                                </div>
                                <table class="ui single line unstackable table">
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
                            <button class="ui deny inverted orange button">Take me Back</button>
                        </div>
                    </div>
                    <%
                            if (order.getStatus().equals("pending")) {
                                pendingOrders.add(order);
                            } else if (order.getStatus().equals("incoming")) {
                                incomingOrders.add(order);
                            } else if (order.getStatus().equals("rejected")) {
                                rejectedOrders.add(order);
                            }

                        }
                    %>    






                    <div class="ui raised very padded container">
                        <p></p>
                        <h1 class="ui header">VSMS Menu</h1>

                        <!--<button id="accordion"  class="ui button">View Shortcuts</button>-->

                        <p></p>

                        <!--accordion testing-->
                        <div id="testaccordion" class="ui styled fluid accordion">
                            <div class="active title">
                                <h3><i class="dropdown icon"></i>
                                    Quick Order</h3>
                            </div>
                            <div class="active content">
                                <p>

                                    <%
                                        Dish oneClickOrder = IngredientDAO.getOneClickIngredientTemplate(currentVendor.getVendor_id());
                                        if (oneClickOrder != null) {
                                    %>

                                <form action="OrderBreakdown.jsp" method="POST">
                                    <input type="hidden" value="1" name="dish<%=oneClickOrder.getDish_id()%>">
                                    <input type="hidden" name="vendor_id" value="<%=currentVendor.getVendor_id()%>">
                                    <input type="hidden" name="cart" value="yes">
                                    <input class="ui button" type="submit" value="One Click Order"> 
                                </form>
                                <%} else {
                                %>
                                You have not selected a one-click order template
                                <%
                                    }
                                %>
                                </p>
                                <div class="ui fluid action input" style="margin-right: 10%">
                                    <input type="text" class="ingredient-name-input-home" placeholder="Search Ingredient Name ... ">
                                    <div class="ui basic button" class="ingredient-name-input-button-home"> <i class="search icon"></i></div>
                                    &nbsp;
                                </div>
                            </div>
                            <div class="title">
                                <h3><i class="dropdown icon"></i>
                                    Expected Orders for Today</h3>
                            </div>
                            <div class="content">
                                <p>To place all the orders that supplier will be delivering today.</p>
                            </div>
                            <div class="title">
                                <h3><i class="dropdown icon"></i>
                                    Pending Orders</h3>
                            </div>
                            <div class="content">
                                <h4>Orders pending approval from supplier:</h4>
                                <% if (pendingOrders.size() == 0) {
                                %>There are no Pending Orders at the moment..
                                <%
                                } else {

                                %><div class="ui tiny animated selection two stackable cards">
                                    <%    for (Order pendingOrder : pendingOrders) {

                                    %>

                                    <div  class="ui link card test order <%=pendingOrder.getOrder_id()%>" id="<%=pendingOrder.getOrder_id()%>" data-content="Click to view order details"  data-variation="inverted">
                                        <a>

                                            <div class="content">
                                                <div class="header"><h3>Order No. <%=pendingOrder.getOrder_id()%></h3></div>
                                                <div class="meta" style="color:black">
                                                    <span ><%=pendingOrder.getDtOrder()%> </span><br/>
                                                    <%=UserController.retrieveSupplierByID(pendingOrder.getOrderlines().get(0).getSupplier_id()).getSupplier_name()%>
                                                </div>


                                            </div>
                                            <div class="extra content">
                                                <div class="right floated author" style="color:black">

                                                    <%=pendingOrder.getOrderlines().size()%> items in this order
                                                </div>
                                            </div>
                                        </a>
                                    </div>



                                    <%
                                        }
                                    %></div><%
                                        };
                                    %>
                            </div>

                        </div>


                    </div>


                    <div class="ui left rail">
                        <div class="ui">
                            <%--
                            content
                            --%>
                        </div>
                    </div>
                    <div class="ui right rail">
                        <div class="ui">
                            <%--
                           content
                            --%>
                        </div>
                    </div>
                    <p></p>
                    <p></p>
                </div>


            </div>







            <!--sidebar testing-->
            <!--            <div class="ui right sidebar vertical menu">
                            <a class="item">
                                Pending (placeholder values for now)
                            </a>
                            <a class="item">
                                Awaiting Delivery
                            </a>
                            <a class="item">
                                Delivering Today
                            </a>
                        </div>   -->

        </div>


        <!--For mobile view will fix later-->

        <!--        <div id="mobile" class="pusher">
                    Testing
                    <button id="testing">Sidebar</button>
                </div>
                                
                                
                                
                Sidebar comes here
                <div class="ui sidebar inverted vertical menu">
                    <a class="item">
                        1
                    </a>
                    <a class="item">
                        2
                    </a>
                    <a class="item">
                        3
                    </a>
                </div>-->



    </body>



</html>
