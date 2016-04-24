package mi359final

import mi359Final.Activities

class AdminController {

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
}
