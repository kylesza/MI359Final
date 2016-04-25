package mi359Final

class Activities {
    String activityName
    int activityPrice
    String activityDescription
    double lat
    double lng
    boolean approved

    static constraints = {
        activityName(blank: false, nullable: true)
        activityPrice(blank: false, nullable: true)
        activityType()
        activityDescription(blank: true)
    }
}
