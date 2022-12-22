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

        <title>Registration Success</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            });
        </script>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">

                <%@ include file="NavbarReg.jsp" %>

                <%

                    //Supplier supp = (Supplier) session.getAttribute("currentSupplier");
                    //Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    //session.setAttribute("currentSupplier", currentSupplier);
                    //Supplier currentSupplier = UserController.retrieveSupplierByID(1);
                    String msg = "";

                    if (request.getAttribute("msg") != null) {
                        msg = request.getAttribute("msg").toString();
                    }

                    //if (currentSupplier == null) {
                    //    currentSupplier = UserController.retrieveSupplierByID(currentSupplier.getSupplier_id());
                    //}
%>
                <%=msg%>
                
                <!--JAVASCRIPT-->
                <script>$("#form").validate();</script>
                <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
                <script src="js/formvalidation.js" type="text/javascript"></script>
                <script src="js/main.js" type="text/javascript"></script>
                </body>
                </html>

