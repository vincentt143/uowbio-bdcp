
<%@ page import="au.org.intersect.bdcp.ParticipantForm" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'participantForm.label', default: 'ParticipantForm')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        <span class="button"><g:link elementId="return" mapping="participantDetails" controller="participant" action="list" params="[studyId: params.studyId]">Return to Participants</g:link></span>
        </div>
        <div class="body">
            <h1>Participant ${participantInstance}</h1>
            <h2>Forms</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="formName" title="${message(code: 'participantForm.formName.label', default: 'Form Name')}" />
                        
                            <g:sortableColumn property="form" title="${message(code: 'participantForm.link.label', default: 'Form')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${participantFormInstanceList}" status="i" var="participantFormInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                            <td><g:if test="${participantFormInstanceList}" ><g:link action="downloadFile" mapping="participantFormDetails" params="[studyId: params.studyId, participantId: params.participantId]" id="${participantFormInstance.id}" >${fieldValue(bean: participantFormInstance, field: "formName")}</g:link></g:if></td>
                        
							<td>${participantFormInstance?.form}</td>
                        
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${participantFormInstanceTotal}" mapping="participantFormDetails" params="[studyId: params.studyId, participantId: params.participantId]"/>
            </div>
           <g:render template="create" />
        </div>
    </body>
</html>
