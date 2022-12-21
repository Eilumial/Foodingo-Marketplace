<%-- 
    Document   : RecipeBuilder
    Created on : Jan 18, 2016, 12:59:09 PM
    Author     : Benjamin
--%>

<%@page import="Controller.IngredientController"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Recipe Builder</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
                $.post("ingredientservlet", function(responseText) {   
                    $("#dishListAdded").append(responseText);          
                });
                $('.create-dish-button').click(function() {
                    //show modal button
                    $('#modaldiv').modal('show');
                });

            });

        </script>
        <!--CSS-->
        <!-- Import CDN for semantic UI -->    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
        <!--for general CSS please refer to the main css. For others, please just append the link line below-->
        <link rel="stylesheet" type="text/css" href="css/main.css">

    </head>
    <body>
        <h1>Your Menu</h1>
        <ul id="dishListAdded">
        </ul>
        <!--Button to invoke the modal-->
        <button type="submit" name="submit" class="ui teal button create-dish-button"> + Add Dish</button>
        
        <!--Create a modal-->
        <div id="modaldiv" class="ui small modal">
            <i class="close icon"></i>
            <div class="header">
                Add Dish
            </div>

            <div class="content">
                <form class="ui form" id="addIngredient" action="ingredientservlet" method="post"> 
                    <!--Inputting form elements-->
                    Dish Name: <input type="text" name="dish_name"/>
                    Dish Description: <textarea name="dish_description">Enter dish description here...</textarea>
                    
                    <!--Input hidden attributes-->
                    <input type="hidden" name="vendor_id" value="1">
                    
                    <input type="submit" value="Add" class="ui teal button" /> 
                </form>
            </div>
            <div class="actions">
                <div class="ui positive right labeled icon button">
                    <a class="text-white" href="<?php echo site_url('home/order');?>">Back to Home</a>
                    <i class="checkmark icon"></i>
                </div>
            </div>
        </div>
        <!--JAVASCRIPT-->
        <!--for general Javascript please refer to the main js. For others, please just append the script line below-->
        <script src="js/formvalidation.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

