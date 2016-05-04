package mi359final

import mi359Final.Activities


class EventsController {

    def index() {
        def activities = Activities.list()
        [activities: activities]
    }
}
