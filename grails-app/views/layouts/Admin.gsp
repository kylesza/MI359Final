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
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TimeKiller</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="../findActivities/index">Find Activities</a></li>
            <li><a href="../addActivities/index">Add Activities</a></li>
            <li class="dropdown, active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../events/index">My Events</a></li>
                    <sec:access expression="hasRole('ADMIN_ROLE')">
                        <li role="separator" class="divider"></li>
                        <li><a href="../admin/index">Admin</a></li>
                        <li><a href="../browseUsers/index">Browse Users</a></li>
                    </sec:access>
                </ul>
            </li>
            <sec:ifLoggedIn>
                <li><a href="#">Logout</a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li><a href="../auth">Login</a></li>
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
