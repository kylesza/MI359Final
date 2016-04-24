<div class="container" style="padding-left: 75px; padding-right: 75px; width: auto;">
    <g:if test="" test="${activities.empty}">
        <p>There are currently no Events</p>
    </g:if>
    <g:else>
        <table class="table table-hover text-center">
            <caption>Unapproved Events</caption>
            <thead>
                <tr>
                    <th style="text-align: center">Activity Name</th>
                    <th style="text-align: center">Price</th>
                    <th style="text-align: center">Type</th>
                    <th style="text-align: center">Description</th>
                    <th style="text-align: center">Action</th>
                </tr>
            </thead>

            <tbody>
            <g:each in="${activities}">
                <g:if test="${!it.approved}">
                    <tr>
                        <td>${it.activityName}</td>
                        <td>${it.activityPrice}</td>
                        <td>${it.activityType}</td>
                        <td>${it.activityDescription}</td>
                        <td>
                            <g:form action="deleteActivity">
                                <g:hiddenField name="activityID" value="${it.id}"/>
                                <g:submitButton style="margin-bottom: 5px" name="Delete"></g:submitButton>
                            </g:form>
                            <g:form action="addActivity">
                                <g:hiddenField name="activityID" value="${it.id}"/>
                                <g:submitButton name="Approve"></g:submitButton>
                            </g:form>
                        </td>
                    </tr>
                </g:if>
            </g:each>
            </tbody>

        </table>


        <table style="margin-top: 100px" class="table table-hover text-center">
            <caption>Approved Events</caption>
            <thead>
            <tr>
                <th style="text-align: center">Activity Name</th>
                <th style="text-align: center">Price</th>
                <th style="text-align: center">Type</th>
                <th style="text-align: center">Description</th>
                <th style="text-align: center">Guest List</th>
            </tr>
            </thead>

            <tbody>
            <g:each in="${activities}">
                <g:if test="${it.approved}">
                    <tr>
                        <td>${it.activityName}</td>
                        <td>${it.activityPrice}</td>
                        <td>${it.activityType}</td>
                        <td>${it.activityDescription}</td>
                        <td><a href="#">View</a></td>
                    </tr>
                </g:if>
            </g:each>
            </tbody>

        </table>
    </g:else>

</div>