import mi359Final.User
import mi359Final.UserRole
import mi359Final.Role
import mi359Final.Activities

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()

        def admin = new User('admin', '1').save()
        UserRole.create admin, adminRole

        def user = new User('user','1').save()
        UserRole.create user, userRole

        def user2 = new User('user2','2').save()
        UserRole.create user2, userRole

        def user3 = new User('user3','3').save()
        UserRole.create user3, userRole

        def activity = new Activities(activityDescription: 'Charity 3 Vs. 3 Basketball this saturday at IM West!', activityName: 'Basketball',
                activityPrice: 4, activityType: 'Sports and Exercise', lat: 42.728901, lng: -84.487098, approved: true, startDate: '04/21/2016', endDate: '04/21/2016')
        activity.save()

        def activity2 = new Activities(activityDescription: 'Come on over and enjoy a fun afternoon of friendly football!', activityName: 'Football',
                activityPrice: 0, activityType: 'Outdoor', lat: 42.737454, lng: -84.493284, approved: true, startDate: '05/17/2016', endDate: '05/21/2016')
        activity2.save()

        def activity3 = new Activities(activityDescription: 'Come out and support the MSU hockey team this friday at 8pm!', activityName: 'Hockey',
                activityPrice: 10, activityType: 'Sports and Exercise', lat: 42.725607, lng: -84.487788, approved: true, startDate: '05/17/2016', endDate: '05/19/2016')
        activity3.save()

        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
