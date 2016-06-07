<!DOCTYPE html>
<html lang="en">
<head>
<#include "/manager/include/meta.ftl"/>
<title><#if app?has_content>${app.appName}<#else>MS</#if>管理系统</title>
<link rel="shortcut icon" href="${static}/global/images/ms.ico"/>     
<link rel="bookmark" href="${static}/global/images/ms.icoo"/> 
<link rel="stylesheet" type="text/css" href="${static}/skin/manager/${manager_ui}/css/login.css" media="all" />
<link rel="stylesheet" type="text/css" href="${static}/skin/manager/${manager_ui}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${static}/skin/manager/${manager_ui}/css/supersized.css">
<link rel="stylesheet" type="text/css" href="${static}/skin/manager/${manager_ui}/css/style.css">
<script type="text/javascript" src="${static}/skin/manager/${manager_ui}/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="${static}/skin/manager/${manager_ui}/js/supersized-init.js"></script>
<script type="text/javascript" src="${static}/skin/manager/${manager_ui}/js/scripts.js"></script>
<script>
			if(top.location != location){  
			    top.location.href= location.href;  
			}  
			
</script>
</head>
<style>
	.gray{background:#92908E}
</style>
<body>
	<div class="page-container">
        <h1><#if app?has_content>${app.appName}</#if></h1>
        <div class="row" style="margin:0px;">
	        <form class="form-horizontal" id="loginForm" action="${base}${loginPath}/checkLogin.do">
	            <input type="text" name="managerName" class="managerName"  placeholder="用户名" value="" autofocus/>
                <div style="color:#F00; margin-top:10px; display:none;" id="show">用户名不能为空</div>
	            <input type="password" name="managerPassword" style="  margin-top: 10px;" class="managerPassword" placeholder="密&nbsp;&nbsp;&nbsp;&nbsp;码"  value=""/>
	            <div style="color:#F00; margin-top:10px; display:none;" id="show1">密码不能为空</div>
	            <button id="loginBtn" type="button">登录</button>
	        </form>
        </div>
    </div>
	
	<script type="text/javascript">    	
		//统计错误次数
		var count = 0;
		//验证表单是否正确
		var flag = false;
			
		function login(){
			
			if(flag){
				$("button").addClass("gray");
				$(this).postForm("#loginForm",{loadingText:"正在登录中..",func:function(data) {
    				if(data.result){
    					location.href=base+"${baseManager}/index.do";
    				}else{
    					alert(data.resultMsg);
    					count++;
    					$("button").css("background","#EF4300");
				   		$("button").html("登录");
				    	$(".managerName").val(null);
				    	if(count >=4){
								$("input").val(null);
								$("button").css("background","#EF4300");
				   				$("button").html("登录");
								$("input").attr("readonly","readonly");
								alert("您输入次数太多，请10秒后再输 ...");
								setTimeout(function(){
									$("input").removeAttr("readonly")
								},1000*10); 
						} 	
    				}
				}});
			}
		}
			
		$(function(){	
			//检测浏览器版本
			if (navigator.userAgent.toLowerCase().indexOf("msie") > 0) {
				    alert("您当前的浏览器版本太低，建议使用IE8以上版本浏览器，推荐使用Chrome浏览器");
			}	
			//验证表单
			$(".managerName").focus(function(){
				$("#show").hide();flag = true;
			});
			$(".managerName").blur(function(){
				var managerName = $(".managerName").val();
				if(managerName.replace(/\s+/g,"") == ""){
					$("#show").show();$(this).val(null);flag = false;
				}else if(managerName.length > 20){
					$("#show").show();$("#show").html("用户名长度介于1-12个字符");flag = false;
				} else {
					$("#show").hide();flag = true;
				}
			 });
			 $(".managerPassword").focus(function(){
				$("#show1").hide();flag = true;
			 });
			 $(".managerPassword").blur(function(){
				var managerPassword = $(".managerPassword").val();
				if(managerPassword.replace(/\s+/g,"") == ""){
					$("#show1").show();$(this).val(null);flag = false;
				}else if(managerPassword.length > 20){
					$("#show1").show();$("#show1").html("密码长度介于1-16个字符");flag = false;
				} else {
					$("#show1").hide();flag = true;
				}
			});
			
			//js监听回车键 
			document.onkeydown = function(e) {
				e = e ? e : window.event;
				var keyCode = e.which ? e.which : e.keyCode;
				if (keyCode == 13) {
					login(); 
				}
			}
			
			//点击登录
			$("#loginBtn").click(function() {
				login();
			});	
			
		})
	</script>
	
</body>
</html>
