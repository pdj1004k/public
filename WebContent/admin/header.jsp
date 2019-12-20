<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ModernStyle Admin</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript" src="admin/product/product.js"></script>
<c:choose>
	<c:when test="${empty workerId}">
		<script type="text/javascript">
			location.href = 'NonageServlet?command=admin_login_form';
		</script>
	</c:when>
</c:choose>
</head>
<body>
	<div id="wrap">
		<header>			
			<div id="logo">
				 <a href="NonageServlet?command=index"><h1>ModernStyle</h1></a>
			</div>	
			<input class="btn" type="button"  value="logout"  style="float: right; margin:40px 100px 0px 100px;"
			   onClick="location.href='NonageServlet?command=index'">			
		</header>
		</div>
		<div class="clear"></div>