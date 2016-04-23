<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
        #map {
            width: 100%;
            height: 400px;
        }
        .map-row {
            margin-bottom:30px;
        }
        ul.event-list {
            list-style: none;
            padding-left: 0;
        }
        ul.event-list li {
            list-style: none;
        }
        ul.event-list li.name {
            font-size: 28px;
            font-weight:700;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row map-row">
        <div class="col-xs-12">
            <div id="map"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <g:each status="index" var="i" in="${activities}">
                %{--status is just a variable that hold the index of which loop the each is on --}%
                <div class="well">
                    <div class="row">
                        <div class="col-xs-6 col-md-3">
                            <a href="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" class="thumbnail">
                                <img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6 col-md-9">
                            <ul class="event-list" id="${index}">
                                <li class="${i.activityName} name"><span></span>: ${i.activityName}</li>
                                %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                                %{-- Inline styles should probs be put in style sheet --}%
                                <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                                <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                                <li class="${i.activityName} description">${i.activityDescription}</li>
                            </ul>

                        </div>
                    </div>
                </div>
                <hr>
            </g:each>
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

                    // Get number of events:
                    var numberOfEvents = $('.event-list').length - 1;
                    var events = [];
                    for (var i = 0; i <= numberOfEvents; i++){ // Loop through li starting at each activity's lat
                        var currentID = "#" + i + " li"; // Set up string for selector.
                        var currentEvent = $(currentID); // Find each event list, one by one.
                        events.push(currentEvent); // Add the event to the array of events
                    }
//                    console.log(events.length);
                    for (var i=0; i <= events.length - 1; i++){
                        var currentName = events[i].eq(0).text().substr(2); // Get event name
                        var currentLat = Number(events[i].eq(1).text()); // Get event lat
                        var currentLng = Number(events[i].eq(2).text()); // Get event lng
                        var currentDescription = events[i].eq(3).text(); // Get event description
                        var currentLabel = labels[labelIndex++ % labels.length]; // Gets correct letter for label
                        var currentSpan = events[i].eq(0).find('span');// Find the span to add the label to
                        // Create infowindow:
                        var contentString = '<div id="content">'+
                                '<div id="siteNotice">'+
                                '</div>'+
                                '<h1 id="firstHeading" class="firstHeading">'+currentName+'</h1>'+
                                '<div id="bodyContent">'+
                                '<p>'+currentDescription+'</p>'+
                                '<p>MAYBE EVENTUALLY HAVE THE USERNAME WHO POSTED THE EVENT</p>'+
                                '</div>'+
                                '</div>';

                        // Create map to pass to marker maker thing:
                        var latLng = new Object();
                        latLng['lat'] = currentLat;
                        latLng['lng'] = currentLng;

                        // Set span to correct label:
                        currentSpan.text(currentLabel);

                        // Add the infowindow:
                        var infowindow = new google.maps.InfoWindow({
                            content: contentString
                        });

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
    </div>
</div>
</body>
</html>