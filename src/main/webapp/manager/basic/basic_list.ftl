<@ms.html5>
    <@ms.nav title="基础内容管理"></@ms.nav>
    
    <@ms.panel>
		<@ms.searchForm name="basicForm" action="${base}${baseManager}/basic/${categoryId?default(0)}/list.do">
			<@ms.text label="关键字" name="keyword" placeholder="输入关键字" value="${keyword?default('')}"/>
			<@ms.searchFormButton>
				<@ms.queryButton form="basicForm"/>								
			</@ms.searchFormButton>
		</@ms.searchForm>
		    
		<@ms.panelNav>
		    <@ms.addButton  url="${base}${baseManager}/basic/add.do?categoryId=${categoryId?default(0)}&categoryTitle=${categoryTitle?default(0)}"/>
		    <@ms.delButton fieldName="basicId" onclick="remove"/>
		</@ms.panelNav>
<@ms.table head=['编号,100',"标题"] 
           filed=["basicId","basicTitle"] 
           listItem="basicList" 
           id="basicId" 
           checkbox="basicId" 
           editField=["basicTitle"]
           editJs="edit"
           
/>
					
						<#if page?has_content>
							<@ms.showPage page=page/>
						</#if>						  
    </@ms.panel>
</@ms.html5>

	
<script>
		
		function edit(id) {
				location.href = base+"${baseManager}/basic/"+id+"/edit.do";
		}
		
		function remove(ids) {
			ms.post("${base}${baseManager}/basic/allDelete.do","basicIds="+ids,function(msg){
				if(msg.result){
					location.reload();
				}
			});
		}
</script>
