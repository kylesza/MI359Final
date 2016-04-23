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
        if (e.save()){ // if save was successful:
            render(text: "../findActivities/index", contentType: "text/xml", encoding: "UTF-8")
        } else { // Save failed:
            // Make empty array to add all errors to:
            def errors = []

            // Loop through errors adn add each to the array
            for(int i; i < e.errors.errorCount; i++){
                errors.add(i, e.errors.getFieldError().defaultMessage)
                // Right now, this is just the default message so not helpful at all
                // Just comes out as something like
                // 'Property [{0}] of clas [{1}] cannot be blank.'
                // But it's at least something
            }

            // Return the text from errors array to be displayed on page:
            render(text: "${errors}", contentType: "text/xml", encoding: "UTF-8")
        }
    }
}
