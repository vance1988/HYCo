<!DOCTYPE html>
<html lang="zh">
 <head>
  <title><#if app?has_content>${app.appName}<#else>MS</#if>管理系统</title>
<link rel="shortcut icon" href="favicon.ico"/>     
<link rel="bookmark" href="favicon.ico"/> 
<#include "/manager/include/macro.ftl"/>
<#include "/manager/include/meta.ftl"/>	
</head>

<body style="overflow-y: hidden;">	
    
     <!--顶部开始 -->
    <div class="ms-top navbar-fixed-top">
        <!--头部LOGO-->
        <div class="ms-top-logo"><img <#if app?has_content>src="${base}${app.appLogo}" width="95%"<#else>src="${skin_manager_logo}" width="40%"</#if> /></div>
        <!--
        <a href="" id="suo" style="width:50px;height:100%;float:left;display:block;color:#E4E4E4">
            <span class="glyphicon glyphicon-menu-hamburger" style="font-size:18px;padding:10px 0px 0px 16px;" data-is="false"></span>
        </a>-->
        <div class="ms-top-menu">
            <div class="btn-group" role="group" aria-label="..." style="float:right;">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default dropdown-toggle ms-rg-top-bt" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
                        <!--昵称-->${managerSession.managerName}
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li  data-toggle="modal" id="editLoginPassword"><a><span class="glyphicon glyphicon-cog"></span> 修改密码</a></li>
                        <!--li data-toggle="modal" data-target=".changeThemeClass"><a><span class="glyphicon glyphicon-picture"></span> 切换皮肤</a></li-->
                    </ul>
                </div>
                <div class="ms-top-menuchild">
                    <a href="" class="ms-top-menuchildtext" data-toggle="modal" data-target=".loginOut" class="ms-top-menuchildtext" data-toggle="tooltip" data-placement="bottom" title="退出" ><span class="glyphicon glyphicon-off"></span></a>
                    <!--退出-->
                    <a href="javascript:location.reload()" class="ms-top-menuchildtext" data-toggle="tooltip" data-placement="bottom" title="管理主界面"><span class="glyphicon glyphicon-home"></span></a>
                    <!--首页-->
                </div>
            </div>
        </div>
    </div>
    
    <!--左边菜单开始-->
    <div class="ms-menu">
    	<#noparse>
        <!--左边顶在上面的空DIV-->
        <script id="ms-menu-parent-tmpl" type="text/x-jquery-tmpl">
            {{if modelModelId==0}}
            <div class="ms-menu-parent" data-model-id="${modelId}">
                <div class="ms-menu-parent-header">
                    <i class="icon iconfont icon-logo"> ${modelIcon}</i>
                    <div class="ms-menu-parent-title">${modelTitle}
                        <span class="glyphicon-plus openMenu"></span>
                    </div>
                </div>
                <ul class="ms-menu-child">
                </ul>
            </div>
            {{/if}}
        </script>
        <script id="ms-menu-child-tmpl" type="text/x-jquery-tmpl">
            <li><a data-url="${modelUrl}" data-title="${modelTitle}" data-id="${modelId}"><span class="caret"></span>${modelTitle}</a></li>
        </script>
        </#noparse>
    </div>
    <!--左边菜单结束-->
    <!--右边开始-->
    <div class="ms-content" style="padding: 40px 0 0 0;">
    	<#if managerModelPage?has_content>
     		<iframe  src="${basePath}/${managerModelPage.managerModelPageUrl?default("/manager/page.html")}" frameborder="0" height="100%" width="100%" id="mainFrame" name="mainFrame" style="background-image: url(${static}/skin/manager/${manager_ui}/images/loading.gif);  background-repeat: no-repeat;  background-position: center;"></iframe>
     	<#else>
     		<iframe  src="${basePath}/manager/page.html" frameborder="0" height="100%" width="100%" id="mainFrame" name="mainFrame" style="background-image: url(${skin_manager_loadding});  background-repeat: no-repeat;  background-position: center;"></iframe>
     	</#if>    
        <!--修改登录密码模态框-->
		<@ms.modal modalName="editLoginPassword" title="修改密码" style="width:500px">
			  <@ms.modalBody height="180">
			  		<@ms.form  isvalidation=true name="updatePasswordFrom"  action="${base}${baseManager}/updatePassword.do">
			    		<@ms.text name="managerName" width="200" label="账号:" title="managerName" value="" readonly="readonly" validation={"required":"true", "data-bv-notempty-message":"必填项目"} />
			    		<@ms.password name="oldManagerPassword" label="旧密码:" title="managerPassword" validation={"required":"true", "data-bv-notempty-message":"必填项目"}/>
			    		<@ms.password name="newManagerPassword" label="新密码:" title="managerPassword" validation={"required":"true", "data-bv-notempty-message":"必填项目"}/>
			    	</@ms.form>	
		     </@ms.modalBody>
			 <@ms.modalButton>
			 	<@ms.savebutton value="更新密码" id="editLoginPasswordButton"/>
			 </@ms.modalButton>
		</@ms.modal>
		
		<@ms.modal modalName="loginOut" title="退出提示!">
			  <@ms.modalBody height="60">
			  		确认退出？？
		     </@ms.modalBody>
			 <@ms.modalButton>
			 	<@ms.button value="确认退出" id="loginOutBtn" url="${base}${baseManager}/loginOut.do"/>
			 </@ms.modalButton>
		</@ms.modal>
    </div>
    <!--右边结束-->
	<iframe src="${base}${baseManager}/rf.html" style="display:none"></iframe>
</body>
</html>
<script>
	$(function(){
		ms.manager.initMenu(${modelList});
		
		//获取管理员帐号
		$("#editLoginPassword").click(function() {
			$.ajax({
				type: "post",
				dataType: "json",
				url:  "${base}${baseManager}/editPassword.do",
				success: function(msg){
					var json =JSON.parse(msg.resultMsg);
					$(".editLoginPassword input[name='managerName']").val(json);
					$(".editLoginPassword").modal();
				}
			});
		});
		
		
		//修改密码
		$("#editLoginPasswordButton").click(function() {		
			var vobj = $("#updatePasswordFrom").data('bootstrapValidator').validate();
			if(vobj.isValid()){
				$(this).postForm("#updatePasswordFrom",{func:function(data) {
					if(data.result){
						alert("密码修改成功!");
						location.reload();
					}else{
						alert(data.resultMsg);
					}
		 			
				}});	
			} else {
				alert("表单验证失败");
			}	
			
		});
		
		 //退出系统
		$("#loginOutBtn").click(function() {	
			$(this).request({func:function(data) {
		 			location.reload();
			}});	
		});
	
		$(".ms-menu-child li a").each(function() {
			$(this).attr("href","${basePath}/"+$(this).data("url")+"?modelId="+$(this).data("id")+"&modelTitle="+encodeURI($(this).data("title")));
		});
	})
</script>