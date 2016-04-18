package mi359final

import mi359Final.Activities

class AddActivitiesController {

    def index() {}
    def list() {
        def activities = Activities.list()
        [activities:activities]
    }
    def saveEvent () {
        def e = new Activities(activityDescription: params.activityDescription, activityName: params.activityName,
                activityPrice: params.activityPrice, activityType: params.activityType, lat: params.lat, lng: params.lng)
        if (e.save()){
            println params
            // redirect to List of activities.
        }
        else {
            // Print some errors here, probably
        }
    }
}
