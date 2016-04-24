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
                <li class="active"><a href="../findActivities/index">Find Activities</a></li>
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
                    <li><a href="../auth">Login</a></li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="jumbotron">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d46877.815583205986!2d-84.51120885524018!3d42.748940665526256!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8822e875eae5abf3%3A0x3b19b3f7117ca625!2sEast+Lansing%2C+MI!5e0!3m2!1sen!2sus!4v1460993507895" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
    </div>

    <div class="container">
        <h1></h1>
        <hr>
        <div class="row">
            <div class="col-md-8">




                <div class="well">
                    <div class="row">
                        <div class="col-xs-6 col-md-3">
                            <a href="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" class="thumbnail">
                                <img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="...">
                            </a>
                        </div>
                        <h1>Test Event 3</h1>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mi nunc, finibus nec risus quis, scelerisque ultricies nibh. Ut vel est ut urna dapibus fermentum. Nam ornare nibh sed molestie pulvinar. Vivamus tincidunt, metus nec varius mollis, turpis turpis scelerisque magna, id egestas ante lacus eu diam. Pellentesque vel turpis.
                    </div>
                </div>

                <hr>

                <div class="well">
                    <div class="row">
                        <div class="col-xs-6 col-md-3">
                            <a href="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" class="thumbnail">
                                <img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="...">
                            </a>
                        </div>
                        <h1>Test Event 3</h1>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mi nunc, finibus nec risus quis, scelerisque ultricies nibh. Ut vel est ut urna dapibus fermentum. Nam ornare nibh sed molestie pulvinar. Vivamus tincidunt, metus nec varius mollis, turpis turpis scelerisque magna, id egestas ante lacus eu diam. Pellentesque vel turpis.
                    </div>
                </div>









                <!-- Pager -->
                <ul class="pager">
                    <li class="previous">
                        <a href="#">&larr; Older</a>
                    </li>
                    <li class="next">
                        <a href="#">Newer &rarr;</a>
                    </li>
                </ul>

            </div>


        %{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
        <g:layoutBody/>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
