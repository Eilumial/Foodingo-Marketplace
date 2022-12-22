<%-- 
    Document   : _Encrypter
    Created on : Mar 16, 2016, 2:27:22 AM
    Author     : TC
--%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="Controller.UtilityController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            String input = "123abc";

            
        %>
    </head>
    <body>
        <h1><%=input%> = <%=DigestUtils.sha1Hex(input)%></h1>
        <%=DigestUtils.sha1Hex(UtilityController.generateRandomPassword())%>
    </body>
</html>
