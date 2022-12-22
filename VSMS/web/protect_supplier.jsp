<%-- 
    Document   : protect_supplier
    Created on : Feb 19, 2016, 1:34:16 PM
    Author     : TC
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

            //Vendor protect_Vendor = (Vendor) session.getAttribute("currentVendor");
            Supplier protect_Supplier = (Supplier) session.getAttribute("currentSupplier");
            if (protect_Supplier == null) {
                session.setAttribute("errorMsg", "Please login to a Supplier account");
                response.sendRedirect("Login.jsp");
                return;
            } 
        %>


    </body>
</html>
