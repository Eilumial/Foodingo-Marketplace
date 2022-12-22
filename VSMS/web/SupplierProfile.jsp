
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
        <%@ include file="protect_supplier.jsp" %>
        <title>Supplier Profile</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            });
        </script>
        <style>
            #map {
                width: 400px;
                height: 400px;
            }
        </style>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="SuppNavbar.jsp" %>


                <%                    Supplier supp = (Supplier) session.getAttribute("currentSupplier");
                    Supplier currentSupplier = UserController.retrieveSupplierByID(supp.getSupplier_id());
                    session.setAttribute("currentSupplier", currentSupplier);
                    //if (currentSupplier == null) {
                    //    currentSupplier = UserController.retrieveSupplierByID(currentSupplier.getSupplier_id());
                    //}
%>
                <h2 class="ui header">
                    <i class="user icon"></i>
                    <div class="content">
                        View Profile
                        <div class="sub header">Manage Your Profile</div>
                    </div>
                </h2>
                <div class="ui warning message disclaimer">
                    <i class="close icon"></i>
                    <div class="header">
                        Disclaimer:
                    </div>
                    By viewing this page, you promise not to abuse this information. Any suspicious activities/spam will cause in direct actions from administration.
                </div>
                <h1 style="color:black"><%=currentSupplier.getSupplier_name()%></h1>



                <table class="ui very padded large striped  table">
                    <tr>
                        <th><h2>Email</h2></th>
                    <td><h3><%=currentSupplier.getEmail()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Address</h2></th>
                    <td><h3><%=currentSupplier.getAddress()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Telephone Number</h2></th>
                    <td><h3><%="(" + currentSupplier.getArea_code() + ")" + currentSupplier.getTelephone_number()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Description</h2></th>
                    <td><h3><%=currentSupplier.getSupplier_description()%></h3></td>
                    </tr>
                    <tr>
                        <th><h2>Expected Delivery</h2></th>
                    <td><h3><%=currentSupplier.getMin_leadtime()%> - <%=currentSupplier.getMax_leadtime()%></h3></td>
                    </tr>
                </table>



                <button class="ui green large button edit-profile-button">Edit Profile</button>
                <button class="ui green large button edit-password-button">Change Password</button>

                <div id="map"></div>
                <!--Create a modal for editing the profile-->
                <div id="editprofilemodal" class="ui small modal">

                    <div class="header">
                        Edit Profile
                    </div>
                    <div class="content">
                        <form onsubmit="location.reload()" id="editProfile" class="editProfile ui form" action="userservlet" method="post"> 
                            <!--Inputting form elements-->
                            <label for="email"><h3>Email:</h3></label>
                            <input id="email" value="<%=currentSupplier.getEmail()%>" type="text" name="email">

                            <br/>
                            <label for="area_code"><h3>Area Code / Telephone Number:</h3></label> 

                            <div class="ui grid">
                                <div class="three wide column">
                                    <input id="area_code" value="<%=currentSupplier.getArea_code()%>" type="text" name="area_code">

                                </div>
                                <div class="thirteen wide column">
                                    <input id="telephone_number" value="<%=currentSupplier.getTelephone_number()%>" type="text" name="telephone_number">
                                </div>
                            </div><br/>
                            <label for ="address"><h3>Address:</h3></label> 
                            <textarea id="address" name="address"><%=currentSupplier.getAddress()%></textarea>
                            <br/><br/>
                            <label for ="supplier_description"><h3>Description:</h3></label> 
                            <textarea id="supplier_description" name="supplier_description"><%=currentSupplier.getSupplier_description()%></textarea>
                            <br/><br>
                            <label for ="min_leadtime"><h3>Leadtime</h3></label> 
                            <div class="ui grid">
                                <div class="three wide column">
                                    <input id="min_leadtime" value="<%=currentSupplier.getMin_leadtime()%>" type="text" name="min_leadtime">
                                </div>
                                <div class="thirteen wide column">
                                    <input id="max_leadtime" value="<%=currentSupplier.getMax_leadtime()%>" type="text" name="max_leadtime">
                                </div>
                            </div><br/>

                            <!--Input hidden attributes-->
                            <input type="hidden" name="supplier_id" value="<%=currentSupplier.getSupplier_id()%>">
                            <input type="hidden" name="action" value="editsupplierprofile">


                            </div>
                            <div class="actions">
                                <input type="submit" value="Save Changes" class="ui green inverted button" />
                        </form>
                        <button class="ui inverted deny orange button">Cancel</button>

                    </div>

                </div>

                <!--Create a modal for editing the password-->
                <div id="editpasswordmodal" class="ui small modal">

                    <div class="header">
                        Edit Password
                    </div>
                    <div class="content">
                        <form onsubmit="location.reload()" id="editPassword" class="editPassword ui form" action="userservlet" method="post"> 
                            <!--Inputting form elements-->
                            <label for="old_password">Old Password:</label> 
                            <input id="old_password" type="password" name="old_password">

                            <label for="new_password">New Password:</label> 
                            <input id="new_password" type="password" name="new_password">
                            <label for="new2_password">Repeat Password:</label> 
                            <input id="new2_password" type="password" name="new2_password">

                            <!--Input hidden attributes-->
                            <input type="hidden" name="supplier_id" value="<%=currentSupplier.getSupplier_id()%>">
                            <input type="hidden" name="action" value="editsupplierpassword">

                            <input type="submit" value="Edit password" class="ui teal button" /> 
                        </form>
                    </div>
                    <div class="actions">

                        <button class="ui inverted deny orange button">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
        <!--JAVASCRIPT-->
        <script>$("#form").validate();</script>
        <!— Google Maps JS API —>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <!— GMaps Library (settings of div style is at the head) —>
        <script src="js/gmaps.js"></script>
        <script>
            /* Map Object */
            var mapObj = new GMaps({
                el: '#map',
                lat: 48.857,
                lng: 2.295
            });
            GMaps.geocode({
                address: '<%=currentSupplier.getAddress()%>',
                callback: function(results, status) {
                    if (status == 'OK') {
                        latlng = results[0].geometry.location;
                        mapObj.setCenter(latlng.lat(), latlng.lng());
                        mapObj.addMarker({
                            lat: latlng.lat(),
                            lng: latlng.lng(),
                            title: '<%=currentSupplier.getSupplier_name()%>',
                            infoWindow: {
                                content: '<h4><%=currentSupplier.getSupplier_name()%></h4><div><%=currentSupplier.getAddress()%><br> Singapore, <%=currentSupplier.getZipcode()%></div>',
                                maxWidth: 100
                            }
                        });
                    } else if (status == 'ZERO_RESULTS') {
                        alert('Sorry, no results found');
                    }
                }
            })
        </script>
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>