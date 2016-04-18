<%--
  Created by IntelliJ IDEA.
  User: mattjuszczyk
  Date: 4/4/16
  Time: 1:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div id="floating-panel">
    <g:form id="geocode-form">
        Name: <g:textField id="activityName" name="activityName" placeholder="eg. Bowling" /><br>
        Price: <g:field type="activityPrice" name="activityPrice" placeholder="420" /><br>
        Type: <g:field type="activityType" name="activityType" placeholder="420" /><br>
        Description: <g:textField id="activityDescription" name="activityDescription" placeholder="eg. Bowling" /><br>
        Address: <g:textField id="address" name="address" value="" /><br>
        <input id="submit" type="button" value="Geocode">
    </g:form>
</div>
%{--<div id="map" style="height: 500px; width: 100%;"></div>--}%

<script type="text/javascript">
    (function($) {
        $('#submit').click(function() {
            ajaxCheck();
        });
        function ajaxCheck() {
            var geocoder = new google.maps.Geocoder();
            var activityName = $('#activityName').val(),
                activityPrice = $('#activityPrice').val(),
                activityType = $('#activityType').val(),
                activityDescription = $('#activityDescription').val(),
                address = $('#address').val();
            geocoder.geocode({'address': address}, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    $.ajax({
                        url:"<g:createLink url="[action:'saveEvent',controller:'addActivities']" />",
                        dataType: "json",
                        data: {
                            activityName: activityName,
                            activityPrice: activityPrice,
                            activityType: activityType,
                            activityDescription: activityDescription,
                            lat:results[0].geometry.location.lat,
                            lng:results[0].geometry.location.lng
                        },
                        asnyc: false,
                        success: function(data){
                            // REDIRECT HERE? who knows....
                            // Either here or in the controller action 'saveEvent'
                        }
                    });

                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
//        initMap();
    })(jQuery);


</script>
</body>
</html>