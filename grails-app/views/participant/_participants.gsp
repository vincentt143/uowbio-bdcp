            
            <br />
            <span class="menuButton"><g:link mapping="participantDetails" controller="participant" class="create" action="create" params="[studyId: studyInstance.id]">
        	Add Participant</g:link></span>
        	<br />
        	<br />
           <g:if test="${ participantInstanceTotal > 0}">
           <div class="list">
                <table>
                
                    <thead>        
                        <tr>
                          <th class="tablename">${message(code: 'participant.identifier.label', default: 'Participant ID')}</th>
                        	<th class="tablebuttons"></th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    <g:each in="${participantInstanceList}" status="i" var="participantInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td class="tablename">
                              <div class="columnLeft">${fieldValue(bean: participantInstance, field: "identifier")}</div>
                            </td>
                            <td class="tablebuttons">
                             <g:link mapping="participantDetails" elementId="edit-participant[${i}]" class="button" controller="participant" action="edit" params="[studyId: studyInstance.id, id: participantInstance.id]">Edit</g:link>
                             <g:link elementId="forms[${i}]" class="button" mapping="participantFormDetails" controller="participantForm" action="list" params="[studyId: studyInstance.id, participantId: participantInstance.id]">Forms</g:link>
                           </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
           </g:if>
           