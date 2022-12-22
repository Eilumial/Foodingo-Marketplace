<%@page import="Controller.UserController"%>
<html>
    <head>
        <%@ include file="protect.jsp" %>
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
    <%         Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
        //in case current vendor does not exist
        if (currentVendor == null) {
            currentVendor = UserController.retrieveVendorByID(1);
        }
        String supplierName = request.getParameter("hiddenvalue");
        //if there is an order id from Order Context, then please push a message
        String order_idStr = request.getParameter("order_id");
    %>
    <body class="background">
        <div class="transparency">

            <div class="ui segment" style="left:5%;width:90%">
                <!-- CHAT MARKUP -->
                <div class="chat">
                    <header class="chat-header">Vendor Chat (https://foodingomarketplace.firebaseio.com)  <button class="ui deny inverted green button"><a href="Home.jsp"><font color="white">Go to Home</font></a></button><button class="ui deny inverted green button"><a href="ChatList.jsp"><font color="white">Go to ChatList</font></a></button></header>

                    <div class='chat-toolbar'>
                        Sending to: <h3><%=supplierName%></h3>
                    </div>

                    <ul id='messages' class="chat-messages"></ul>

                    <footer class="chat-footer">
                        <input type='text' id='messageInput'  placeholder='Type a message...'>
                    </footer>
                </div>
            </div>
        </div>
        <!--CHAT JAVASCRIPT-->
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/chatjavascript.js"></script>
        <script>
            initializeVendorChat("<%=currentVendor.getVendor_name()%>", "<%=supplierName%>");
            
            //This is to push order id in case of the historical
            <%
                if (order_idStr != null) {
            %>
                    pushMessage("<%=currentVendor.getVendor_name()%>", "<%=supplierName%>","<a href=Invoice.jsp?order_id="+<%=order_idStr%>+">Hi, I would like to inquire this order (id=<%=order_idStr%>)</a>");
            <%}%>
        </script>


    </body>
</html>