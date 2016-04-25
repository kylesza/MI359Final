package mi359final

import mi359Final.Activities

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
            render(view: 'selectImage', model: [user: user])
            return
        }

        // Save the image and mime type
        user.avatar = f.bytes
        user.avatarType = f.contentType
        log.info("File uploaded: $user.avatarType")

        // Validation works, will check if the image is too big
        if (!user.save()) {
            render(view: 'selectImage', model: [user: user])
            return
        }
        flash.message = "Image (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
        redirect(action: 'show')
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
        def list() {
            def activities = Activities.list()
            [activities: activities]
        }

        // This runs after user clicks "Submit" button on views/addActivities/index.gsp
        // Working on Constraints
        def saveEvent() {
            // Define a new event:
            def e = new Activities(activityDescription: params.activityDescription, activityName: params.activityName,
                    activityPrice: params.activityPrice, activityType: params.activityType, lat: params.lat, lng: params.lng, approved: params.approved)

            // Save new event:
            if (e.save()) { // if save was successful:
                render(text: "../findActivities/index", contentType: "text/xml", encoding: "UTF-8")
            } else { // Save failed:
                // Make empty array to add all errors to:
                def errors = []

                // Loop through errors adn add each to the array
                for (int i; i < e.errors.errorCount; i++) {
                    errors.add(i, e.errors.getFieldError().defaultMessage)
                    // Right now, this is just the default message so not helpful at all
                    // Just comes out as something like
                    // 'Property [{0}] of clas [{1}] cannot be blank.'
                    // But it's at least something
                }

                // Return the text from errors array to be displayed on page:
                render(text: "${errors}", contentType: "text/xml", encoding: "UTF-8")
            }
        }
    }
