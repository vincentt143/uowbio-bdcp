package au.org.intersect.bdcp

import grails.plugins.springsecurity.Secured
import au.org.intersect.bdcp.ldap.LdapUser



class AdminController {

    def emailNotifierService
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def index = {
		cache false 
		redirect(action: "accountAdmin", params: params) 
	}
	
	static transactional = true
    
    def allowedMethods = []

	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def create = {
		cache false
		def username
		if (params.username == null)
		{
			username = ""
		}
		else
		{
			username = params.username
		}
		return [username: username]
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def save = {
		cache false
		def accountStatus = "Failed"
		def user
		def email
		if (params.username != null)
		{
			LdapUser match = LdapUser.find(
				filter: "(uid=${params.username})")
			if (match !=  null)
			{
				email = match.mail
				user= new UserStore(username: params.username)
			}
			
		   
		}
		if (user!= null && user.save(flush:true))
		{
				accountStatus = "Successful"
				emailNotifierService.contactUser(user.username, email)
				render (view: "createStatus", model:[accountStatus: accountStatus, user: user ,username:params.username])
				session.firstName =  ""
				session.surname = ""
				session.userid = ""
		}
		else
		{
			accountStatus = "Failed"
			render (view: "createStatus", model:[accountStatus: accountStatus, user: user ,username:params.username])
		}
		
		
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def createStatus = {
		cache false
		
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def accountAdmin = {
        cache false
    }
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def search = {
		cache false
		def matches = []
		
		render(view: "search", model:[matches:matches])
	}
	
	private String normalizeValue(value)
	{
		value = value.replaceAll(/[^A-Za-z0-9-]/, '')
		return value
	}
	
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def listUsers = {
		cache false
		def hideDeactivatedUsers = (request.getParameter("hideDeactivatedUsers") =="value" ? true : false)   
		def message = (request.getParameter("flashMessage"))
		if (message != null)
		{
			flash.message = "${message}"
		}
		def matches = []
		 def activatedMatches = []
		 UserStore.list().each 
		 { 
			 matches <<LdapUser.find(filter: "(uid=${it?.username})")
			 if (!it?.deactivated)
			 {
				 activatedMatches <<LdapUser.find(filter: "(uid=${it?.username})")
			 }
		 }
		 def sortedMatches = matches.sort {x,y -> x.sn <=> y.sn}
		 def sortedActivatedMatches = activatedMatches.sort {x,y -> x.sn <=> y.sn}
		if (hideDeactivatedUsers)
		{
			render (view: "listUsers", model: [ matches: sortedActivatedMatches, hideUsers: hideDeactivatedUsers])
		}
		else
		{
			render (view: "listUsers", model: [ matches: sortedMatches, hideUsers: hideDeactivatedUsers])
		}
     }
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def edit = {
		cache false
		def match = LdapUser.find(filter: "(uid=${params.username})")
		def userStore = UserStore.findByUsername(params.username)
		render (view:"edit", model :[matchInstance: match, userInstance: userStore, hideUsers: params.hideUsers])
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def update = {
		cache false
		def match = LdapUser.find(filter: "(uid=${params.username})")
		def userInstance = UserStore.get(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {
					
					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userStore.label', default: 'UserStore')] as Object[], "Another user has updated this user while you were editing")
					render(view: "edit", model: [matchInstance:match, userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userStore.label', default: 'UserStore'), userInstance.username])}"
				if (!userInstance?.deactivated)
				{
					flash.message ="${userInstance.username} activated successfully"
				}
				else
				{
					flash.message="${userInstance.username} deactivated successfully"
				}
				redirect(action: "listUsers", params:["hideUsers":params.hideUsers])
			}
			else {
				render(view: "edit", model: [matchInstance:match, userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userStore.label', default: 'UserStore'), params.id])}"
		  redirect(action: "listUsers", params:["hideUsers":params.hideUsers])
		}
		
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def searchUsers = {
		cache false
		def matches = []
		if (params.firstName != null)
		{
			session.firstName = params.firstName
		}
		else
		{
			session.firstName = ""
		}
		if (params.surname != null)
		{
				session.surname = params.surname
		}
		else
		{
			session.surname=""
		}
		if (params.userid != null)
		{
				session.userid = params.userid
		}
		else
		{
			session.userid = ""
		}
		
		matches = LdapUser.findAll() {
			and {
					if (!session.userid?.isEmpty())
					{
						like "uid", "*" + normalizeValue(session.userid) + "*"
					}
					else
					{
						like "uid", "*"
					}
				}
			and{
				if (!session.surname?.isEmpty())
					{
						like "sn", "*" + normalizeValue(session.surname) + "*" 
					}
					else
					{
						like "sn", "*"
					}
			}
			and {
				if (!session.firstName?.isEmpty())
					{
						like "givenName", "*" + normalizeValue(session.firstName) +"*"
					}
					else
					{
						like "givenName", "*"
					}
			}
		}
		
		def sortedMatches = matches.sort{x,y -> x.getUserId() <=> y.getUserId()?: x.sn <=> y.sn ?: x.givenName <=> y.givenName}
		
		render (view: "search", model: [firstName: params.firstName, surname:params.surname, userid:params.userid, matches: sortedMatches])
	}
}

class listUserCommand 
{
	boolean showAllUsers
	
}
