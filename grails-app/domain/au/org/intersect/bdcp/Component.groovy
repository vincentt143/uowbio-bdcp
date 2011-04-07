package au.org.intersect.bdcp

class Component {
	
	String name
	String description

	static belongsTo = [study:Study]
	
	static hasMany = [sessions:Session]
    static constraints = {
		name(blank:false)
		description(blank:false)
    }
}
