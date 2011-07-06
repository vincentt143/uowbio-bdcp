
<%@ page import="au.org.intersect.bdcp.DeviceField" %>
<%@ page import="au.org.intersect.bdcp.enums.FieldType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deviceField.label', default: 'DeviceField')}" />
        <title>${deviceInstance.name} Details Template</title>
    </head>
    <body>
        <div class="body">
            <h1>${deviceInstance.name} Details Template</h1>
            <br />
            <g:link elementId="Add Field" mapping="deviceFieldDetails" class="create" class="button" action="create" params="[deviceGroupId: params.deviceGroupId, deviceId: params.deviceId]">Add Field</g:link>
            <br />
            <br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${deviceFieldInstanceList?.size() > 0}">
            <div class="list">
                <table id="listTable">
                    <thead>
                        <tr>
                        
                            <th>${message(code: 'deviceField.fieldLabel.label', default: 'Field Label')}</th>
                        
                            <th>${message(code: 'deviceField.fieldType.label', default: 'Field Type')}</th>
                        
                            <th>${message(code: 'deviceField.mandatory.label', default: 'Mandatory')}</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deviceFieldInstanceList}" status="i" var="deviceFieldInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: deviceFieldInstance, field: "fieldLabel")}</td>

                            <td><g:message code="deviceField.fieldType.${deviceFieldInstance?.fieldType?.getName()}" />
                            <g:if test="${deviceFieldInstance?.fieldType == FieldType.STATIC_TEXT}"
                            ><g:link elementId="edit_${i}" mapping="deviceFieldDetails" action="edit" class="button" id="${deviceFieldInstance?.id}"
                             params="[deviceGroupId: deviceFieldInstance.device.deviceGroup.id, deviceId: deviceFieldInstance.device.id]">Edit</g:link
                             ></g:if>
                            <g:if test="${[FieldType.DROP_DOWN, FieldType.RADIO_BUTTONS].contains(deviceFieldInstance?.fieldType)}"
                            ><g:link elementId="show[${i}]" mapping="deviceFieldDetails" action="show" class="button" id="${deviceFieldInstance?.id}"
                             params="[deviceGroupId: deviceFieldInstance.device.deviceGroup.id, deviceId: deviceFieldInstance.device.id]">Show</g:link
                             ></g:if>
                             </td>
                             <td>${fieldValue(bean: deviceFieldInstance, field: "mandatory")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            </g:if>
            <br />
            <g:link mapping="deviceDetails" class="list" class="button" action="list" params="[deviceGroupId: params.deviceGroupId]">Return to Device List</g:link>
        </div>
    </body>
</html>
