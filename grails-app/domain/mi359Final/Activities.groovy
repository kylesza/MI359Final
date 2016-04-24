package mi359Final

class Activities {
    String activityName
    int activityPrice
    int activityType
    String activityDescription
    double lat
    double lng

    static constraints = {
        activityName(blank: false, nullable: true)
        activityPrice(blank: false, nullable: true)
        activityType()
        activityDescription(blank: true)
    }
}
