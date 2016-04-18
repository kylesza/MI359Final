<%--
  Created by IntelliJ IDEA.
  User: mattjuszczyk
  Date: 4/18/16
  Time: 3:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <ul>
        <g:each var="i" in="${activities}">
            <li>Name: ${i.activityName}</li>
        </g:each>
    </ul>
</body>
</html>