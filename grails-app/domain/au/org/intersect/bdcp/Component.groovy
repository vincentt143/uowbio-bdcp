package au.org.intersect.bdcp

class Component {
	
	String name
	String description

	static belongsTo = [study:Study]
	
    static constraints = {
    }
}
