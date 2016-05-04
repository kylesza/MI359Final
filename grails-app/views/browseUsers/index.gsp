<div class="container" style="padding-left: 75px; padding-right: 75px; width: auto;">
    <g:if test="${users.empty}">
        <p>There are currently no users in the database</p>
    </g:if>
    <g:else>
        <table class="table table-hover text-center">
            <caption>Users</caption>

            <thead>
            <tr>
                <th style="text-align: center;">Username</th>
                <th style="text-align: center;"></th>
                <th style="text-align: center;">Delete User</th>
            </tr>
            </thead>

            <tbody>
            <g:each in="${users}">
                <tr>
                    <td>${it.username}</td>
                    <td>
                        <g:form action="updateRole">
                            <g:hiddenField name="userID" value="${it.id}"/>
                            <g:submitButton name="Update User Role"></g:submitButton>
                        </g:form>
                    </td>
                    <td>
                        <g:form action="deleteUser">
                            <g:hiddenField name="userID" value="${it.id}"/>
                            <g:submitButton name="Delete"></g:submitButton>
                        </g:form>
                    </td>
                </tr>

            </g:each>
            </tbody>

        </table>
    </g:else>
</div>