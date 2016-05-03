<%--
  Created by IntelliJ IDEA.
  User: Jordan
  Date: 5/3/16
  Time: 5:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign Up</title>

    <style type="text/css" media="screen">
    body {
        background: -moz-linear-gradient(270deg, #303a3d 0%, #008080 100%);
        /* ff3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #303a3d), color-stop(100%, #008080));
        /* safari4+,chrome */
        background: -webkit-linear-gradient(270deg, #303a3d 0%, #008080 100%);
        /* safari5.1+,chrome10+ */
        background: -o-linear-gradient(270deg, #303a3d 0%, #008080 100%);
        /* opera 11.10+ */
        background: -ms-linear-gradient(270deg, #303a3d 0%, #008080 100%);
        /* ie10+ */
        background: linear-gradient(180deg, #303a3d 0%, #008080 100%);
        /* w3c */
        min-height: 750px;
    }


    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #63d297;
        background-color: #63d297;
        -moz-box-shadow: 2px 2px 2px #000;
        -webkit-box-shadow: 2px 2px 2px #000;
        -khtml-box-shadow: 2px 2px 2px #000;
        box-shadow: 2px 2px 2px #000;
    }

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #303a3d;
        margin: 0px 0 14px 0;
        color: #63d297;
        font-size: 18px;
        font-weight: bold;
    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type="text"] {
        width: 120px;
    }

    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="login">
                    <div class="inner">
                        <div class="fheader"><g:message message="Sign Up Now!"/></div>


                        <form action="createUser" id="loginForm" class="cssform" autocomplete="off">
                            <p>
                                <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                                <input type="text" style="color: black" class="text_" name="username" id="username"/>
                            </p>

                            <p>
                                <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                                <input type="password" style="color: black" class="text_" name="password" id="password"/>
                            </p>

                            <p>
                                <input type="submit" style="color: black" id="submit" value="Sign Up!"/>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>