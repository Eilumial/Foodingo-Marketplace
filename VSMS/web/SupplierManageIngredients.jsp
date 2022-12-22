<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Supplier"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Controller.OrderController"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Model.Dish"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Manage Ingredients</title>
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
            $(function () {
                $('.accordion').accordion();
            });
        </script>


        <%
            Supplier supp = (Supplier) session.getAttribute("currentSupplier");
            //Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
            ArrayList<Ingredient> ingreList = IngredientController.getIngredientBySupplier(supp.getSupplier_id());
            String msg = "";
            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }

            //<div class="title active">
            //              <i class="dropdown icon"></i>
            //            What is a dog?
            //      </div>
            //    <div class="content active">
            //      <p class="transition visible" style="display: block !important;">A dog is a type of domesticated animal. Known for its loyalty and faithfulness, it can be found as a welcome guest in many households across the world.</p>
            //</div>
        %>

    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="SuppNavbar.jsp" %>
                <div>
                    <h2>Manage Ingredients</h2>
                   
                    <h3><%=msg%></h3>
                   

                    <font color="red"><h4>*Ingredients with existing templates or orders cannot be edit or deleted</h4></font>
                    <div class="ui styled fluid accordion">


                        <%                            for (Ingredient i : ingreList) {
                        %>    

                        <div class="title">
                            <i class="dropdown icon"></i>
                            <%=i.getName()%>
                        </div>
                        <div class="content ui left aligned segment">
                            <p><b>Description:</b> <%=i.getDescription()%></p>
                            <p><b>Supply Unit:</b> <%=i.getSupplyUnit()%></p>
                            <p><b>Category:</b> <%=i.getSubcategory()%></p>
                            <p><b>Offered Price:</b> S$<%=UtilityController.convertDoubleToCurrString(Double.parseDouble(i.getOfferedPrice()))%></p>
                            <p><b>Minimum Order Quantity:</b> <%=i.getMinimum_order_quantity()%></p>
                            <p><b>Status:</b> <%=i.getStatus()%></p>

                            <%
                                boolean b = OrderController.checkIngredientEditable("" + supp.getSupplier_id(), i.getName());

                                if (!b) {
                            %>
                            <div class="ui buttons">
                                <%
                                    String editLink = "SupplierEditIngredient.jsp?ing_name=" + i.getName().replace(" ", "%20");
                                %>
                                <a href=<%=editLink%>><button class="ui button">Edit</button></a>
                                <div class="\o\r"></div>
                                <% String link = "DeleteIngredientServlet?ing_name=" + i.getName().replaceAll(" ", "%20") + "&supplier_id=" + supp.getSupplier_id();%>
                                <a href="<%=link%>" ><button class="ui negative button">Delete</button></a>
                            </div>
                            <%
                                }
                            %>

                        </div>
                        <%
                            }
                        %>                        
                    </div>
                </div>
            </div>

            <script>$("#form").validate();</script>
            <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
            <script src="js/formvalidation.js" type="text/javascript"></script>
            <script src="js/main.js" type="text/javascript"></script>
        </div>
    </body>
</html>

