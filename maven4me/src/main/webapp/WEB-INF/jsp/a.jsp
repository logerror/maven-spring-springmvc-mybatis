<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>add user</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
	<style type="text/css">
		.fc{
			color:red		
		}
	</style>
    <script type="text/javascript">
    /* 	function getChildren(){
    		var url="user_getChildren?deptId="+$("#deptId").val();
             //要将城市下拉列表框清空  
            if($("#cId").length!=0){  
              $("#cId").html("");  
            }  
            
    		$.post(url,function(data){
				
			 var deptArray=data.split("#");  
			 //给select标签添加子节点
             for(var i=0;i<deptArray.length;i++){  
                var option=new Option(deptArray[i],deptArray[i]);  
                //document.getElementById("cId").options.add(option);  
                $("#cId").append(option);  
			  }
    	}); 
    	}
    	//加载第一个上级部门的子部门,不能加()
    	window.onload=getChildren; */
    	
    	function getXmlHttpRequest(){
        var xmlHttp;
	    try {
	        // Firefox, Opera 8.0+, Safari
	        xmlHttp = new XMLHttpRequest();
	    } 
	    catch (e) {
	        // Internet Explorer
	        try {
	            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	        } 
	        catch (e) {
	            try {
	                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	            } 
	            catch (e) {
	                alert("您的浏览器不支持AJAX！");
	            }
	        }
	    }
		return xmlHttp;
	    }
    	
    	//定义全局变量,用于判断输入参数
    	var vloginName=false;
    	var vpassword=false;
    	var vrepassword=false;
    	var vrealName=false;
    	var vage=false;
    	var vroles=false;
    	
    	//验证登录名
    	$(function(){
    		$("#loginName").blur(function(){
    		
    			var loginName=$("#loginName").val();
    			var regExp=/^[a-zA-Z0-9_]{3,16}$/;
    			if(regExp.test(loginName)){
    			
    			var xhr = getXmlHttpRequest();
		        xhr.onreadystatechange=function(){
			    if(xhr.readyState==4){
				    if(xhr.status==200){
					//做出提示
					if(1==xhr.responseText){
					$("#table1 tr:eq(0) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='green'>√用户名可用</font>");
					vloginName=true;
					}else{
					$("#table1 tr:eq(0) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×用户名不可用</font>");
					
					}
				         }
			          }
		        };
		        //POST方式提交
				xhr.open("POST","user_checkName?time="+new Date().getTime());
				
				//告知服务器端：请求正文的MIME类型
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				
				xhr.send("loginName="+loginName);
    			}else{
    				$("#table1 tr:eq(0) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×登录名需要3-16位之间的大小写字母和下划线组成</font>");
    			}
    			
		        
    		});
    	});
    	
    	//验证密码
    	$(function(){
    		$("#password").blur(function(){
    			var password=$("#password").val();
    			var regExp=/^[a-zA-Z0-9_]{6,16}$/;
    			if(regExp.test(password)){
    				$("#table1 tr:eq(1) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='green'>√</font>");
    				vpassword=true;
    			}else{
    				$("#table1 tr:eq(1) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×</font>");
    			
    			}
    		});
    	});
    	
    	//验证确认密码
    	$(function(){
    		$("#repassword").blur(function(){
    			var password=$("#password").val();
    			var repassword=$("#repassword").val();
    			var regExp=/^[a-zA-Z0-9_]{6,16}$/;
    			if(regExp.test(repassword)&&repassword==password){
    				$("#table1 tr:eq(2) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='green'>√</font>");
    				vrepassword=true;
    			}else{
    				$("#table1 tr:eq(2) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×</font>");
    			
    			}
    		});
    	});
    	
    	//验证真实姓名
    	$(function(){
    		$("#realName").blur(function(){
    			var realName=$("#realName").val();
    		    realName=$.trim(realName);
    			
    			if(realName!=""){
    				$("#table1 tr:eq(3) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='green'>√</font>");
    				vrealName=true;
    			}else{
    				$("#table1 tr:eq(3) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×</font>");
    			}
    		});
    	});
    	
    	
    	//age必须在0-99之间
    	$(function(){
    		$("#age").blur(function(){
    			var age=$("#age").val();
    			if(age!=""&&age>=0&&age<=99){
    				$("#table1 tr:eq(9) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='green'>√</font>");
    				vage=true;
    			}else{
    				$("#table1 tr:eq(9) td:eq(1)").find("span").html("&nbsp;&nbsp;<font color='red'>×</font>");
    			}
    		});
    	});
    	
    	function sub(){
    	  
    	 	//判断至少选择一个岗位
    	     var roles=document.getElementsByName("roleIds");
             for(var i=0;i<roles.length;i++)
             {
	               if(roles[i].checked)
	               {
	               		vroles=true;
	               }
             }
             if(vroles==false){
             	alert("请至少选择一个岗位");
             }
             
    		if($("#password").val()==$("#repassword").val()){
    		
    			 if(vloginName==true&&vpassword==true&&vrepassword==true
    	     &&vrealName==true&&vage==true&&vroles==true){
    	     	//提交表单
    	     	$("#form1").submit();
    	     } else{
    	     	alert("请认真检查");
    	     }
    		}else{
    			//2次密码不一致
    			alert("2次输入密码不一致,请检查");
    		}
    	    
    	}
    </script>
  </head>
  <body>
    <s:form action="user_add" method="post" id="form1" enctype="multipart/form-data">
		
    	<table id="table1">
    	  <tr>
    	    <td><font class="fc">*</font>登录名:</td>
    	    <td><s:textfield name="loginName" id="loginName"></s:textfield><span>登录名只能由3-16位的字母、数字、下划线组成</span></td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>密码:</td>
    	    <td><s:password name="password" id="password"></s:password><span>密码只能由6-16位的字母、数字、下划线组成</span></td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>确认密码:</td>
    	    <td><s:password name="repassword" id="repassword"></s:password><span></span></td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>真实姓名:</td>
    	    <td><s:textfield name="realName" id="realName"></s:textfield><span></span></td>
    	  </tr>
    	  <tr>
    	    <td>所属部门:</td>
    	    <td>
    	    	
				<select  name="deptName1" >
				   <s:iterator value="%{departmentList1}">
					  <option value ="${name }">${name }</option>
				  </s:iterator>
				</select>
				
    	    </td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>岗位:</td>
    	    <td>
    	         <s:iterator value="#roleList">
    	         	<input type="checkbox" name="roleIds" value="${id}" id="cb_${id}" />${name}&nbsp;
    	         </s:iterator>
    	         <span></span>
    	    </td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>请选择头像:</td>
    	    <td><input type="file" name="image"/><span></span></td>
    	  </tr>
    	  <tr>
    	    <td>性别:</td>
    	    <td><s:radio list="%{genderList}"  name="gender" value="'男'" /></td>
    	  </tr>
    	  <tr>
    	    <td>学历:</td>
    	    <td><s:select list="%{educationList}"  name="education" /></td>
    	  </tr>
    	  <tr>
    	    <td><font class="fc">*</font>年龄:</td>
    	    <td><s:textfield name="age" value="" id="age"></s:textfield><span>年龄必须在0-99之间</span></td>
    	  </tr>
    	  <tr>
    	    <td>电话:</td>
    	    <td><s:textfield name="phoneNumber"></s:textfield><span></span></td>
    	  </tr>
    	  <tr>
    	    <td>邮箱:</td>
    	    <td><s:textfield name="email"></s:textfield><span></span></td>
    	  </tr>
    	  <tr>
    	    <td colspan="2"><input type="button" value="添加" onclick="sub()" style="background-color: blue;color: white"/></td>
    	  </tr>
    	</table>
    	  <div>
    	  	说明:带<font class="fc">*</font>的必须填写
    	  </div>
    </s:form>
  </body>
</html>
