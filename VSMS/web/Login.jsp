<%-- 
    Document   : Login
    Created on : 20 Jan, 2016, 3:36:05 PM
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="box">
            <h1>Log In</h1>
            <form>
                <div class="input-group">
                    <input type="text" id="username" autocomplete="off" onblur="checkInput(this)" />
                    <label for="username">Username</label>
                </div>
                <div class="input-group">
                    <input type="password" id="password" onblur="checkInput(this)" />
                    <label for="password">Password</label>
                </div>
                <input type="submit" value="Enter" />
            </form>
        </div>
    </body>

    <script>
        function checkInput(input) {
            if (input.value.length > 0) {
                input.className = 'active';
            } else {
                input.className = '';
            }
        }


    </script>
</html>
