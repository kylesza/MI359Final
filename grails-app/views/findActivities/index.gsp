<%--
  Created by IntelliJ IDEA.
  User: mattjuszczyk
  Date: 4/4/16
  Time: 12:59 PM
--%>

<%@ page import="mi359Final.Activities" contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
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
    .row.events .header {
        color: #080808;
        font-weight: 700;
    }
    ul.event-list li {
        list-style: none;
    }
    ul.event-list li.name {
        font-size: 28px;
        font-weight:700;
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

    .searchbar{
        float: left;
    }

    .button-float{
        float: right;
        background: #63d297;
        margin: 25px;
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
    <div class="row">
        <div class="col-md-8">
            <g:each var="i" status="index" in="${activities}">
                <g:if test="${i.approved}">
                            %{--<div class="col-xs-6 col-md-3">--}%
                                %{--<a href="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" class="thumbnail">--}%
                                    %{--<img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="...">--}%
                                %{--</a>--}%
                            %{--</div>--}%
                                <ul class="event-list" id="${index}">
                                    <li class="${i.activityName} name" style="display:none;"><span></span>: ${i.activityName}</li>
                                    %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                                    %{-- Inline styles should probs be put in style sheet --}%
                                    <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                                    <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                                    <li class="${i.activityName} description" style="display:none;">${i.activityDescription}</li>
                                </ul>

                            </div>
                        </div>
                </g:if>
            </g:each>


    %{--<h2>Search <input type="text" id="searchfor"/><br></h2>--}%



    <div class="container">
            <div class="content scaffold-list" role="main">
                <h1>Activities</h1>




                <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
                <div class="well">
                    <h2 class="searchbar">Search: <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter"> </h2>
                    <a href="javascript:randomEvent()" class="btn btn-info button-float" role="button">Find Random Event</a>
                    <table class="order-table table">

                        <tbody id="random">

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
                                    <g:if test="${activityInstance.activityType == 1}">
                                        <td><span></span><img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200"></td>
                                    </g:if>
                                    <g:elseif test="${activityInstance.activityType == 2}">
                                        <td><span></span><img src="http://i.imgur.com/8pHJELK.jpg" alt="..." height="200" width="200"></td>
                                    </g:elseif>
                                    <g:elseif test="${activityInstance.activityType == 3}">
                                        <td><span></span><img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200"></td>
                                    </g:elseif>
                                    <g:elseif test="${activityInstance.activityType == 4}">
                                        <td><span></span><img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200"></td>
                                    </g:elseif>
                                    <g:elseif test="${activityInstance.activityType == 5}">
                                        <td><span></span><img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200"></td>
                                    </g:elseif>
                                        <td>${activityInstance.activityName}</td>
                                        <td>${activityInstance.activityPrice}</td>
                                        <td>${activityInstance.activityType}</td>
                                        <td>${activityInstance.activityDescription}</td>
                                </tr>
                            </g:if>
                        </g:each>
                        </tbody>

                    </table>



                    <table class="order-table table">
                    <tr>
                        <th>Event</th>
                        <g:sortableColumn property="activityName" defaultOrder="desc"
                                          title="Activity Name" titleKey="activities.activityName" />
                        <g:sortableColumn property="activityPrice" title="Activity Price" />
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="activities">

                        <g:each in="${activities}" status="i" var="activityInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>
                                <img src="http://beartalkpodcast.com/imgs/BearTalkLogo.jpg" alt="..." height="200" width="200">
                            </td>
                            <td>${activityInstance.activityName}</td>
                            <td>$${activityInstance.activityPrice}</td>
                            <td>${activityInstance.activityDescription}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

                </div>
                </div>
                <div class="pagination">
                    <g:paginate total="${activities}" />
                </div>
            </div>
            <hr>





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
                var currentSpan = events[i].eq(0).find('span');// Find the span to add the label to
                // Create infowindow:

                console.log("currentName: " + currentName + "; currentLat: " + currentLat + "; currentLng: " + currentLng
                + "; currentDescription: " + currentDescription + "; currentLabel: " + currentLabel + "; currentSpan: " + currentSpan);

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

<script>
    var $rows = $('#table tr');
    $('#search').keyup(function() {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function() {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
    });
</script>


<script>
    (function(document) {
        'use strict';

        var LightTableFilter = (function(Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function(table) {
                    Arr.forEach.call(table.tBodies, function(tbody) {
                        Arr.forEach.call(tbody.rows, _filter);
                    });
                });
            }

            function _filter(row) {
                var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
                init: function() {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function(input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function() {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
</script>

<script>
    function randomEvent() {
        var trs = document.getElementById("activities").getElementsByTagName("tr");
        var rand = Math.floor( Math.random() * trs.length );
        trs[rand].style.backgroundColor = "#fff";
        document.getElementById('random').appendChild(trs[rand]);
    }
</script>

</body>
</html>