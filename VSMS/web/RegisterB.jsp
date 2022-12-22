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

                    String email = "";
                    if (request.getAttribute("email") != null) {
                        email = request.getAttribute("email").toString();
                    }

                    if (request.getParameter("email") != null) {
                        email = request.getParameter("email").toString();
                    }

                    String userType = "";

                    if (request.getAttribute("usertype") != null) {
                        userType = request.getAttribute("usertype").toString();
                    }

                    if (request.getParameter("usertype") != null) {
                        userType = request.getParameter("usertype").toString();
                    }
                    String name = "";
                    if (request.getParameter("name") != null) {
                        name = request.getParameter("name");
                    }

                    String address = "";
                    if (request.getParameter("address") != null) {
                        address = request.getParameter("address");
                    }

                    String desc = "";
                    if (request.getParameter("desc") != null) {
                        desc = request.getParameter("desc");
                    }

                    int postal = 0;
                    if (request.getParameter("postal") != null) {
                        postal = Integer.parseInt(request.getParameter("postal"));
                    }
                    int phone = 0;
                    if (request.getParameter("phone") != null) {
                        phone = Integer.parseInt(request.getParameter("phone"));
                    }
                    int area_code = 0;
                    if (request.getParameter("country") != null) {
                        area_code = Integer.parseInt(request.getParameter("country"));
                    }

                    //Supplier variables
                    String supplier_type = "";
                    if (request.getParameter("supplier_type") != null) {
                        supplier_type = request.getParameter("supplier_type");
                    }
                    int min_leadtime = 0;
                    if (request.getParameter("min_leadtime") != null) {
                        min_leadtime = Integer.parseInt(request.getParameter("min_leadtime"));
                    }

                    int max_leadtime = 0;
                    if (request.getParameter("max_leadtime") != null) {
                        max_leadtime = Integer.parseInt(request.getParameter("max_leadtime"));
                    }

                    ArrayList<String> categList = new ArrayList<String>();
                    categList.add("Asian");
                    categList.add("Beverage");
                    categList.add("Fusion");
                    categList.add("Spicies");
                    categList.add("Vegetable");
                    categList.add("Western");
                    //if (currentSupplier == null) {
                    //    currentSupplier = UserController.retrieveSupplierByID(currentSupplier.getSupplier_id());
                    //}
                    //vendor
                    //public Vendor(int vendor_id, String password, String vendor_name, String vendor_description, String email, int area_code, int telephone_number, String address, int zipcode) {
                    //supplier
                    //public Supplier(int supplier_id, String password, String supplier_name, String supplier_description, String supplier_type, String email, int area_code, int telephone_number, String address, int zipcode, int min_leadtime, int max_leadtime) {
                %>

                <%=msg%>


                <%
                    //Form for vendor
                    if (userType.equals("vendor")) {%>
                <form class="ui form" action="RegisterBServlet" method="post">
                    <input type="hidden" value="<%=userType%>" name="usertype" />
                    <h4 class="ui dividing header">Vendor Profile</h4>
                    <div class="field">
                        <label for="email">Email</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" id="email"  name="email" value="<%=email%>" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="two fields">
                            <div class="field">
                                <label for="password1">Password:</label> 
                                <input id="password1" type="password" name="password1" placeholder="Please enter password">
                            </div>
                            <div class="field">
                                <label for="password2">Reenter Password:</label> 
                                <input id="password2" type="password" name="password2"placeholder="Please reenter password for verification">
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>Vendor Name</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" id="name" name="name" placeholder="Name of your establishment" value="<%=name%>">
                            </div>

                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Address</label>
                            <textarea placeholder="Your establishment's address or address for deliveries" name="address"><%=address%></textarea>
                        </div>
                    </div>

                    <div class="one fields">
                        <div class="field">
                            <label for="country">Country</label>
                            <select id="country" class="ui fluid dropdown" name="country">
                                <option value="65">Singapore</option>
                            </select>
                        </div>
                        <div class="field">
                            <label for="postal">Postal Code</label>
                            <input min='0' max='999999' type="number" name="postal" id="postal" value="<%=postal%>">
                        </div>
                        <div for="phone" class="field">
                            <label>Contact Number</label>
                            <input min='0' type="number" name="phone" id="phone" value="<%=phone%>">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Description of Establishment</label>
                            <textarea placeholder="Description of your establishment, what crusines you serve, what is your concept, etc." name="desc"><%=desc%></textarea>
                        </div>
                    </div>
                    <input class="ui button" type="submit" value="Submit" />

                </form>

                <%} //Form for suppliers                
                else if (userType.equals("supplier")) {%>

                <form class="ui form" action="RegisterBServlet" method="post">
                    <input type="hidden" value="<%=userType%>" name="usertype" />
                    <h4 class="ui dividing header">Supplier Profile</h4>
                    <div class="field">
                        <label for="email">Email</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" id="email"  name="email" value="<%=email%>" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="two fields">
                            <div class="field">
                                <label for="password1">Password:</label> 
                                <input id="password1" type="password" name="password1" placeholder="Please enter password">
                            </div>
                            <div class="field">
                                <label for="password2">Reenter Password:</label> 
                                <input id="password2" type="password" name="password2"placeholder="Please reenter password for verification">
                            </div>
                        </div>
                    </div>
                    <div class="field">

                        <div class="two fields">
                            <div class="field">
                                <label for="name">Supplier Name</label>
                                <input type="text" id="name" name="name" placeholder="Name of your establishment" value="<%=name%>">
                            </div>
                            <div class="three field">
                                <label for="supplier_type">Catered Category</label>
                                <select id="supplier_type" class="ui fluid dropdown" name="supplier_type">
                                    <% for (String s : categList) {

                                            if (s.equals(supplier_type)) {
                                    %>       
                                    <option value=<%=s%> selected><%=s%></option>
                                    <%
                                    } else {

                                    %>
                                    <option value=<%=s%>><%=s%></option>
                                    <% }
                                        }%>>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Address</label>
                            <textarea placeholder="Contact address for your establishment" name="address"><%=address%></textarea>
                        </div>
                    </div>

                    <div class="one fields">
                        <div class="field">
                            <label for="country">Country</label>
                            <select id="country" class="ui fluid dropdown" name="country">
                                <option value="65">Singapore</option>
                            </select>
                        </div>
                        <div class="field">
                            <label for="postal">Postal Code</label>
                            <input min='0' max='999999' type="number" name="postal" id="postal" value="<%=postal%>">
                        </div>
                        <div for="phone" class="field">
                            <label>Contact Number</label>
                            <input min='0' type="number" name="phone" id="phone" value="<%=phone%>">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Description of Establishment</label>
                            <textarea placeholder="Description of what sort of products do you specialize in, etc." name="desc"><%=desc%></textarea>
                        </div>
                    </div>
                    <div class="one fields">
                        <div for="min_leadtime" class="field">
                            <label>Minimum Lead Time</label>
                            <input min='0' max="999" type="number" name="min_leadtime" id="phone" value="<%=min_leadtime%>">
                        </div>
                        <div for="max_leadtime" class="field">
                            <label>Maximum Lead Time</label>
                            <input min='0' max="999" type="number" name="max_leadtime" id="phone" value="<%=max_leadtime%>">
                        </div>  
                    </div>
                    <input class="ui button" type="submit" value="Submit" />


                </form>

                <% }%>
                <!--JAVASCRIPT-->
                <script>$("#form").validate();</script>
                <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
                <script src="js/formvalidation.js" type="text/javascript"></script>
                <script src="js/main.js" type="text/javascript"></script>
                </body>
                </html>

