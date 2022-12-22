<%-- 
    Document   : Navbar
    Created on : Jan 23, 2016, 11:47:13 PM
    Author     : Benjamin
--%>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <link rel="stylesheet" href="css/main.css">

        <script>
            $(document).ready(function() {
                $('.cart.triggerModal').click(function() {
                    //show modal button
                    $("description").html(results);
                    $('#modalCart').modal('show');
                });
                $('.profile').click(function() {
                    //show modal button
                    $('#modalAccount').modal('show');
                });

                $(window).on('load resize', function() {
                    var width = $(window).width();
                    var height = $(window).height();

                    if ((width <= 800) || (height <= 400)) {
                        $("#searchPC").css("display", "none");
                        $("#navbarPC").css("display", "none");
                        $("#PCview").css("display", "none");

                        $("#navbarMobile").css("display", "");
                    } else {
                        $("#searchPC").css("display", "");
                        $("#navbarPC").css("display", "");
                        $("#PCview").css("display", "");
                        $("#navbarMobile").css("display", "none");
                    }
                });
                //This is for the navbar ingredient search input
                $('.ingredient-name-input').keypress(function(e) {
                    console.log("Keypress  is pressed");
                    if (e.which == 13) {
                        document.location.href = "SupplierSearch.jsp?ingredient_name=" + $('.ingredient-name-input').val();
                    }
                });
                $('.ingredient-name-input-button').click(function() {
                    document.location.href = "SupplierSearch.jsp?ingredient_name=" + $('.ingredient-name-input').val();
                });

                $(".button").click(function() {
                    $(this).transition('pulse');

                });
                $(".pulse").click(function() {
                    $(this).transition('pulse');

                });

            });


        </script>

    </head>
    <body>




        <div id="PCview" class="ui computer \o\n\l\y grid">
            <div class="six wide column">
                <a href="Home.jsp">
                    <img class="logo" src="./resource/pictures/logofinal.png">
                </a>

            </div>
            <div class="ten wide column" id="searchPC" style="position:relative;top: 50px">
                <h3>Find ingredients that you need</h3>

                <div class="ui fluid action input" style="margin-right: 10%">
                    <input type="text" class="ingredient-name-input" placeholder="Search Ingredient Name ... ">
                    <div class="ui basic button" class="ingredient-name-input-button"> <i class="search icon"></i></div>
                    &nbsp;
                    <div class="pulse"><a href="ShoppingCartDisplay.jsp" class="ui inverted orange button"><i class="large shop icon" ></i>View Cart</a></div>
                </div>


            </div>

        </div>

        <div id="navbarPC" class="ui menu computer \o\n\l\y grid">
            <a href="Home.jsp" class="item pulse" style=" font-size: 16px">
                <i class="large home icon"></i> Home
            </a>
            <div class="ui simple dropdown item" style=" font-size: 16px">
                <i class="large shop icon" ></i> Order

                <div class="menu">
                    <a href="Order.jsp" class="item pulse" style=" font-size: 16px"><i class="large edit icon"></i> Make new Order</a>

                    <div class="ui left pointing large dropdown link item">
                        <i class="large dropdown icon"></i>
                        <i class="large file text icon"></i>Order Templates &nbsp;

                        <div class="menu">
                            <a href="TemplateMain.jsp" class="item pulse" style=" font-size: 16px"><img src="resource/pictures/dishIcon.png" alt="HTML5 Icon" style="width:18px;height:18px;">Template by Dish </a>
                            <a href="ManageTemplate.jsp" class="item pulse" style=" font-size: 16px"><img src="resource/pictures/carrot.png" alt="HTML5 Icon" style="width:18px;height:18px;">Template by Ingredients </a>
                        </div>
                    </div>
                    <a href="OrderHistory.jsp" class="item pulse" style=" font-size: 16px"><i class="large history icon"></i> Order History</a>
                </div>
            </div>
            <a href="Menu.jsp" class="item pulse" style=" font-size: 16px">
                <i class="large food icon"></i> Menu
            </a>
            <a href="ChatList.jsp" class="item pulse" style=" font-size: 16px">
                <i class="large mail icon"></i> Chat
            </a>
            <div class="ui simple dropdown item" style=" font-size: 16px">
                <i class="large user icon"></i>  My Account

                <div class="menu">
                    <a href="VendorProfile.jsp" class="item pulse" style=" font-size: 16px"><i class="large info icon"></i> View Profile</a>
                    <a class="item profile pulse" style=" font-size: 16px"><i class="large settings icon"></i> Account Settings</a>
                </div>
            </div>
            <div class="ui simple dropdown item" style=" font-size: 16px">
                <i class="large shipping icon"></i>  Supplier

                <div class="menu">
                    <a href="FavouriteSuppliers.jsp" class="item pulse" style=" font-size: 16px"><i class="large star icon"></i> Favourite Suppliers</a>
                    <a href="SupplierSearch.jsp" class="item pulse" style=" font-size: 16px"><i class="large search icon"></i> Supplier Search</a>
                </div>
            </div>
            <a href="Analytics.jsp" class="item pulse" style=" font-size: 16px">
                <i class="large search icon"></i> Analytics
            </a>
            <a href="LogoutServlet" class="item pulse" style=" font-size: 16px">
                <img src="resource/pictures/logout.png" alt="HTML5 Icon" style="width:25px;height:25px;">&nbsp Logout
            </a>

        </div>


        <div class="ui container mobile \o\n\l\y grid" id="navbarMobile">
            <div class="ui top fixed inverted menu"> 
                <a href="Home.jsp">
                    <div class="item" style=" font-size: 16px">

                        Foodingo Marketplace

                    </div>
                </a>
                <div class="right menu">
                    <div class="ui simple dropdown item" style=" font-size: 18px">
                        <i class="sidebar icon"></i> 

                        <div class="menu">
                            <a href="Menu.jsp" class="item" style=" font-size: 18px"><i class="large food icon"></i> Menu</a>
                            <a href="VendorProfile.jsp" class="item" style=" font-size: 18px"><i class="large info icon"></i> View Profile</a>
                            <a href="Order.jsp" class="item" style=" font-size: 18px"><i class="large edit icon"></i> Make new Order</a>
                            <a href="OrderHistory.jsp" class="item" style=" font-size: 18px"><i class="large history icon"></i> Order History</a>
                            <a href="FavouriteSuppliers.jsp" class="item" style=" font-size: 18px"><i class="large shipping icon"></i> Favorite Suppliers</a>
                            <a class="item profile" style=" font-size: 18px"><i class="large settings icon"></i> Account Settings</a>
                            <a href="SupplierSearch.jsp" class="item" style=" font-size: 18px"><i class="large search icon"></i> Supplier Search</a>
                            <a href="LogoutServlet" class="item" style=" font-size: 18px"><img src="resource/pictures/logout.png" alt="HTML5 Icon" style="width:16px;height:18px;">Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding-top: 20px">

            </div>
        </div>

        <div id="modalCart" class="ui basic modal">
            <i class="close icon"></i>
            <div class="header">
                <h1>Messages</h1>
            </div>
            <div class="image content">
                <div class="ui medium image">
                    <img src="./resource/pictures/underconstruction.PNG">
                </div>
                <div class="description">

                </div>
            </div>
            <div class="actions">
                <button class="ui inverted deny orange button">Take me Back</button>
            </div>
        </div>

        <div id="modalAccount" class="ui basic modal">
            <i class="close icon"></i>
            <div class="header">
                <h1>Account Settings</h1>
            </div>
            <div class="image content">
                <div class="ui medium image">
                    <img src="./resource/pictures/underconstruction.PNG">
                </div>
                <div class="description">
                    <p><h2>Where Users manage their Account Settings.</h2></p>
                    <div class="ui header" style="color: white">Coming soon..</div>
                    <p>Feature currently being developed. You will be notified about the launch of this feature.</p>

                </div>
            </div>
            <div class="actions">
                <button class="ui inverted deny orange button">Take me Back</button>
            </div>
        </div>


    </body>
</html>
