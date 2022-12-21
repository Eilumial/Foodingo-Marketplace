<%-- 
    Document   : VendorProfile
    Created on : Jan 23, 2016, 10:59:24 AM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Profile</title>
    </head>
    <body>
        <h1>Vendor Profile</h1>
        <%
            int ID=1
            //ID=session.getAttribute(vendor_id);
            ArrayList<Supplier> favSupplierList=UserController.retrieveFavouriteSupplierListByVendor(ID);
            for(Supplier supplier:favSupplierList){
                %><%=supplier.getSupplier_name()%><%
                %><%=supplier.getSupplier_description()%><%
                %><%=supplier.getEmail()%><%
            }
        %>
    </body>
</html>
