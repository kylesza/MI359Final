package mi359final

class AddActivitiesController {

    def index() {}

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    def uploadImage() {
        def user = springSecurityService.currentUser // or however you select the current user

        // Get the avatar file from the multi-part request
        def f = request.getFile('image')

        // List of OK mime-types
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Image must be one of: ${okcontents}"
            render(view:'selectImage', model:[user:user])
            return
        }

        // Save the image and mime type
        user.avatar = f.bytes
        user.avatarType = f.contentType
        log.info("File uploaded: $user.avatarType")

        // Validation works, will check if the image is too big
        if (!user.save()) {
            render(view:'selectImage', model:[user:user])
            return
        }
        flash.message = "Image (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
        redirect(action:'show')
    }

    def image() {
        def avatarUser = mi359Final.User.get(params.id)
        if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = avatarUser.avatarType
        response.contentLength = avatarUser.avatar.size()
        OutputStream out = response.outputStream
        out.write(avatarUser.avatar)
        out.close()
    }
}
