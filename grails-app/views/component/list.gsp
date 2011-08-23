
<%@ page import="au.org.intersect.bdcp.Component" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <meta name="layout" content="main" />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
   		<jqui:resources />
        <g:set var="entityName" value="${message(code: 'component.label', default: 'Component')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    
    </head>
    <body>
       <div class="body" id="tab3">

            <h1><g:message code="default.showTitle.label" args="[studyInstance.studyTitle]" /></h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        <div id="component">
        
        <g:render template="/study/tabs" model="${[studyInstance:studyInstance, tab:'tab3']}" />
        
        <br />
        <span class="menuButton"><g:link elementId="createComponent" mapping="componentDetails" controller="component" class="create" action="create" params="[studyId: studyInstance.id]">Add Component</g:link></span>
            <br />
            <br />
            <g:if test="${ componentInstanceTotal > 0}">
            
            
            <div class="projects">
            	<g:each in="${componentInstanceList}" status="i" var="componentInstance">
                        
                	<span class="component_title">
                		${fieldValue(bean: componentInstance, field: "name")} 
                		- 
                		${fieldValue(bean: componentInstance, field: "description")}
                		
                		<g:link mapping="componentDetails" elementId="edit-component[${i}]" class="button" controller="component" action="edit" params="[studyId: params.studyId, id: componentInstance.id]">Edit</g:link>
                		
            		</span>
                            
                    
                             
                    <ul>
                    	<g:each in="${componentInstance.getSessionsList()}" status="n" var="sessionInstance">
	                        <li>
	                        	${fieldValue(bean: sessionInstance, field: "name")} 
	                        	- 
	                        	${fieldValue(bean: sessionInstance, field: "description")} 
	                        	<g:link mapping="sessionDetails" elementId="edit-session[${n}]" class="button" controller="session" action="edit" params="[studyId: params.studyId, id: sessionInstance.id,componentId: componentInstance.id]">Edit</g:link> 
	                        </li>                        
                    	</g:each>
                    	
                    	<li>
                    		<span class="menuButton">
                    			<g:link elementId="createSession[${i}]" mapping="sessionDetails" controller="session" class="create" action="create" params="[studyId: studyInstance.id, componentId: componentInstance.id]">Add Session</g:link>
                    		</span>
                    	</li>
                    </ul>
                    
                    </g:each>
            </div>
            </g:if>
            </div>
            </div>
            </div>
    </body>
</html>
