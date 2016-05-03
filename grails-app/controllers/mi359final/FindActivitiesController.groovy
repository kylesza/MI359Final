package mi359final

import mi359Final.Activities

class FindActivitiesController {

    def index() {
        def activities = Activities.list(params)
        [activities:activities]


    }
//
//    def search = {
//        render(view:'search')
//    }
//
//    def searchResults = {
//        def activitySearch = Activities.list(params)
//        def results = Activities.list(params) {
//            if(params?.nameSearch) {
//                ilike("title", "%${params.activityName}%")
//            }
//        }
//        render(view:'search', model:['results':results,
//                                     'title':params?.nameSearch,
////                                     'startTime':params?.startTime])
//                )
//    }

}
