<
<%@ page import="au.org.intersect.bdcp.Study" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'study.label', default: 'Study')}" />
        <g:javascript library="jquery" plugin="jquery"/>
   		<jqui:resources />
        <title><g:message code="default.showTitle.label" args="[studyInstance.studyTitle]" /></title>
        
    </head>
    <body>
           <div class="body" id="tab1"> 
            <h1><g:message code="default.showTitle.label" args="[studyInstance.studyTitle]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
    
	<ul id="tabnav">
	
		<li class="tab1"><a href="#tabs-details">Details</a></li>
		<li class="tab2"><a href="${createLink(mapping:'participantDetails', controller:'participant', action:'list', params:['studyId': studyInstance.id]) }" id="tabs-participants" name="#tabs-participants"><span>Participants</span></a></li>
		<li class="tab3"><a href="${createLink(mapping: 'componentDetails', controller:'component', action:'list', params:['studyId': studyInstance.id]) }" id="tabs-components" name="#tabs-components"><span>Components</span></a></li>
		<li class="tab4"><a href="${createLink(mapping: 'sessionFileList', controller:'sessionFile', action:'fileList', params:['studyId': studyInstance.id])}" id="tabs-files" name="tabs-files"><span>Files</span></a></li>
	    <li class="tab5"><a href="${createLink(mapping: 'studyDeviceDetails', controller:'studyDevice', action:'list', params:['studyId': studyInstance.id])}" id="tabs-files" name="tabs-files"><span>Devices</span></a></li>
	    <li class="tab6"><a href="${createLink(mapping: 'studyCollaborators', controller:'study', action:'listCollaborators', params:['studyId': studyInstance.id])}" id="tabs-collaborators" name="tabs-collaborators"><span>Collaborators</span></a></li>
    </ul>

	<div id="tabs-details">
	   <div class="dialog">
                <table id="studyTable">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.studyTitle.label" default="Study Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "studyTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.uowEthicsNumber.label" default="UOW Ethics Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "uowEthicsNumber")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.hasAdditionalEthicsRequirements.label" default="Additional Ethics Requirements" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "hasAdditionalEthicsRequirements")}</td>
                            
                        </tr>
                        <g:if test="${studyInstance?.hasAdditionalEthicsRequirements?.equals('Yes')}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.additionalEthicsRequirements.label" default="Additional Ethics Details" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "additionalEthicsRequirements")}</td>
                            
                        </tr>
                        </g:if>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.industryPartners.label" default="Industry Partners" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "industryPartners")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.collaborators.label" default="Collaborators" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "collaborators")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/yyyy" date="${studyInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/yyyy" date="${studyInstance?.endDate}" /></td>
                            
                        </tr>
                        
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="study.numberOfParticipants.label" default="Number of Participants" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "numberOfParticipants")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="study.inclusionExclusionCriteria.label" default="Inclusion Exclusion Criteria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studyInstance, field: "inclusionExclusionCriteria")}</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${studyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" id="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
	</div>
	</div> 
    </body>
</html>
