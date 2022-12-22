<%-- 
    Document   : composer
    Created on : Jan 13, 2016, 6:21:32 PM
    Author     : TC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <title>Ingredient Information</title>

        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>

        <table>
            <tr>
                <th colspan="2">Ingredient Information</th>
            </tr>
            <tr>
                <td>Ingredient Name: </td>
                <td>${requestScope.supplier.name}</td>
            </tr>
            
        </table>

        <p>Go back to <a href="SupplierSearch.jsp" class="link">application home</a>.</p>
    </body>
</html>