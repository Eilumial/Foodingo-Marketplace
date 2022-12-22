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

        <title>Reset Password</title>
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

        <%
            String msg = "";
            
            
            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }
        %>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">

                <%@ include file="NavbarReg.jsp" %>


                
                <form class="ui form" action="ResetPWServlet" method="post">
                    <h4 class="ui dividing header">Reset Password</h4>
                    <div class="field">
                        <label>Email Address</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" name="email" placeholder="Please enter your registered email address">
                            </div>

                        </div>
                        <div><%=msg%></div>
                        <input class="ui button" type="submit" value="Reset password" />
                    </div>

                </form>
                <!--JAVASCRIPT-->
                <script>$("#form").validate();</script>
                <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
                <script src="js/formvalidation.js" type="text/javascript"></script>
                <script src="js/main.js" type="text/javascript"></script>
                </body>
                </html>

