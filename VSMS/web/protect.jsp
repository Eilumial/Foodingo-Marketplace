<%-- 
    Document   : Validation
    Created on : Jan 31, 2016, 5:01:37 PM
    Author     : Benjamin
--%>

<%@page import="Model.Supplier"%>
<%@page import="Model.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Vendor protect_Vendor = (Vendor) session.getAttribute("currentVendor");
            //Supplier protect_Supplier = (Supplier) session.getAttribute("currentSupplier");
            if (protect_Vendor == null) {
                session.setAttribute("errorMsg", "Please login to a Vendor account");
                response.sendRedirect("Login.jsp");
                return;
            } 
        %>


    </body>
</html>
