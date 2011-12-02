dataSource
{
	pooled = true
	driverClassName = "org.postgresql.Driver"
}
hibernate
{
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development
	{
		dataSource
		{
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			driverClassName = "org.hsqldb.jdbcDriver"
			url = "jdbc:hsqldb:mem:devDB"
//			//url = "jdbc:hsqldb:file:devDB;shutdown=true"
//			username = "sa"
//			password = ""
			
//			dbCreate = "create-drop"
//			url = "jdbc:postgresql://localhost:5432/bdcp-test"
//			driverClassName = "org.postgresql.Driver"
//			username = "grails"
//			password = "grails"
		}
	}
	test
	{
		dataSource
		{
			dbCreate = "create-drop"
			jndiName = "java:comp/env/biomechDataSource"
			dialect='org.hibernate.dialect.Oracle10gDialect'
		}
	}
	
	cucumber
	{
		dataSource
		{
			dbCreate = "create-drop"
			url = "jdbc:postgresql://localhost:5432/bdcp-test"
			driverClassName = "org.postgresql.Driver"
			username = "grails"
			password = "grails"
		}
	}

	production
	{
//		dataSource
//		{
//			dbCreate = "create-drop" //"update"
//			url = "jdbc:postgresql://localhost:5432/bdcp-prod"
//			driverClassName = "org.postgresql.Driver"
//			username = "bdcp"
//			password = "bdcp"
//		}
		
//		dataSource {
//			pooled = true
//			dbCreate = "create-drop"
//			url = "jdbc:oracle:thin:@sirona.its.uow.edu.au:1521:nuitdev"
//			driverClassName = "oracle.jdbc.driver.OracleDriver"
//			username = "INTERSECT_DATA"
//			password = "c00l5tart"
//			dialect='org.hibernate.dialect.Oracle10gDialect'
//			// INTERSECT_APP -> zn79zt91
//			}
		
		dataSource 
		{
			dbCreate = "update"
			jndiName = "java:comp/env/biomechDataSource"
			dialect='org.hibernate.dialect.Oracle10gDialect'
		}

	}

	intersect_test
	{
		dataSource
		{
			dbCreate = "create-drop"
			url = "jdbc:postgresql://localhost:5432/bdcp-prod"
			driverClassName = "org.postgresql.Driver"
			username = "bdcp"
			password = "bdcp"
		}
	}

	intersect_demo
	{
		dataSource
		{
			dbCreate = "update"
			url = "jdbc:postgresql://localhost:5432/bdcp-prod"
			driverClassName = "org.postgresql.Driver"
			username = "bdcp"
			password = "bdcp"
		}
	}

}
