<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
    String str = request.getParameter("id").toString(); 
    %>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>first spring mvc</title>
</head>
<body>
  ${user.loginname}
  <form action="${pageContext.request.contextPath}/user/showUser" method="post">
    <input name="id" id="id" value="${user2.loginname}">
    <input type="submit" vlaue="submit"></button>
  </form>
</body>
</html>