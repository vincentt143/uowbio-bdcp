

<%@ page import="au.org.intersect.bdcp.DeviceGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deviceGroup.label', default: 'DeviceGroup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${deviceGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${deviceGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="groupingName"><g:message code="deviceGroup.groupingName.label" default="Grouping Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceGroupInstance, field: 'groupingName', 'errors')}">
                                    <g:textField name="groupingName" value="${deviceGroupInstance?.groupingName}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                    <span class="button"><g:link elementId="cancel" action="list">Cancel</g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
