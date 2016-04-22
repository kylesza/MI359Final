package mi359final

import mi359Final.Activities


class FindActivitiesController {

    def index() {
        def activities = Activities.list()
        [activities: activities]
    }

}
