<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>

        <g:layoutHead/>
        <style>
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
            }
            nav.navbar-inverse {
                background-color: #303a3d;
                border-color: #63d297;
            }
            nav.navbar-inverse .dropdown-menu {
                background: #303a3d;
            }
            nav.navbar-inverse .navbar-header a {
                color: #63d297;
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
                <li><a href="../findActivities/index">Find Activities</a></li>
                <li><a href="../addActivities/index">Add Activities</a></li>
                <li class="active dropdown">
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
                    <li><a href="../auth">Login</a></li>
                    <li><a href="../admin/signup">Sign Up</a></li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </nav>

        %{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
        <g:layoutBody/>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
