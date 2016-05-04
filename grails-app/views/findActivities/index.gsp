<%--
  Created by IntelliJ IDEA.
  User: mattjuszczyk
  Date: 4/4/16
  Time: 12:59 PM
--%>

<%@ page import="mi359Final.Activities" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
    #map {
        width: 100%;
        height: 400px;
        border: 1px solid #63d297;
    }
    .map-row {
        margin-bottom:30px;
    }
    .row.events .header {
        color: #080808;
        font-weight: 700;
    }
    .scaffold-list .well {
        background-color: #202729;
    }
    .scaffold-list table.event-table {
        color: #080808;
        border: 1px solid #080808;
    }
    .scaffold-list table.event-table td:not(:first-child), th:not(:first-child) {
        border-left: 1px solid #f5f5f5;
    }
    .scaffold-list table.event-table th a {
        color: #63d297;
    }
    .scaffold-list table.event-table tbody tr.even {
        background-color: #dcdcdc;
        color: #080808;
    }


    </style>
</head>

<body>


<div class="container">
    <div class="row map-row">
        <div class="col-sm-12">
            <div id="map" style="width: 100%; height:400px;"></div>
        </div>
    </div>
    <div class="row events">
        <div class="col-md-12">
            <g:each var="i" status="index" in="${activities}">
                <g:if test="${i.approved}">
                    <ul class="event-list" id="${index}">
                        <li class="${i.activityName} name" style="display:none;"><span></span>: ${i.activityName}</li>
                        %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                        %{-- Inline styles should probs be put in style sheet --}%
                        <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                        <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                        <li class="${i.activityName} description" style="display:none;">${i.activityDescription}</li>
                    </ul>
                </g:if>
            </g:each>

            <div class="content scaffold-list" role="main">
                <h1 class="header">Activities</h1>
                <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
                %{--<div class="well">--}%
                    <table class="table event-table">
                        <thead>
                            <tr>
                                <th>Event</th>
                                <g:sortableColumn property="activityName" defaultOrder="desc"
                                                  title="Activity Name" titleKey="activities.activityName" />
                                <g:sortableColumn property="activityPrice" title="Activity Price" />
                                <th></th>
                            </tr>
                        </thead>
                        <g:each in="${activities}" status="i" var="activityInstance">
                            <g:if test="${activityInstance.approved}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'} event-details${i}">
                                    <td><span></span><img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200"></td>
                                    <td>${activityInstance.activityName}</td>
                                    <td>$${activityInstance.activityPrice}</td>
                                    <td>${activityInstance.activityDescription}</td>
                                </tr>
                            </g:if>
                        </g:each>
                        </tbody>
                    </table>
                %{--</div>--}%
            </div>
                %{--<div class="pagination">--}%
                    %{--<g:paginate total="${activities}" />--}%
                %{--</div>--}%
        </div>
    </div>
</div>
%{--</div>--}%
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

            for (var i=0; i <= events.length - 1; i++){
                var currentName = events[i].eq(0).text().substr(2); // Get event name
                var currentLat = Number(events[i].eq(1).text()); // Get event lat
                var currentLng = Number(events[i].eq(2).text()); // Get event lng
                var currentDescription = events[i].eq(3).text(); // Get event description
                var currentLabel = labels[labelIndex++ % labels.length]; // Gets correct letter for label
                var findSpan = ".event-details" + i;
                console.log(findSpan);
                var currentSpan = $(findSpan).eq(0).find('span');// Find the span to add the label to

//                console.log("currentName: " + currentName + "; currentLat: " + currentLat + "; currentLng: " + currentLng
//                + "; currentDescription: " + currentDescription + "; currentLabel: " + currentLabel + "; currentSpan: " + currentSpan);

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
                currentSpan.text(currentLabel + ": ");
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
</body>
</html>