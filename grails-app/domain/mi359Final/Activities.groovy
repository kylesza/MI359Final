package mi359Final

class Activities {
    String activityName
    int activityPrice
    int activityType
    String startDate
    String endDate
    String activityDescription
    double lat
    double lng
    boolean approved

    static constraints = {
        activityName(blank: false, nullable: true)
        activityPrice(blank: false, nullable: true)
        activityType(blank: true, nullable: true)
        activityDescription(blank: true)
    }
}
