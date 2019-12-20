<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
  <article>
  	<h2>ModernStyle 로그인</h2>
    <form method="post" action="NonageServlet?command=login">
          <fieldset calss="login">
         <p>회원 로그인</p>
          <input name="id" type="text" value="${id}" value="아이디"><br> 
          <input name="pwd" type="password" value="비밀번호"><br> 
        	<div class="clear"></div>
        <div class="loginbtn">
            <input class="s2" type="text" value="아이디 비밀번호 찾기"
             onclick="location='NonageServlet?command=findIdPasswordform'"><br/>  
            <input class="s1"type="submit" value="로그인" ><br/>          
            <p>아직 회원이 아니신 가요?</p>
            <input  class="s2" type="button" value="회원가입" 
                 onclick="location='NonageServlet?command=contract'">
                           
        </div>
        </fieldset>
       </form>  
  </article>
<%@ include file="../footer.jsp" %> 
