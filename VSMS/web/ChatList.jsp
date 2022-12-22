<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="css/chatstylesheet.css">

    </head>
    <%        Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
        //in case current vendor does not exist
        if (currentVendor == null) {
            currentVendor = UserController.retrieveVendorByID(1);
        }
        //this supplier list indicates the favorite supplier only
        ArrayList<Supplier> supplierList = UserController.retrieveSupplierListByVendor(currentVendor.getVendor_id());
        // TODO: improving it by inputting those that have established communication

    %>

    <body class="background">


        <div class="transparency">
            <div class="ui segment" style="left:5%;width:90%">

                <%@ include file="Navbar.jsp" %>
                <!--This is for vendor-->
                <%if (currentVendor != null) {%>
                <form action="ChatVendor.jsp" method="GET" id="chat">
                    <input type="hidden" name="hiddenvalue" id="hiddenvalue"/>
                    <h1>Contact Lists</h1>
                    <ul class ="list-group" id="chatlist">
                        <%for (Supplier supplier : supplierList) {%>
                        <!--<li class ="list-group-item" name= "<%=supplier.getSupplier_name()%>" onclick="submitFunction('<%=supplier.getSupplier_name()%>')"><h3><%=supplier.getSupplier_name()%></h3></li>-->
                                <%}%>           
                    </ul>
                </form>
                <%}%>
                <!--JAVASCRIPT-->
                <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
                <script src="js/chatjavascript.js"></script>
                <script>
                              initializeChatList("<%=currentVendor.getVendor_name()%>", "vendor");  
                </script>
            </div>
        </div>
    </body>
</html>