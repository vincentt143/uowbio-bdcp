
<%@ page import="au.org.intersect.bdcp.Study" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <g:set var="imagesDir" value="${resource(dir:'images',file:'/')}" />
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
	<g:link elementId="createFolder" mapping="studyAnalysedData" controller="studyAnalysedData" class="create button" action="createFolder" params="[studyId: studyInstance.id]">+ Add Folder</g:link>
    <g:if test="${ folders.size() > 0}">
    <g:form action="downloadFiles" controller="studyAnalysedData" mapping="studyAnalysedData" params="[studyId: studyInstance.id]">
      <div class="list">
        <table>
         
          <tbody>
            <g:each in="${folders}" status="i" var="analysedFolder">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>
                  <div id="SA_${analysedFolder.id}"></div>
                  <g:if test="${analysedFolder.studyAnalysedDataFields?.size() > 0}">
                  	<a id="SAV_${analysedFolder.id}" style="cursor:pointer;">View metadata</a>
                  </g:if>
                </td>
                <td class="tablebuttons" valign="top">
                  <g:link mapping="studyAnalysedData" elementId="edit-folder[${i}]" class="button right list" action="editData" params="[studyId: studyInstance.id, folder:analysedFolder.folder]">Upload</g:link>
                </td>
              </tr>
            </g:each>
          </tbody>
         
        </table>
      </div>
      <g:submitButton class="button" name="Download"></g:submitButton>
    </g:form>
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
           'checkbox': { 
               'two_state': false,
               'real_checkboxes':true,
               'real_checkboxes_names': function(node) {
            	   											var folderPath = $(node).data('folderPath');
            	   											if(folderPath == null)
                	   										{
            	   												folderPath = node[0].getAttribute('folderPath')
                	   										}

                   											return['files', folderPath ];
               										   }
           },
           "themes": {
			   "url" : '${jstreeTheme}',
               "theme": "classic"
           },
           "types": {
               "valid_children" : "all",
               "type_attr" : "rel",
               "types" : {
                   "root" : {
                       "valid_children" : "all"
                   },
                   "file" : {
                       "icon" : {"image":"${imagesDir}/leaf.gif"},
                       "valid_children" : ["none"]
                   }                   
               }
           },
           'plugins' : [ "themes", "json_data", "types", "checkbox" ]
           }).bind("check_node.jstree", function (e, data) {
                        // alert("checkededddd");
                        // get descriptor of location of 
           });
       $node = $('#SAV_${analysedFolder.id}');
       $node.click(function() {
           var viewLink = '${createLink(mapping:"studyAnalysedData", action:"editData", params:[studyId: studyInstance.id, folder:analysedFolder.folder, mode:'view'])}';
           window.location.href=viewLink;
           });
    </g:each>
	</script>
	<script type="text/javascript">
    	function submitMe(){ 
	        var checked_ids = []; 
	        $("#server_tree").jstree("get_checked",null,true).each 
	            (function () { 
	                checked_ids.push(this.id); 
	            }); 
	           alert('checked_ids');
	           alert('checked_ids.len is: ' + checked_ids)
    	}
	
	    function myform() {
        	alert('Hi Karlos in function1111');
            var checked_ids = [];
            $.tree.plugins.checkbox.get_checked($.tree.reference("#demo_1")).each(function () {
              checked_ids.push(this.id);
            });
            document.new.systems.value = checked_ids.join(",");
            return true; 
        }
    </script>
    <script type="text/javascript">
	    function changeTarget() {
//        	alert('Hi Karlos in function2222');
//        	def val = $('a.checked')[0].text
var checked_ids = []; 
jQuery.jstree._focused().get_checked().each(function () {
	   checked_ids.push(this.id);
});

var theCheckedObject = jQuery.jstree._focused().get_checked()
for (var name in theCheckedObject){
	  if (theCheckedObject.hasOwnProperty(name)) {
//		    alert(name);
		  }

}

//alert('Hi Karlos in function3333');
//alert('checked_ids.length is: ' + checked_ids.length);
	for (i=0; i < checked_ids.length; i++)
	{
//		alert('i is: ' + i);
//		alert('checked_id val is: ' + checked_ids[i].toString());
	}
	alert( checked_ids.join(",")); 
            return true; 
        }
    </script>
    </body>
</html>
