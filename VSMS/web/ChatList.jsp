<html>
    <head>
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

    <body>
        <form action="ChatVendor.jsp" method="GET" id="chat">
            <input type="hidden" value="FreshFoodz" name="hiddenvalue" id="hiddenvalue"/>

            <ul class ="list-group">
                <li class ="list-group-item"><h1>Contact Lists</h1></li>
                <li class ="list-group-item" name= "FreshFoodz" onclick="submitFunction('FreshFoodz')"><h3>FreshFoodz</h3></li>
                <li class ="list-group-item" name= "FreshFruitz" onclick="submitFunction('FreshFruitz')"><h3>FreshFruitz</h3></li>
                <li class ="list-group-item" name= "Only A Matter Of Thyme" onclick="submitFunction('Only A Matter Of Thyme')"><h3>Only A Matter Of Thyme</h3></li>
            </ul>
        </form>

        <!--JAVASCRIPT-->
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/chatjavascript.js"></script>


    </body>
</html>