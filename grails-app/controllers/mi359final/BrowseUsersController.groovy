package mi359final

import mi359Final.User
import mi359Final.UserRole
import mi359Final.Role

class BrowseUsersController {

    def index() {
        def users = User.list()
        [users:users]
    }

    def updateRole() {
        def x = User.get(params.userID as int)
        [user:x]
    }

    def saveNewRole() {
        def x = User.get(params.userID as int)
        if (params.newRole == '1'){
            def adminRole = new Role('ROLE_ADMIN').save()
            redirect(action: 'index')
        }
        else if (params.newRole == '2'){
            def userRole = new Role('ROLE_BUSINESS').save()
        }
        else if (params.newRole == '3'){
            def userRole = new Role('ROLE_USER').save()
        }
    }

    def deleteUser() {
        def x = User.get(params.userID as int)
        def userRoles = UserRole.findAllByUser(x)
        userRoles*.delete()
        x.delete()
        redirect(action:"index")
    }
}
