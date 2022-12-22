<%@page import="Controller.UtilityController"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Supplier"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Edit Ingredient</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="css/main.css">

        <link rel="stylesheet" href="css/demo.css">
        <link rel="stylesheet" href="css/component.css">
        <link rel="stylesheet" href="css/normalize.css">


        <!--        
                <link rel="stylesheet" type="text/css" href="css/normalize.css" />
                        <link rel="stylesheet" type="text/css" href="css/demo.css" />
                        <link rel="stylesheet" type="text/css" href="css/component.css" />
        -->


        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
                //To edit user account and password changes

                //Will go through the edit profile button
                $(".edit-profile-button").click(function() {
                    console.log("My name is edit-profile-button");
                    //show modal button
                    $('#editprofilemodal').modal('show');
                });
                //Will go through the edit password button
                $(".edit-password-button").click(function() {
                    console.log("My name is edit-password-button");
                    //show modal button
                    $('#editpasswordmodal').modal('show');
                });

                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function(e) {
                            if (e !== "#") {
                                $('#removePicture').css('display', '');
                            }
                            $('#image').css('display', '').attr('src', e.target.result);
                            $('.uploadArea').css('display', 'none');
                            $('#imagePrompt').css('display', 'none');
                            $("#image_upload").val(e.target.result);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                $('#removePicture').click(function() {
                    $('#image').css('display', 'none').attr('src', '#');
                    $('#imagePrompt').css('display', '');
                    $('.uploadArea').css('display', '');
                    $('.toRemove').css('display', 'none');
                });

                $("#imgInp").change(function() {
                    readURL(this);
                });

            });
        </script>

        <%
            ArrayList<String> categList = new ArrayList<String>();
            categList.add("Bakery");
            categList.add("Fruit");
            categList.add("Meat");
            categList.add("Misc");
            categList.add("Spice");
            categList.add("Vegetable");
            categList.add("Asian");
            categList.add("Western");
            categList.add("Fusion");
            categList.add("Beverage");
            ArrayList<String> unitList = new ArrayList<String>();
            unitList.add("package");
            unitList.add("kg");
            unitList.add("g");
            unitList.add("piece");
            unitList.add("bottle");
            unitList.add("cup");

            HashMap<String, String> unitMap = new HashMap<String, String>();
            unitMap.put("jg", "Kilograms(kg)");
            unitMap.put("piece", "Piece");
            unitMap.put("bottle", "Bottle");
            unitMap.put("package", "Package");
            unitMap.put("g", "Grams(g)");
            unitMap.put("cup", "Cup");

        %>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="SuppNavbar.jsp" %>


                <%                    Supplier supp = (Supplier) session.getAttribute("currentSupplier");
                    //Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    //session.setAttribute("currentSupplier", currentSupplier);

                    //get updated version of supplier
                    Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    String msg = "";
                    Ingredient i = null;
                    if (request.getParameter("ing_name") != null) {
                        i = IngredientController.getIngredient("" + currentSupplier.getSupplier_id(), request.getParameter("ing_name"));
                    }

                    if (request.getParameter("msg") != null) {
                        msg = request.getParameter("msg");
                    }

                    //if (currentSupplier == null) {
                    //    currentSupplier = UserController.retrieveSupplierByID(currentSupplier.getSupplier_id());
                    //}
%>
                <%=msg%>
                <form class="ui form" action="EditIngredientServlet" method="post">
                    <input type="hidden" value="" id="image_upload" name="image_upload"/>
                    <input type="hidden" value="<%=currentSupplier.getSupplier_id()%>" name="supplier_id" />
                    <h2 class="ui header">Ingredient Information</h2>
                    <div class="field">

                        <div class="two fields">
                            <div class="field">
                                <%String name = i.getName().replace(" ", " ");%>
                                Ingredient: <h3><%=name%></h3>
                                <input type="hidden" name="ingredient_name" placeholder="Ingredient Name" value="<%=name%>">
                            </div>

                        </div>
                    </div>

                    <div class="one fields">
                        <div class="field">
                            <label>Category</label>
                            <select id="category" class="ui fluid dropdown" name="category">
                                <% for (String s : categList) {

                                        if (s.equals(i.getSubcategory())) {
                                %>       
                                <option value=<%=s.toLowerCase()%> selected><%=s%></option>
                                <%
                                } else {

                                %>
                                <option value=<%=s.toLowerCase()%>><%=s%></option>
                                <% }
                                    }%>>
                            </select>
                        </div>
                        <div class="field">
                            <label>Unit</label>
                            <select class="ui fluid dropdown" name="unit">
                                <% for (String s : unitList) {

                                        if (s.equals(i.getSupplyUnit())) {
                                %>       
                                <option value=<%=s%> selected><%=unitMap.get(s)%></option>
                                <%
                                } else {

                                %>
                                <option value=<%=s%>><%=unitMap.get(s)%></option>
                                <% }
                                    }%>>

                            </select>
                        </div>
                        <div class="field">
                            <label>Offered Price (S$)</label>
                            <input min=0 type="number" step="0.01" name="offered_price" placeholder="0.00" value="<%=UtilityController.convertDoubleToCurrString(Double.parseDouble(i.getOfferedPrice()))%>">
                        </div>
                    </div>
                    <div class="one fields">
                        <div class="field">
                            <label>Status</label>
                            <select class="ui fluid dropdown" name="status">
                                <option value="available">Available</option>
                                <option value="unavailable">Unavailable</option>
                            </select>
                        </div>
                        <div class="field">
                            <label>Minimum Order Quantity</label>
                            <input type="number" name="minimum_order_quantity" value="<%=i.getMinimum_order_quantity()%>">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Ingredient Description</label>
                            <textarea placeholder="Description of Ingredient goes here" name="ingredient_desc"><%=i.getDescription()%></textarea>
                        </div>
                    </div>

                    <h4>Add an Image: </h4>

                    <div class="box uploadArea">
                        <input type="file" name="file-5[]" id="imgInp" class="inputfile inputfile-4" />
                        <label style='border:5px dotted; height:250px; width:250px;' for="imgInp">
                            <figure>
                                <svg xmlns="http://www.w3.org/2000/svg" width="300px" height="200px" viewBox="0 0 20 17">
                                <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
                                </svg>
                            </figure> 
                            <span>Click to Upload Picture&hellip;</span>

                        </label>

                    </div>
                    <text id="imagePrompt">Please choose an image size of 300px x 300px </text>
                    <img id="image" src="#" class='ingredientImage' style='display:none' alt="your image" />
                    <button id="removePicture" style="display:none" class="ui red button">Remove Image</button>
                    <br/>
                    <br/>
                    <input class="ui button" type="submit" value="Edit Ingredient" />
                </form>

            </div>




            <!--JAVASCRIPT-->
            <script>$("#form").validate();</script>
            <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
            <script src="js/formvalidation.js" type="text/javascript"></script>
            <script src="js/main.js" type="text/javascript"></script>
        </div>
    </body>
</html>

