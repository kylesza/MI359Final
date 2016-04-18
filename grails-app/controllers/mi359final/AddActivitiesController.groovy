package mi359final

import mi359Final.Activities

class AddActivitiesController {

    def index() {}
    def list() {
        def activities = Activities.list()
        [activities:activities]
    }

    // This runs after user clicks "Submit" button on views/addActivities/index.gsp
    // Working on Constraints
    def saveEvent () {
        // Define a new event:
        def e = new Activities(activityDescription: params.activityDescription, activityName: params.activityName,
                activityPrice: params.activityPrice, activityType: params.activityType, lat: params.lat, lng: params.lng)

        // Save new event:
        if (e.save()){ // if save was successfull:
            render(text: "list", contentType: "text/xml", encoding: "UTF-8")
        } else { // Save failed:
            render(text: "index", contentType: "text/xml", encoding: "UTF-8")
        }
    }
}
