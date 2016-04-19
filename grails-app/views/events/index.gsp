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
            <ul>
                <g:each var="i" in="${activities}">
                    <li>Name: ${i.activityName}</li>
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
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: {lat: -34.397, lng: 150.644}
            });
            var geocoder = new google.maps.Geocoder();

//            document.getElementById('submit').addEventListener('click', function() {
//                geocodeAddress(geocoder, map);
//            });
        }
        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({'address': address}, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    resultsMap.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: resultsMap,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
        initMap();
    })(jQuery);



</script>
</body>
</html>