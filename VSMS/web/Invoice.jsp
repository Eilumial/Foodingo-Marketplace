<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="Model.Orderline"%>
<%@page import="Model.Order"%>
<%@page import="Controller.OrderController"%>
<%@page import="Controller.UtilityController"%>
<%@page import="Model.Ingredient"%>
<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Invoice</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!--Form VALIDATION-->
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/formvalidation.js"></script>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code

            });
        </script>
    </head>
    <body class="background">


        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <%@ include file="Navbar.jsp" %>


                <%                    Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
                    if (currentVendor == null) {
                        currentVendor = UserController.retrieveVendorByID(1);
                    }
                    //this will get the ingredient name and supplier as the unique identifier of Ingredient
                    String orderIDStr = request.getParameter("order_id");
                    Order order = OrderController.retrieveOrderByID(UtilityController.convertStringtoInt(orderIDStr));
                %>
                <h1 class="ui header">
                    <img src="resource/pictures/carrot.png" alt="HTML5 Icon" style="width:45px;height:45px;">

                    <div class="content">
                        Order Invoice
                        <div style="color:black" class="sub header">Check Your Order Invoice</div>
                    </div>
                </h1>
                <div id="invoice-content">
                <h1 style="color:black">Your Order ID: <%=order.getOrder_id()%></h1>
                

                    <table class="ui very padded large striped  table">

                        <tr>
                            <th><h2>Status</h2></th>
                        <td><h3><%=order.getStatus()%></h3></td>
                        </tr>
                        <tr>
                            <th><h2>Date of Order</h2></th>
                        <td><h3><%=order.getDt_order()%></h3></td>
                        </tr>
                        <tr>
                            <th><h2>Expected Delivery</h2></th>
                        <td><h3><%=order.getExpected_delivery()%></h3></td>
                        </tr>
                        <tr> 
                            <th><h2>Total Price</h2></th>
                        <td><h3><%=order.getTotal_final_price()%></h3></td>
                        </tr>

                        <tr>
                            <th><h2>Special Request</h2></th>
                        <td><h3><%=order.getSpecial_request()%></h3></td>
                        </tr>
                        <tr>
                            <th><h2>Orderlines</h2></th>
                        <td>
                            <ul>
                                <%for (Orderline orderline : order.getOrderlines()) {%>
                                <li><%=orderline%></li>
                                    <%}%>
                            </ul>
                        </td>
                        </tr>
                    </table>
                </div>
                <button class="ui large orange button" id="generate-invoice-button">Generate PDF</button>
            </div>
        </div>
        <!--JAVASCRIPT-->
        <script>$("#form").validate();</script>
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>

        <!--This is plugins for pdf generations-->
        <!--The limitation is that this could not be done iteratively on modal as it leverages on using a specific element id to generate a specific printout-->
        <!--jsPDF is used to open terminal to print out content into the PDF wherease html2canvas is a library to take HTML screenshot as an image-->
        <script src="js/jsPDFdebug.js" type="text/javascript"></script>
        <script src="js/html2canvas.js" type="text/javascript"></script>
        <script>

//Generate invoice picture (hard to get specifically to the modal because of the limitation of looping through the modals
            $('#generate-invoice-button').click(function() {
//                var pdf = new jsPDF('p', 'pt', 'a4');
//                pdf.addHTML($('#invoice-content'), 15, 15, {width: 900}, function() {
//                    pdf.save('invoice.pdf');
//                });
                var pdf = new jsPDF('p', 'pt', 'letter')

// source can be HTML-formatted string, or a reference
// to an actual DOM element from which the text will be scraped.
                        , source = $('#invoice-content')[0]

// we support special element handlers. Register them with jQuery-style
// ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
// There is no support for any other type of selectors
// (class, of compound) at this time.
                        , specialElementHandlers = {
                            // element with id of "bypass" - jQuery style selector
                            '#bypassme': function(element, renderer) {
                                // true = "handled elsewhere, bypass text extraction"
                                return true
                            }
                        }

                margins = {
                    top: 80,
                    bottom: 60,
                    left: 40,
                    width: 522
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(
                        source // HTML string or DOM elem ref.
                        , margins.left // x coord
                        , margins.top // y coord
                        , {
                            'width': margins.width // max width of content on PDF
                            , 'elementHandlers': specialElementHandlers
                        },
                function(dispose) {
                    // dispose: object with X, Y of the last line add to the PDF
                    //          this allow the insertion of new lines after html
                    pdf.save('invoice.pdf');
                },
                        margins
                        )

            });
        </script>
    </body>
</html>

