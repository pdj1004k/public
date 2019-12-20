<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Modern&nbsp;Style</title>
  <link href="css/shopping.css" rel="stylesheet">  
  <script type="text/javascript" src="member/findMemberIdAndPassword.js"></script>
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="mypage/mypage.js"></script> 
</head>

<body>
<div id="wrap">
<!--헤더파일 들어가는 곳 시작 -->
  <header>
    <!--로고 들어가는 곳 시작--->  
    <div id="logo">
      <a href="NonageServlet?command=index"><h1>ModernStyle</h1>
       <!--  <img src="images/logo1.jpg" width="200" height="120" alt="nonageshop"> -->
      </a>  
    </div>
    <!--로고 들어가는 곳 끝-->     
    <nav id="catagory_menu">
     <ul>
       <c:choose>
       <c:when test="${empty sessionScope.loginUser}">
       <li><a href="NonageServlet?command=contract">회원가입</a></li>
       <li>/</li>
       <li>         
         <a href="NonageServlet?command=login_form" style="width:70px;">회원로그인</a> 
       
	     <a href="NonageServlet?command=admin_login_form" style="width:100px;">| 관리자로그인</a>
	   </li>		       
       
       </c:when>
       <c:otherwise>
       <li style="color:orange">
         ${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
       </li>
       <li><a href="NonageServlet?command=logout">로그아웃</a></li>
       </c:otherwise>       
       </c:choose>
       <li>/</li>
       <li>
         <a href="NonageServlet?command=cart_list">장바구니</a>
       </li><li>/</li>
       <li>
         <a href="NonageServlet?command=mypage" style="width:90px;">마이 페이지</a>
       </li><li>/</li>
       <li>
         <a href="NonageServlet?command=qna_list">고객 센터</a>
       </li>
     </ul>
    </nav>

    <nav id="top_menu">
      <ul>
        <li>
          <a href="NonageServlet?command=catagory&kind=1">OUTER</a>
        </li>  
        <li>
          <a href="NonageServlet?command=catagory&kind=2">TOP</a>
        </li>  
        <li>
          <a href="NonageServlet?command=catagory&kind=3">PANTS</a>
        </li> 
        <li>
          <a href="NonageServlet?command=catagory&kind=4">ONEPIECE</a>
        </li> 
        <li >
          <a href="NonageServlet?command=catagory&kind=5" style="color:red">hot-SALE</a>
        </li>  
      </ul>
    </nav>
   <div class="clear"></div>
    <hr>
  </header>
  <!--헤더파일 들어가는 곳 끝 -->