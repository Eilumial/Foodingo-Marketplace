<%-- 
    Document   : MainMenu
    Created on : Jan 18, 2016, 1:03:48 PM
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            $(document).on("click", ".show", function () {
                $(".ui.modal").modal("show");
            });
        </script>
        <title>Main Menu</title>
    </head>
    
    
    <body class="background">
        <div>    
        <div>
            <div class="ui segment" style="left:10%;width:80%">
                <p>
                <div class="ui attached stackable menu">
                    <div class="ui container" >
                        <a class="item">
                            <i class="home icon"></i> Home
                        </a>
                        <a class="item">
                            <i class="grid layout icon"></i> Browse
                        </a>
                        <a class="item">
                            <i class="mail icon"></i> Messages
                        </a>
                        <div class="ui simple dropdown item">
                            More
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <a class="item"><i class="edit icon"></i> Edit Profile</a>
                                <a class="item"><i class="globe icon"></i> Contact</a>
                                <a class="item"><i class="settings icon"></i> Account Settings</a>
                            </div>
                        </div><p>
                        <div class="left item">
                            <div class="ui input"><input type="text" placeholder="Search..."></div>
                        </div>
                        </p>
                    </div>
                </div>
                </p>
                <p>   
                <div class="ui breadcrumb">
                    <a class="section">Home</a>
                    <i class="right angle icon divider"></i>
                    <a class="section">Manage Menu</a>
                    <i class="right angle icon divider"></i>
                    <div class="active section">Recipe Buider</div>
                </div>
                <div class="ui raised very padded text container">
                    <h2 class="ui header">VSMS Menu</h2>
                    <p>

                        <button type="button" class="ui button show">123</button>

                    </p>
                    <p></p>
                </div>
                </p>


                <div class="ui left rail">
                    <div class="ui">
                        <%--
                        content
                        --%>
                    </div>
                </div>
                <div class="ui right rail">
                    <div class="ui">
                        <%--
                       content
                        --%>
                    </div>
                </div>
                <p></p>
                <p></p>
            </div>


            <div class="ui modal">
                <i class="close icon"></i>
                <div class="header">
                    Profile Picture
                </div>
                <div class="image content">
                    <div class="ui medium image">
                        <img src="/images/avatar/large/chris.jpg">
                    </div>
                    <div class="description">
                        <div class="ui header">We've auto-chosen a profile image for you.</div>
                        <p>We've grabbed the following image from the <a href="https://www.gravatar.com" target="_blank">gravatar</a> image associated with your registered e-mail address.</p>
                        <p>Is it okay to use this photo?</p>
                    </div>
                </div>
                <div class="actions">
                    <div class="ui black deny button">
                        Nope
                    </div>
                    <div class="ui positive right labeled icon button">
                        Yep, that's me
                        <i class="checkmark icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
