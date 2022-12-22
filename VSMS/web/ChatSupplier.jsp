
<%@page import="Controller.UserController"%>
<html>
    <head>
        <%@ include file="protect_supplier.jsp" %>
        <!--CSS-->
        <!-- Import CDN for semantic UI -->    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>

        <!-- Import CDN for Firebase and Bootstrap -->    
        <script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/chatlayout.css">
    </head>
     <%            //ArrayList<Order> orderList = OrderController.retrieveOrderList(1);
            Supplier s = (Supplier) session.getAttribute("currentSupplier");
            if (s == null) {
                s = UserController.retrieveSupplierByID(1);
            }
            String supplierName = s.getSupplier_name();
            String vendorName = request.getParameter("vendor_name");
    %>
    <bodyclass="background">
        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">

                <!-- CHAT MARKUP -->

                <H1>Welcome FreshFoodz</h1>
                <div class="chat">
                    <header class="chat-header">Supplier Chat (https://foodingomarketplace.firebaseio.com) <button class="ui deny inverted green button"><a href="SupplierHome.jsp">Go to Home</a></button><button class="ui deny inverted green button"><a href="ChatList.jsp">Go to ChatList</a></button></header>
 
                    <div class='chat-toolbar'>
                        Sending to: <h3><%=vendorName%></h3>
                    </div>

                    <ul id='messages' class="chat-messages"></ul>

                    <footer>
                        <input type='text' id='messageInput'  placeholder='Type a message...'>
                    </footer>
                </div>
            </div>
        </div>
        <!--CHAT JAVASCRIPT-->
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/chatjavascript.js"></script>
        <script>
            initializeSupplierChat("<%=supplierName%>", "<%=vendorName%>");
        </script>
    </body>
</html>