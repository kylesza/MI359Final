package mi359final

import mi359Final.User
import mi359Final.UserRole

class BrowseUsersController {

    def index() {
        def users = User.list()
        [users:users]
    }

    def deleteUser() {
        def x = User.get(params.userID as int)
        def userRoles = UserRole.findAllByUser(x)
        userRoles*.delete()
        x.delete()
        redirect(action:"index")
    }
}
