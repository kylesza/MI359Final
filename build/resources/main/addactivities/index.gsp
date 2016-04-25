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

<h1>Add New Event</h1>
<g:form action="createEvent">
    Event Name:<g:textField name="eventName"/><br/>
    Event Price:<g:textField name="eventPrice"/><br/>
    Event Type: <g:select name="eventType" from="${["Arts and Crafts","Sports","Recreational"]}"/>
    Start Date:<g:datePicker name="startDate"/><br/>
    End Date:<g:datePicker name="endDate"/><br/>
    Description:<g:textArea name="description" rows="5" cols="40"/><br/>
    Image:<fieldset>
    <legend>Upload Image</legend>
    <g:uploadForm action="uploadImage">
        <label for="image">Image</label>
        <input type="file" name="image" id="image" />
        <div style="font-size:0.8em; margin: 1.0em;">
            For best results, image should have a width-to-height ratio of 4:5.
            (Saves file space, web load time, etc...)
        </div><br/>
        <input type="submit" class="buttons" value="Upload" />
    </g:uploadForm>
</fieldset>
    <g:submitButton name="submitEvent"/>
</g:form><br/>

</body>
</html>