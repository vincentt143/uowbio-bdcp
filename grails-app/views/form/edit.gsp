

<%@ page import="au.org.intersect.bdcp.Form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'form.label', default: 'Form')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${formInstance}">
            <div class="errors">
                <g:renderErrors bean="${formInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${formInstance?.id}" />
                <g:hiddenField name="version" value="${formInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="form.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: formInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${formInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="link"><g:message code="form.link.label" default="Link" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: formInstance, field: 'link', 'errors')}">
                                    <g:textField name="link" value="${formInstance?.link}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="participantForms"><g:message code="form.participantForms.label" default="Participant Forms" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: formInstance, field: 'participantForms', 'errors')}">
                                    
<ul>
<g:each in="${formInstance?.participantForms?}" var="p">
    <li><g:link controller="participantForm" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="participantForm" action="create" params="['form.id': formInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'participantForm.label', default: 'ParticipantForm')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="participantIdentifier"><g:message code="form.participantIdentifier.label" default="Participant Identifier" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: formInstance, field: 'participantIdentifier', 'errors')}">
                                    <g:select name="participantIdentifier.id" from="${au.org.intersect.bdcp.ParticipantIdentifier.list()}" optionKey="id" value="${formInstance?.participantIdentifier?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
