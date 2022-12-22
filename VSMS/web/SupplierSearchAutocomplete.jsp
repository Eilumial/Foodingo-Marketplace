
<%@page import="Model.Vendor"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Favourite Suppliers</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <%
            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }

            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> supplierList = UserController.retrieveSupplierList();
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> favSupplierList = UserController.retrieveSupplierListByVendor(currentVendor.getVendor_id());
        %>

        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code

                //SEARCHING AND FILTERING
                //invoke get method in UserController with blank parameter given and blank response
                $.get("userservlet", {vendor_id: "1", supplier_id: "1", action: "search", word: $('#searchsupplier').val()}, function(responseText) {
                    $("#supplierlist").html(responseText);
                });
                $("#searchsupplier").keyup(function() {
                    $.get("userservlet", {vendor_id: "1", supplier_id: "1", action: "search", word: $('#searchsupplier').val()}, function(responseText) {
                        $("#supplierlist").html(responseText);
                    });
                });



                $('.create-favsupplier-button').click(function() {
                    //show modal button
                    $('#modaldiv').modal('show');
                });
            <%
                for (Supplier supplier : favSupplierList) {
                    int supplier_id = supplier.getSupplier_id();
            %>

                //CREATE DELETE CLICK OF BUTTONS
                $(".delete-favsupplier-button<%=supplier_id%>").click(function() {

                    console.log("My name is delete-favsupplier-button<%=supplier_id%>");
                    //show modal button
                    $('#deletemodaldiv<%=supplier_id%>').modal('show');
                });
            <%}%>
            });
        </script>
        <!--CSS-->
        <style>
            .unstar {
                background:url('http://biscuithead.ie/images/logo.png') center no-repeat;

                position:absolute; 
                width:5%;
                height:5%;
                text-align:center; 
                vertical-align:middle;
                z-index: 9999;
            }
        </style>
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

    </head>
    <body class="background">
        <div class="transparency">
            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>

                <h1>Favourite Supplier List</h1>
                <table>
                    <tr>
                        <th>Supplier Name</th>
                        <th>Supplier Email</th>
                        <th>Supplier Description</th>
                        <th>Delete?</th>
                    </tr>
                    <%for (Supplier supplier : favSupplierList) {%>

                    <tr>
                        <td><%=supplier.getSupplier_name()%></td>
                        <td><%=supplier.getEmail()%></td>
                        <td><%=supplier.getSupplier_description()%></td>
                        <td><button class="ui red inverted button delete-favsupplier-button<%=supplier.getSupplier_id()%>"> <i class="remove icon"></i>Delete FavSupplier</button></td>
                    </tr>
                    <%
                        }
                    %>
                </table>

                <!--MODAL DIV-->
                <button type="submit" name="submit" class="ui teal button create-favsupplier-button">Add Favorite Supplier</button>
                <div id="modaldiv" class="ui small modal">
                    <i class="close icon"></i>
                    <div class="header">
                        Add Favorite Suppliers
                    </div>
                    <div class="content">
                        <!--Inserting List of suppliers available. To star and unstar-->
                        <!--Create FavSupplier Filter with a search engine-->
                        Supplier name : <input type="text" name="searchsupplier" id="searchsupplier" value=""/>

                        <table id="supplierlist" name="supplierlist">                                
                        </table>
                        <!--Todo: Supplier list favourite star and unstar-->

                        <!--Input hidden attributes-->
                        <input type="hidden" name="vendor_id" value="1">
                        <input type="hidden" name="action" value="delete">

                    </div>
                    <div class="actions">
                        <div class="ui positive right labeled icon button">
                            <a class="text-white" href="<?php echo site_url('home/order');?>">Back to Home</a>
                            <i class="checkmark icon"></i>
                        </div>
                    </div>
                </div>
                <!--Create many modals for each Fav supplier to be deleted-->
                <% for (Supplier supplier : favSupplierList) {
                %>

                <div id="deletemodaldiv<%=supplier.getSupplier_id()%>" class="ui small modal">
                    <i class="close icon"></i>
                    <div class="header">
                        Delete Favourite Supplier
                    </div>

                    <div class="content">
                        <form class="ui form" id="deleteFavsupplier" action="userservlet" method="get"> 
                            <!--Inserting delete danger message. -->

                            Are you sure you would like to unfavourite this supplier?

                            <!--Input hidden attributes-->
                            <input type="hidden" name="supplier_id" value="<%=supplier.getSupplier_id()%>">
                            <input type="hidden" name="vendor_id" value="1">
                            <input type="hidden" name="action" value="delete">

                            <input type="submit" value="Delete" class="ui teal button" /> 
                        </form>
                    </div>
                    <div class="actions">
                        <div class="ui positive right labeled icon button">
                            <a class="text-white" href="<?php echo site_url('home/order');?>">Back to Home</a>
                            <i class="checkmark icon"></i>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
