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

%{--<g:hasErrors bean="${activities}">--}%
    %{--<g:eachError bean="${activities}" var="error">--}%
        %{--${error.field}: <g:message error="${error}" />--}%
        %{--<ul>--}%
            %{--<g:each in="${error.codes}" var="code">--}%
                %{--<li>${code}</li>--}%
            %{--</g:each>--}%
        %{--</ul>--}%
    %{--</g:eachError>--}%
%{--</g:hasErrors>--}%
<div id="errorHolder" syle="display:none">
    <ul id="errorList"></ul>
</div>
<div id="floating-panel">
    <g:form id="geocode-form">
        Name: <g:textField id="activityName" name="activityName" placeholder="eg. Bowling" /><br>
        Price: <g:field type="activityPrice" name="activityPrice" placeholder="420" /><br>
        Type: <g:field type="activityType" name="activityType" placeholder="420" /><br>
        Description: <g:textField id="activityDescription" name="activityDescription" placeholder="eg. Bowling" /><br>
        Address: <g:textField id="address" name="address" value="" /><br>
        <input id="submit" type="button" value="Submit">
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
                        dataType: "text",
                        data: { // This is what will get passed to controller in 'params' object
                            activityName: activityName,
                            activityPrice: activityPrice,
                            activityType: activityType,
                            activityDescription: activityDescription,
                            lat:results[0].geometry.location.lat,
                            lng:results[0].geometry.location.lng
                        },
                        asnyc: false,
                        success: function(response){
                            if(response === 'list'){ // If saving is successful, will redirect.
                                window.location.href = response;
                            } else {// Else, try to display errors
                                var response = [response];
                                var list = $("#errorList");
                                var parent = list.parent();
                                list.detach().empty().each(function(i){
                                    for (var x = 0; x < response.length; x++){
                                        $(this).append('<li>' + response[x] + '</li>');
                                        if (x == response.length - 1){
                                            $(this).appendTo(parent);
                                        }
                                    }
                                });
                                // detaches list from DOM so it doesn't try to refresh page,
                                // empty list in case theres already in thing there,
                                // each is really just to trigger for loop
                                // for loop loops through each error in 'response' array to display.

                                // Ideally, that's how that should work, but JS isn't recognizing the
                                // response passed from controller as an array
                                parent.css('display', 'block');
                            }

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