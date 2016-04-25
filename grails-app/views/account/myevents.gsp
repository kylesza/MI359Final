<%--
  Created by IntelliJ IDEA.
  User: myoon
  Date: 4/4/16
  Time: 11:46 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

%{--Approved Events List--}%

<h1>Approved Events:</h1>

<g:if test="${events.empty}">
    <p>There is nothing going on right now! <g:link action="addactivities">Add an event</g:link></p>
</g:if>

<g:else>
    <table style="width:70%">
        <g:each var="name" in="${events}">

            <g:form action="edit">
                <tr>
                    <td align="center"><p>${name.eventName}</p></td>
                    <td align="center"><p>${name.eventType}</p></td>
                    <td align="center"><p>${name.eventDate}</p></td>
                    <td align="center"><p>${name.eventAddress}</p></td>
                    <td align="center"><p>${name.eventDescription}</p></td>
                    <td align="center"><p>${name.eventHours}</p></td>
                    <td align="center"><p>${name.eventPrice}</p></td>
                    <td align="center"><p><g:actionSubmit value="Edit Event" action="edit" /></p></td>
                </tr>

                <g:hiddenField name="id" value="${name.id}" />
            </g:form>

            <g:form action="delete">
                <tr>
                    <td align="center"><p>${name.eventName}</p></td>
                    <td align="center"><p>${name.eventType}</p></td>
                    <td align="center"><p>${name.eventDate}</p></td>
                    <td align="center"><p>${name.eventAddress}</p></td>
                    <td align="center"><p>${name.eventDescription}</p></td>
                    <td align="center"><p>${name.eventHours}</p></td>
                    <td align="center"><p>${name.eventPrice}</p></td>
                    <td align="center"><p><g:actionSubmit value="Delete Event" onclick="return confirm('Are you sure?')" action="delete" /></p></td>
                </tr>

                <g:hiddenField name="id" value="${name.id}" />
            </g:form>
        </g:each>
    </table>
    <br>
    <g:link action="newPersonForm">Add another event</g:link>
</g:else>

%{--Unapproved Events List--}%

<h1>Unapproved Events:</h1>

<g:if test="${events.empty}">
    <p>There is nothing going on right now! <g:link action="addactivities">Add an event</g:link></p>
</g:if>

<g:else>
    <table style="width:70%">
        <g:each var="name" in="${events}">

            <g:form action="edit">
                <tr>
                    <td align="center"><p>${name.eventName}</p></td>
                    <td align="center"><p>${name.eventType}</p></td>
                    <td align="center"><p>${name.eventDate}</p></td>
                    <td align="center"><p>${name.eventAddress}</p></td>
                    <td align="center"><p>${name.eventDescription}</p></td>
                    <td align="center"><p>${name.eventHours}</p></td>
                    <td align="center"><p>${name.eventPrice}</p></td>
                    <td align="center"><p><g:actionSubmit value="Edit Event" action="edit" /></p></td>
                </tr>

                <g:hiddenField name="id" value="${name.id}" />
            </g:form>

            <g:form action="delete">
                <tr>
                    <td align="center"><p>${name.eventName}</p></td>
                    <td align="center"><p>${name.eventType}</p></td>
                    <td align="center"><p>${name.eventDate}</p></td>
                    <td align="center"><p>${name.eventAddress}</p></td>
                    <td align="center"><p>${name.eventDescription}</p></td>
                    <td align="center"><p>${name.eventHours}</p></td>
                    <td align="center"><p>${name.eventPrice}</p></td>
                    <td align="center"><p><g:actionSubmit value="Delete Event" onclick="return confirm('Are you sure?')" action="delete" /></p></td>
                </tr>

                <g:hiddenField name="id" value="${name.id}" />
            </g:form>
        </g:each>
    </table>
    <br>
    <g:link action="newPersonForm">Add another event</g:link>
</g:else>

</body>
</html>