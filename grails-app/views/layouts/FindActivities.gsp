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
        <div class="row">
            <div class="col-sm-12">
                <div id="map" style="width: 100%; height:400px;"></div>
            </div>
    </div>

    <div class="container">
        <h1></h1>
        <hr>
        <div class="row">
            <div class="col-md-8">


                <g:each var="i" in="${activities}">
                <div class="well">
                    <div class="row">
                        <div class="col-xs-6 col-md-3">
                                <a href="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" class="thumbnail">
                                    <img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="...">
                                </a>
                                </div>
                                    <h1 class="${i.activityName}"><span></span> ${i.activityName}</h1>
                                %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                                %{-- Inline styles should probs be put in style sheet --}%
                                    <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                                    <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                                    <p class="${i.activityName} description">${i.activityDescription}</p>
                        </div>
                    </div>
                    <hr>
                </g:each>


                <hr>




            </div>


            <script>
                (function($) {
                    function initMap() {
                        // set up labels for markers
                        // will only work for 26 events, but at least it's something
                        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                        var labelIndex = 0;

                        // Create the map:
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 15,
                            center: {lat: 42.73391, lng: -84.47465499999998}
                        });

                        // Get latLng from events:
                        var list = $("#events-list li");
                        for (var i = 1; i <= list.length; i+=4){ // Loop through li starting at each activity's lat
                            //Gather things for labels and info window:
                            var currentLabel = labels[labelIndex++ % labels.length]; // Gets correct letter for label
                            var currentEvent = list.eq(i-1).find('span'); // Finds correct <li><span> to add label to
                            var currentName = list.eq(i-1).text().substr(2); // Substring gets rid of ': '
                            var currentDescription = list.eq(i+2).text(); // Finds description


                            // Set up description window...
                            // Have to do it as a hidden <li> again for now... Hopefully maybe a better way, but whatever.
                            var contentString = '<div id="content">'+
                                    '<div id="siteNotice">'+
                                    '</div>'+
                                    '<h1 id="firstHeading" class="firstHeading">'+currentName+'</h1>'+
                                    '<div id="bodyContent">'+
                                    '<p>'+currentDescription+'</p>'+
                                    '<p>MAYBE EVENTUALLY HAVE THE USERNAME WHO POSTED THE EVENT</p>'+
                                    '</div>'+
                                    '</div>';

                            // Add the infowindow:
                            var infowindow = new google.maps.InfoWindow({
                                content: contentString
                            });

                            //Set <li><span> to correct label:
                            currentEvent.text(currentLabel);

                            // latLng must be a map of form
                            // {lat: NUMBER_HERE, lng: NUMBER_HERE}
                            var latLng = new Object();
                            latLng['lat'] = Number(list.eq(i).text());
                            latLng['lng'] = Number(list.eq(i+1).text());

                            // Add the marker and infowindow to the map
                            var marker = new google.maps.Marker({
                                map: map,
                                label: currentLabel,
                                position: latLng
                            });

                            // This makes it so we can open multiple info windows and not just the last one built:
                            google.maps.event.addListener(marker,'click', (function(marker,contentString,infowindow){
                                return function() {
                                    infowindow.setContent(contentString);
                                    infowindow.open(map,marker);
                                };
                            })(marker,contentString,infowindow));
                        }
                    }

                    // Build Map:
                    initMap();
                })(jQuery);



            </script>


        %{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
        <g:layoutBody/>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
