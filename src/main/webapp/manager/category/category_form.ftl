<@ms.html5>
    <@ms.nav title="栏目管理">
		<#assign action="/manager/category/save.do"/>
		<#if category?has_content>
			<#assign action="/manager/category/update.do"/>
		</#if>    
		<@ms.saveButton id="saveFormButton"/>
    </@ms.nav>
    <@ms.panel>
   			<@ms.form isvalidation=true name="saveForm"   action="">
				    		<@ms.text name="categoryTitle" width="300" label="名称:" title="类别名称" maxlength="30"  placeholder="类别名称"  validation={"required":"true", "data-bv-notempty-message":"请填写栏目类别"}/>
				    		<@ms.textarea id="description"  name="categoryDescription" label="描述:"  title="栏目描述" placeholder="栏目描述" maxlength="150"/>
				    		
				    		<input type="hidden" name="categoryId" id="categoryId" value="" disabled="true"/>
				    		<@ms.formRow label="缩略图">
						    		<#if category?has_content> 
										<@ms.uploadImg path="upload/${manager_session.basicId?default('0')}/app/" inputName="categorySmallImg" size="15" filetype="" msg=""  maxSize="1" imgs="${category.categorySmallImg?default('')}" />
									<#else> 
										<@ms.uploadImg path="upload/${manager_session.basicId?default('0')}/app/" inputName="categorySmallImg" size="15" filetype="" msg=""  maxSize="1" imgs="" />
									</#if>				    		
				    		</@ms.formRow>
				    		<@ms.formRow label="缩略图" width="300">
								<#if listCategory?has_content>
										<@ms.treeInput  treeId="inputTree" json="${listCategory?default('')}" jsonId="categoryId" jsonPid="categoryCategoryId" jsonName="categoryTitle" buttonText="顶级栏目" inputName="categoryCategoryId"  showIcon="true" expandAll="true" addNodesName="顶级栏目" inputValue="${categoryCategoryId?default('0')}"/>
			    				<#else> 
										<@ms.treeInput  treeId="errorTree"  buttonText="暂无数据"/>
			    				</#if>
				    		</@ms.formRow>
	    	</@ms.form>	
    </@ms.panel>
</@ms.html5>
<script>
	//从后台得到值之后，显示在输入框中
	<#if category?has_content>
		$("input[name='categoryTitle']").val("${category.categoryTitle?default('')}");
		$("#description").text("${category.categoryDescription?default('')}");	
		$("input[name='categoryId']").val(${category.categoryId?default(0)});
		$("#categoryId").attr("disabled",false);
	</#if>

	$("input[name=categoryCategoryId]").val("${categoryCategoryId?default('0')}");
	//点击修改或保存时,先判断验证是否通过,再提交信息
	$("#saveFormButton").click(function(){
		if($("#saveForm").data('bootstrapValidator').validate().isValid()){
			var formdata = $("#saveForm").serialize();
			
			$(this).request({url:"${base}${action}",data:formdata,type:"json",method:"post",func:function(msg) {
				if (msg.result) {
		     			alert("操作成功");
		    			location.href=base+"${baseManager}/category/list.do?categoryCategoryId="+msg.resultData+"&modelId=${modelId}&modelTitle="+encodeURIComponent('${modelTitle?default("栏目")}');
		    	}else{
		    			alert(msg.resultMsg);
		    	}
			}});
		}
	});
	
	
</script>
	
