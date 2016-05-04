<%--
  Created by IntelliJ IDEA.
  User: mattjuszczyk
  Date: 5/4/16
  Time: 11:41 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h1>Update ${user.username}'s Role</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <b>Role:</b>
            <g:form controller="browseUsers" action="saveNewRole">
                <g:radioGroup id="" name="newRole"
                              labels="['Admin','Business','User']"
                              values="[1,2,3]">
                    <p>${it.label} ${it.radio} ${it.value}</p>
                </g:radioGroup>
                <g:hiddenField name="userID" value="${user.id}"></g:hiddenField>
                <g:submitButton name="Submit" value="Submit"></g:submitButton>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>