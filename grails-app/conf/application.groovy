grails.databinding.convertEmptyStringsToNull = false

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.userLookup.userDomainClassName = 'mi359Final.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'mi359Final.UserRole'
grails.plugin.springsecurity.authority.className = 'mi359Final.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
    [pattern: '/account/**',     access: ['permitAll']],
    [pattern: '/addActivities/**',     access: ['permitAll']],
    [pattern: '/findActivities/**',     access: ['permitAll']],
    [pattern: '/browseUsers/**',     access: ['permitAll']],
    [pattern: '/admin/**',     access: ['permitAll']],
    [pattern: '/events/**',     access: ['permitAll']],
	[pattern: '/auth.gsp',		access: ['permitAll']]


]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

