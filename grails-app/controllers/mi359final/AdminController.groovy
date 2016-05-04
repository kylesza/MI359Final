package mi359final


import mi359Final.Activities

import mi359Final.UserRole
import mi359Final.User
import mi359Final.Role

class AdminController {

    def springSecurityService


    def index() {
        def activities = Activities.list()
        [activities:activities]
    }

    def deleteActivity() {
        def x = Activities.get(params.activityID as int)
        x.delete()
        redirect(action:"index")

    }

    def addActivity() {
        def x = Activities.get(params.activityID as int)
        x.approved = true
        redirect(action:"index")
    }

    def signup(){

    }

    def createUser() {
        def userRole = new Role('ROLE_USER').save()
        def user = new User(params.username as String, params.password as String).save()
        UserRole.create user, userRole
        springSecurityService.reauthenticate(user.username)
        redirect(controller: "findActivities", action: "index")
    }
}
