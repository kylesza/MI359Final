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
    <style>
        form {
            padding: 0 50px;
            max-width: 500px;
        }
        form .row {
            margin-bottom:5px;
        }
        form input:not(#submit) {
            float:right;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h1>Input event information:</h1>
            <div id="errorHolder" syle="display:none">
                <ul id="errorList"></ul>
            </div>
            <div id="floating-panel">
                <g:form id="geocode-form" action="matchVal">
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Name:</b> <g:textField id="activityName" name="activityName" placeholder="eg. Bowling" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Price:</b> <g:field type="activityPrice" name="activityPrice" placeholder="420" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Description:</b> <g:textField id="activityDescription" name="activityDescription" placeholder="eg. Bowling" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Address:</b> <g:textField id="address" name="address" value="" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Start Date:</b> <g:textField id="startDate" name="startDate" placeholder="xx/xx/xx" /><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>End Date:</b> <g:textField id="endDate" name="endDate" placeholder="xx/xx/xx" /><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <b>Activity Type:</b>
                            <g:radioGroup id="activityType" name="activityType"
                                  labels="['Sports and Exercise','Food and Drink','Film','Music','Outdoor']"
                                  values="[1,2,3,4,5]">
                                    <p>${it.label} ${it.radio} ${it.value}</p>
                            </g:radioGroup>
                        </div>
                    </div>
                    <input id="submit" type="button" value="Submit">
                </g:form>
            </div>
        </div>
    </div>
</div>

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
                address = $('#address').val(),
                startDate = $('#startDate').val(),
                endDate = $('#endDate').val();

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
                            startDate: startDate,
                            endDate: endDate,
                            lat:results[0].geometry.location.lat,
                            lng:results[0].geometry.location.lng,
                            approved: false,
                        },
                        asnyc: false,
                        success: function(response){
                            if(response === '../findActivities/index'){ // If saving is successful, will redirect.
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