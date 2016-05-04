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

//    static mapping = {
//        sort activityName: "asc"
//    }

    static constraints = {
        activityName(blank: false, nullable: true)
        activityPrice(blank: false, nullable: true)
        activityType(blank: true, nullable: true)
        activityDescription(blank: true)
        startDate(blank:false, nullable:true, matches: "^((0?[13578]|10|12)(-|\\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\\/)((19)([2-9])(\\d{1})|(20)([01])(\\d{1})|([8901])(\\d{1}))|(0?[2469]|11)(-|\\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\\/)((19)([2-9])(\\d{1})|(20)([01])(\\d{1})|([8901])(\\d{1})))\$")
        endDate(blank:false, nullable:true, matches: "^((0?[13578]|10|12)(-|\\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\\/)((19)([2-9])(\\d{1})|(20)([01])(\\d{1})|([8901])(\\d{1}))|(0?[2469]|11)(-|\\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\\/)((19)([2-9])(\\d{1})|(20)([01])(\\d{1})|([8901])(\\d{1})))\$")
    }
}
