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
        // Figure out event type:
        def eventType = ''
        if (params.activityType == '1') {
            eventType = 'Sports and Exercise'
        }
        else if (params.activityType == '2') {
            eventType = 'Food and Drink'
        }
        else if (params.activityType == '3') {
            eventType = 'Film'
        }
        else if (params.activityType == '4') {
            eventType = 'Music'
        }
        else if (params.activityType == '5') {
            eventType = 'Outdoor'
        }

        // Define a new event:
        def e = new Activities(activityDescription: params.activityDescription, activityName: params.activityName,
                activityPrice: params.activityPrice, activityType: eventType, lat: params.lat,
                lng: params.lng, approved: params.approved, startDate: params.startDate, endDate: params.endDate)

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
