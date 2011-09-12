	<ul id="tabnav">
		<li class="tab1"><a href="${tab == 'tab1' ? '#tabs-details' : createLink(mapping: 'studyDetails', controller:'study', action:'show', params:['id': studyInstance.id, 'projectId':studyInstance.project.id]) }" id="tabs-details" name="#tabs-details"><span>Details</span></a></li>
		<li class="tab2"><a href="${tab == 'tab2' ? '#tabs-details' : createLink(mapping: 'participantDetails', controller:'participant', action:'list', params:['studyId': studyInstance.id]) }" id="tabs-participants" name="#tabs-participants"><span>Participants</span></a></li>
		<li class="tab3"><a href="${tab == 'tab3' ? '#tabs-details' : createLink(mapping: 'componentDetails', controller:'component', action:'list', params:['studyId': studyInstance.id]) }" id="tabs-components" name="#tabs-components"><span>Components</span></a></li>
	    <li class="tab5"><a href="${tab == 'tab5' ? '#tabs-details' : createLink(mapping: 'studyDeviceDetails', controller:'studyDevice', action:'list', params:['studyId': studyInstance.id])}" id="tabs-files" name="tabs-files"><span>Devices</span></a></li>
	    <li class="tab6"><a href="${tab == 'tab6' ? '#tabs-details' : createLink(mapping: 'studyCollaborators', controller:'study', action:'listCollaborators', params:['studyId': studyInstance.id])}" id="tabs-collaborators" name="tabs-collaborators"><span>Collaborators</span></a></li>
		<li class="tab4"><a href="${tab == 'tab4' ? '#tabs-details' : createLink(mapping: 'sessionFileList', controller:'sessionFile', action:'fileList', params:['studyId': studyInstance.id])}" id="tabs-files" name="tabs-files"><span>Files</span></a></li>
	    <li class="tab7"><a href="${tab == 'tab7' ? '#tabs-details' : createLink(mapping: 'studyAnalysedData', controller:'studyAnalysedData', action:'list', params:['studyId': studyInstance.id])}" id="tabs-files" name="tabs-files"><span>Analysed data</span></a></li>
    </ul>
