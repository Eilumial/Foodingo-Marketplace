<%-- 
    Document   : SupplierAddIngredient
    Created on : Feb 20, 2016, 4:45:12 PM
    Author     : TC
--%>

<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Supplier"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Add Ingredient</title>
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
            $(document).ready(function () { // Prepare the document to ready all the dom functions before running this code
                //To edit user account and password changes

                //Will go through the edit profile button
                $(".edit-profile-button").click(function () {
                    console.log("My name is edit-profile-button");
                    //show modal button
                    $('#editprofilemodal').modal('show');
                });
                //Will go through the edit password button
                $(".edit-password-button").click(function () {
                    console.log("My name is edit-password-button");
                    //show modal button
                    $('#editpasswordmodal').modal('show');
                });

                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
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
                $('#removePicture').click(function () {
                    $('#image').css('display', 'none').attr('src', '#');
                    $('#imagePrompt').css('display', '');
                    $('.uploadArea').css('display', '');
                    $('.toRemove').css('display', 'none');
                });

                $("#imgInp").change(function () {
                    readURL(this);
                });

            });
        </script>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="SuppNavbar.jsp" %>


                <%
                    Supplier supp = (Supplier) session.getAttribute("currentSupplier");
                    //Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    //session.setAttribute("currentSupplier", currentSupplier);
                    
                    //get updated version of supplier
                    Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    String msg = "";

                    if (request.getParameter("msg") != null) {
                        msg = request.getParameter("msg");
                    }

                    //if (currentSupplier == null) {
                    //    currentSupplier = UserController.retrieveSupplierByID(currentSupplier.getSupplier_id());
                    //}
%>
                <%=msg%>
                <form class="ui form" action="AddIngredientServlet" method="post">
                    <input type="hidden" value="" id="image_upload" name="image_upload"/>
                    <input type="hidden" value="<%=currentSupplier.getSupplier_id()%>" name="supplier_id" />
                    <h2 class="ui header">Ingredient Information</h2>
                    <div class="field">
                        <label>Name</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" name="ingredient_name" placeholder="Ingredient Name">
                            </div>

                        </div>
                    </div>

                    <div class="one fields">
                        <div class="field">
                            <label>Category</label>
                            <select class="ui fluid dropdown" name="category">
                                <option value="bakery">Bakery</option>
                                <option value="fruit">Fruit</option>
                                <option value="meat">Meat</option>
                                <option value="spice">Spice</option>
                                <option value="vegetable">Vegetable</option>
                                <option value="asian">Asian</option>
                                <option value="western">Western</option>
                                <option value="fusion">Fusion</option>
                                <option value="beverage">Beverage</option>
                                <option value="misc">Other</option>
                            </select>
                        </div>
                        <div class="field">
                            <label>Unit</label>
                            <select class="ui fluid dropdown" name="unit">
                                <option value="package">Package</option>
                                <option value="kg">Kilograms(kg)</option>
                                <option value="g">Grams(g)</option>
                                <option value="piece">Piece</option>
                                <option value="bottle">Bottle</option>
                                <option value="cup">Cup</option>
                            </select>
                        </div>
                        <div class="field">
                            <label>Offered Price (S$)</label>
                            <input min=0.00 type="number" name="offered_price" step="0.01" placeholder="0.00">
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
                            <label>Minimum Ordered Quantity</label>
                            <input type="number" name="minimum_ordered_quantity" placeholder="0">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Ingredient Description</label>
                            <textarea placeholder="Description of Ingredient goes here" name="ingredient_desc"></textarea>
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
                    <input class="ui button" type="submit" value="Create Ingredient" />
                </form>

            </div>
            <!--further samples-->
            <!--
            <div class="field">
                <label>Short Text</label>
                <textarea rows="2"></textarea>
            </div>
            <h4 class="ui dividing header">Billing Information</h4>
            <div class="field">
                <label>Card Type</label>
                <div class="ui selection dropdown">
                    <input type="hidden" name="card[type]">
                    <div class="default text">Type</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item" data-value="visa">
                            <i class="visa icon"></i>
                            Visa
                        </div>
                        <div class="item" data-value="amex">
                            <i class="amex icon"></i>
                            American Express
                        </div>
                        <div class="item" data-value="discover">
                            <i class="discover icon"></i>
                            Discover
                        </div>
                    </div>
                </div>
            </div>
            <div class="fields">
                <div class="seven wide field">
                    <label>Card Number</label>
                    <input type="text" name="card[number]" maxlength="16" placeholder="Card #">
                </div>
                <div class="three wide field">
                    <label>CVC</label>
                    <input type="text" name="card[cvc]" maxlength="3" placeholder="CVC">
                </div>
                <div class="six wide field">
                    <label>Expiration</label>
                    <div class="two fields">
                        <div class="field">
                            <select class="ui fluid search dropdown" name="card[expire-month]">
                                <option value="">Month</option>
                                <option value="1">January</option>
                                <option value="2">February</option>
                                <option value="3">March</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">August</option>
                                <option value="9">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </div>
                        <div class="field">
                            <input type="text" name="card[expire-year]" maxlength="4" placeholder="Year">
                        </div>
                    </div>
                </div>
            </div>
            <h4 class="ui dividing header">Receipt</h4>
            <div class="field">
                <label>Send Receipt To:</label>
                <div class="ui fluid multiple search selection dropdown">
                    <input type="hidden" name="receipt">
                    <i class="dropdown icon"></i>
                    <div class="default text">Saved Contacts</div>
                    <div class="menu">
                        <div class="item" data-value="jenny" data-text="Jenny">
                            <img class="ui mini avatar image" src="/images/avatar/small/jenny.jpg">
                            Jenny Hess
                        </div>
                        <div class="item" data-value="elliot" data-text="Elliot">
                            <img class="ui mini avatar image" src="/images/avatar/small/elliot.jpg">
                            Elliot Fu
                        </div>
                        <div class="item" data-value="stevie" data-text="Stevie">
                            <img class="ui mini avatar image" src="/images/avatar/small/stevie.jpg">
                            Stevie Feliciano
                        </div>
                        <div class="item" data-value="christian" data-text="Christian">
                            <img class="ui mini avatar image" src="/images/avatar/small/christian.jpg">
                            Christian
                        </div>
                        <div class="item" data-value="matt" data-text="Matt">
                            <img class="ui mini avatar image" src="/images/avatar/small/matt.jpg">
                            Matt
                        </div>
                        <div class="item" data-value="justen" data-text="Justen">
                            <img class="ui mini avatar image" src="/images/avatar/small/justen.jpg">
                            Justen Kitsune
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui segment">
                <div class="field">
                    <div class="ui toggle checkbox">
                        <input type="checkbox" name="gift" tabindex="0" class="hidden">
                        <label>Do not include a receipt in the package</label>
                    </div>
                </div>
            </div>-->



            <!--JAVASCRIPT-->
            <script>$("#form").validate();</script>
            <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
            <script src="js/formvalidation.js" type="text/javascript"></script>
            <script src="js/main.js" type="text/javascript"></script>
        </div>
    </body>
</html>

