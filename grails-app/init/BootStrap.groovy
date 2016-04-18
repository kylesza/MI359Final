import mi359Final.User
import mi359Final.UserRole
import mi359Final.Role

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()

        def admin = new User('admin', '1').save()
        UserRole.create admin, adminRole

        def user = new User('user','1').save()
        UserRole.create user, userRole


        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
