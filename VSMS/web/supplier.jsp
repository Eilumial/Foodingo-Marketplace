<%-- 
    Document   : composer
    Created on : Jan 13, 2016, 6:21:32 PM
    Author     : TC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Supplier Information</title>

        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>

        <table>
            <tr>
                <th colspan="2">Supplier Information</th>
            </tr>
            <tr>
                <td>Supplier Name: </td>
                <td>${requestScope.supplier.supplier_name}</td>
            </tr>
            <tr>
                <td>Type: </td>
                <td>${requestScope.supplier.supplier_type}</td>
            </tr>
            <tr>
                <td>ID: </td>
                <td>${requestScope.supplier.supplier_id}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${requestScope.supplier.address}</td>
            </tr>      
        </table>

        <p>Go back to <a href="SupplierSearch.jsp" class="link">application home</a>.</p>
    </body>
</html>