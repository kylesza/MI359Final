<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div id="map" style="width: 100%; height:400px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <ul id="events-list">
                <g:each var="i" in="${activities}">
                    <li class="${i.activityName}">Name: ${i.activityName}</li>
                    %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                    %{-- Inline styles should probs be put in style sheet --}%
                    <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                    <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                </g:each>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 text-center">
            <g:link action="index" controller="addActivities">Add more</g:link>
        </div>
    </div>
</div>

<script>
    (function($) {
        function initMap() {
            // Create the map:
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: {lat: 42.73391, lng: -84.47465499999998}
            });

            // Get latLng from events:
            var list = $("#events-list li");
            for (var i = 1; i <= list.length; i+=3){ // Loop through li starting at each activity's lat

                // latLng must be a map of form
                // {lat: NUMBER_HERE, lng: NUMBER_HERE}
                var latLng = new Object();
                latLng['lat'] = Number(list.eq(i).text());
                latLng['lng'] = Number(list.eq(i+1).text());

                // Add the marker to the map
                var marker = new google.maps.Marker({
                    map: map,
                    position: latLng
                });
            }
        }

        // Build Map:
        initMap();
    })(jQuery);



</script>
</body>
</html>