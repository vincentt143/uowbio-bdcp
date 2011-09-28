
<%@ page import="au.org.intersect.bdcp.Study" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'study.label', default: 'Study')}" />
        <g:set var="jstreeTheme" value="${resource(dir:'plugins/js-tree-0.2/js/jstree_pre1.0_stable/themes/classic',file:'style.css')}" />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
        <jsTree:resources />
   		<jqui:resources />
        <title><g:message code="default.list.label" args="[entityName]" /> - Analysed data</title>
    </head>
    <body>
    <div class="body" id="tab7"> 
            <h1><g:message code="default.showTitle.label" args="[studyInstance.studyTitle]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
    
    <g:render template="/study/tabs" model="${[studyInstance:studyInstance, tab:'tab7']}" />

	<div id="tabs-details">
	<g:link mapping="studyAnalysedData" controller="studyAnalysedData" class="create button" action="createFolder" params="[studyId: studyInstance.id]">+ Add Folder</g:link>
	<g:if test="${ folders.size() > 0}">
	  <div class="list">
	    <table>
	      
	      <tbody>
	        <g:each in="${folders}" status="i" var="analysedFolder">
	          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	            <td>
	              <div id="SA_${analysedFolder.id}"></div>
	              <g:if test="${analysedFolder.studyAnalysedDataFields?.size() > 0}">
	              <a id="SAV_${analysedFolder.id}">View metadata</a>
	              </g:if>
	            </td>
	            <td class="tablebuttons" valign="top">
	              <g:link mapping="studyAnalysedData" elementId="edit-participant[${i}]" class="button right list" action="editData" params="[studyId: studyInstance.id, folder:analysedFolder.folder]">Upload</g:link>
	             </td>	             
	          </tr>
	        </g:each>
	      </tbody>
	      
	    </table>
	  </div>
	</g:if>
	</div>
	</div>
	<script type="text/javascript">
	var globId = 1;
	// TODO: watch out for single and double quotes in folder name !!!
	var $node = null;
    <g:each in="${folders}" status="i" var="analysedFolder">
       $node = $('#SA_${analysedFolder.id}');
       $node.jstree({
           'core': {
               },
           'json_data' : {
               'ajax' : {
                   'url' : function(node) {
                	   var topId = ${analysedFolder.id};
                       var folderPath = node == -1 ? '' : $(node).data('folderPath');
                       return "listFolder?id=" + topId + '&folderPath=' + folderPath;
                    },
                   'success': function(response) {
                       if (response != null && response.error == null) { return response; }
                       alert('Error:' + response.error);
                       return null;
                   },
                   'error': function(request, textStatus, errorThrown) {
                       alert('Cannot access folder or folder empty.')
                   }
               }
           },
           "themes": {
			   "url" : '${jstreeTheme}',               
               "theme": "classic"
           },
           'plugins' : [ "themes", "json_data" ]
           })
       $node = $('#SAV_${analysedFolder.id}');
       $node.click(function() {alert('View metadata')});
    </g:each>
	</script>           
    </body>
</html>
