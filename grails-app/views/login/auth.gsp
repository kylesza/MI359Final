<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <style type="text/css" media="screen">
    nav.navbar-inverse {
        background-color: #303a3d;
        border-color: #ff5252;
    }
    nav.navbar-inverse .navbar-header a {
        color: #ff5252;
    }
    nav.navbar-inverse ul.nav li a {
        color: #63d297;
    }
    nav.navbar-inverse ul.nav li:hover {
        background-color: #080808;
    }
    nav.navbar-inverse ul.nav li:hover a {
        color: #63d297;
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
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <sec:ifLoggedIn>
                <g:link controller="findActivities" action="index" class="navbar-brand">TimeKiller</g:link>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <g:link controller="login" action="auth" class="navbar-brand">TimeKiller</g:link>
            </sec:ifNotLoggedIn>
        </div>
        <ul class="nav navbar-nav">
            <li ><a href="../findActivities/index">Find Activities</a></li>
            <li><a href="../addActivities/index">Add Activities</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../events/index">My Events</a></li>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li role="separator" class="divider"></li>
                        <li><a href="../admin/index">Admin</a></li>
                        <li><a href="../browseUsers/index">Browse Users</a></li>
                    </sec:ifAnyGranted>
                </ul>
            </li>
            <sec:ifLoggedIn>
                <li>
                    <g:link controller="logout">Logout</g:link>
                </li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li class="active"><a href="../auth">Login</a></li>
            </sec:ifNotLoggedIn>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div id="login">
                <div class="inner">
                    <div class="fheader"><g:message code='springSecurity.login.header'/></div>

                    <g:if test='${flash.message}'>
                        <div class="login_message">${flash.message}</div>
                    </g:if>

                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                        <p>
                            <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                            <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
                        </p>

                        <p>
                            <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                            <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
                        </p>

                        <p id="remember_me_holder">
                            <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                        </p>

                        <p>
                            <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
