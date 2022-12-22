
<%@page import="java.io.InputStream"%>
<%@page import="Model.SupplierTimeComparator"%>
<%@page import="java.util.Collections"%>
<%@page import="Model.IngredientPriceComparator"%>
<%@page import="Model.Ingredient"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.UserController"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Supplier Search</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <%            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> supplierList = UserController.retrieveSupplierList();
            Collections.sort(supplierList, new SupplierTimeComparator());
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> favSupplierList = UserController.retrieveSupplierListByVendor(currentVendor.getVendor_id());

            String ingredientName = request.getParameter("ingredient_name");
            if (ingredientName == null) {
                ingredientName = "";
            }
        %>

        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
                //SEARCHING AND FILTERING
                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbyname
                $('.menu .item').tab();
                $('.supplier').css('display', 'none');
//                $(".loading").hide();
//Put in the active class at Ingredient Name Search if ingredient name is not empty
            <% if (!ingredientName.isEmpty()) {%>
                $("#supplier_name_div").removeClass("active");
                $("#supplier_name_tab").removeClass("active");
                $("#ingredient_name_div").addClass("active");
                $("#ingredient_name_tab").addClass("active");
            <%}%>

                $('.search.ingredient').popup({
                    position: 'top left'
                });

                $('.search.supplier').popup({
                    position: 'top left'
                });
            });

            $(function() {

                $('form').on('submit', function(e) {

                    e.preventDefault();

                    $.ajax({
                        type: 'get',
                        url: 'OrderByIngredientServlet',
                        data: $(this).serialize(),
                        success: function() {
                            alert('Item added to cart');
                        }
                    });

                });

            });

        </script>
        <!--CSS-->

        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

    </head>
    <body class="background">
        <div class="transparency">
            <div class="ui segment" style="left:5%;width:90%">
                <%@include file="Navbar.jsp" %>

                <h1 class="ui header">
                    <i class="search icon"></i>
                    <div class="content" >
                        Supplier Search
                        <div  style="color:black"  class="sub header">Find Suppliers/Ingredients</div>
                    </div>
                </h1>
                <br/>
                <h2 style="color: black">Search by:</h2>
                <div class="ui top attached tabular menu">
                    <a class="item" style="font-size:18px" data-tab="first" id="supplier_name_tab">Supplier</a>
                    <a class="item active" style="font-size:18px" data-tab="second" id="ingredient_name_tab">Ingredients</a>
                </div>

                <!--Handle Supplier Search using search.js as the filtering process-->
                <div class="ui bottom attached tab segment" id="supplier_name_div" data-tab="first">

                    <div class="ui icon large input">
                        <input type="text" placeholder="Search..." name="searchsupplierbyname" id="searchsupplierbyname" value=""/>
                        <i class="circular search link icon"></i>
                    </div>
                    <div id="supplierlistbyname" class="ui middle aligned animated selection divided list">  
                        <%
                            ArrayList<Supplier> currentFavSupplier = UserController.retrieveSupplierListByVendor(currentVendor.getVendor_id());
                            for (Supplier supplier : supplierList) {%>


                        <div class='item search supplier' data-content="Click to view supplier"  data-variation="inverted">
                            <a href="SupplierSearchProfile.jsp?supplier_id=<%=supplier.getSupplier_id()%>">
                                <div class='content-'>
                                    <h2><%=supplier.getSupplier_name()%></h2>
                                </div>
                                <div> Type: <%=supplier.getSupplier_type()%>
                                    <%if (currentFavSupplier.contains(supplier)) {%>
                                    <a><div class="right floated content"><h3>Favorited</h3></div></a>
                                    <%} else {%>
                                    <div class="right floated content"><button class="ui button"><a href="userservlet?vendor_id=<%=currentVendor.getVendor_id()%>&supplier_id=<%=supplier.getSupplier_id()%>&action=add"><i class="empty star icon"></i>Add to Favorites</a></button></div>
                                    <%}%>
                                </div>

                        </div>
                        <%}%>  
                    </div>
                </div>


                <!--Handle Ingredient Search using search.js as the filtering process-->
                <div class="ui bottom attached tab segment active" id="ingredient_name_div" data-tab="second">              
                    <div class="ui large icon input">
                        <input type="text" placeholder="Search..." name="searchingredient" id="searchingredient" value="<%=ingredientName%>"/>
                        <i class="circular search link icon"></i>

                    </div>
                    <div id="ingredientlist" class="ui middle aligned animated selection divided list">   
                        <%
                            ArrayList<Ingredient> ingredientList = IngredientController.getIngredientList();
                            Collections.sort(ingredientList, new IngredientPriceComparator());
                            for (Ingredient ingredient : ingredientList) {
                                String ingredientStr = ingredient.getName().replaceAll(" ", "%20");
                        %>
                        <div class='item search ingredient'  data-content="Click to view ingredient"  data-variation="inverted">
                            <div class="image-placeholder" style="float:left">
                                <%
                                    InputStream picture = ingredient.getPicture();
                                    String image = "resource\\pictures\\default-placeholder.png";
                                    if (picture != null) {
                                        image = UtilityController.convertInputStreamToString(picture);
                                    }
                                %>

                                <img id="image" src="<%=image%>" style="height:120px;width:120px;margin-right:20px;margin-top:20px" class='ingredientImage' alt="your image" />
                            </div>
                            <div class='content-itemname'>
                                <a href="IngredientProfile.jsp?ingredient_name=<%=ingredientStr%>&supplier_id=<%=ingredient.getSupplier_id()%>">
                                    <%if (ingredient.getStatus().equals("available")) {%>
                                    <h2><%=ingredient.getName()%></h2>
                                    <%} else {%>
                                    <h2><font color="red"><%=ingredient.getName()%> (Unavailable)</font></h2>
                                        <%}%>
                            </div>
                            <div>
                                <div style="color:black">Supplier: <font color="blue"><%=UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getSupplier_name()%></font></div>
                                <div style="color:black">Price: <font color="green">S$<%=UtilityController.convertDoubleToCurrString(Double.parseDouble(ingredient.getOfferedPrice()))%> per <%=ingredient.getSupplyUnit()%></font></div>
                                <div style="color:black">Expected delivery duration: <font color="green"><%=UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getMin_leadtime()%> - <%=UserController.retrieveSupplierByID(ingredient.getSupplier_id()).getMax_leadtime()%></font></div>
                                <div style="color:black">Minimum Order Quantity: <font color="green"><%=ingredient.getMinimum_order_quantity()%></font></div>
                            </div>
                            </a>
                            <%if (ingredient.getStatus().equals("available")) {%>

                            <div>

                                <form action="OrderByIngredientServlet" method="get">
                                    <div style="color:black">
                                        <div class="ui right labeled input">
                                            <div class="ui label">Quantity:</div>
                                            <input type="number" name="quantity">
                                            <div class="ui basic label"><%=ingredient.getSupplyUnit()%></div>
                                        </div> 
                                        <input type="hidden"  name="ingredientname" value="<%=ingredient.getName()%>">
                                        <input type="hidden"  name="supplierId" value="<%=ingredient.getSupplier_id()%>">
                                        <input type="hidden" name="CartId" value="<%=(Integer) session.getAttribute("CartId")%>">
                                        <input type="hidden" name="action" value="add">

                                        <button type="submit" class="ui green button ">Add to Cart</button>



                                    </div>
                                </form>
                            </div>

                        </div>
                        <%}
                            }%>
                    </div>
                </div>


            </div>
        </div>
    </div>
</body>
<script src="js/search.js" type="text/javascript"></script>
</html>


<script>
//To be put if the search is AJAX called
//                $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchsupplierbyname", word: $('#searchsupplierbyname').val()}, function (responseText) {
//                    $("#supplierlistbyname").html(responseText);
//                });
//                $("#searchsupplierbyname").keyup(function () {
//                    $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchsupplierbyname", word: $('#searchsupplierbyname').val()}, function (responseText) {
//                        $("#supplierlistbyname").html(responseText);
//                    });
//                });
//
//                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbytype
//                $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchsupplierbytype", word: $('#searchsupplierbytype').val()}, function (responseText) {
//                    $("#supplierlistbytype").html(responseText);
//                });
//                $("#searchsupplierbytype").keyup(function () {
//                    $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchsupplierbytype", word: $('#searchsupplierbytype').val()}, function (responseText) {
//                        $("#supplierlistbytype").html(responseText);
//                    });
//                });
//
//                //invoke get method in UserController with blank parameter given and blank response with searchsupplierbyingredient
//                $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchingredient", word: $('#searchingredient').val()}, function (responseText) {
//                    $("#ingredientlist").html(responseText);
//                });
//                $("#searchingredient").keyup(function () {
//                    $.get("userservlet", {vendor_id: "<%=currentVendor.getVendor_id()%>", supplier_id: "1", action: "searchingredient", word: $('#searchingredient').val()}, function (responseText) {
//                        $("#ingredientlist").html(responseText);
//                    });
//                });

</script>