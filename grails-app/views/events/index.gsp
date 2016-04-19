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
                    <li class="${i.activityName}"><span></span>: ${i.activityName}</li>
                    %{-- Put the activity's latLng here because I don't think it's accessible from JS... --}%
                    %{-- Inline styles should probs be put in style sheet --}%
                    <li class="${i.activityName} lat" style="display:none;">${i.lat}</li>
                    <li class="${i.activityName} lng" style="display:none;">${i.lng}</li>
                    <li class="${i.activityName} description" style="display: none;">${i.activityDescription}</li>
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

                // Add the marker to the map
                var marker = new google.maps.Marker({
                    map: map,
                    label: currentLabel,
                    position: latLng
                });
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