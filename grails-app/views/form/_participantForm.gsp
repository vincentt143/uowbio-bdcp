<div id="participantForm${i}" class="participantForm-div" <g:if test="${hidden}">style="display:none;"</g:if>>
<g:hiddenField name='participantFormsList[${i}].id' value='${participantForm?.id}'/>
<g:hiddenField name='participantFormsList[${i}].deleted' value='false'/>
<g:hiddenField name='participantFormsList[${i}].new' value="${participantForm?.id == null?'true':'false'}"/>
<td><g:textField name="name" value = "" /></td>
                        
<td><g:textField name='participantFormsList[${i}].participantForm' value='${participantForm?.name}' />   
<span class="del-participantForm">
<img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
	style="vertical-align:middle;"/>
</span>
<span class="add-participantForm">
<img src="${resource(dir:'images/skin', file:'database_add.png')}" style="vertical-align:middle;" onclick="addParticipantForm();" />
</span>
</div>