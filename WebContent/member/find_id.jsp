<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="../header.jsp" %> 

 <article>
  	<h2>아이디 찾기</h2>
    <form  id="findId" method="post"  name=formm>
       			
       		 <fieldset calss="login">	
   			<h2>${name}님의 아이디는</h2>
   			<h2>${id}입니다.</h2> 

        <div class="loginbtn"> 
         <!-- <div id="buttons"> -->
            <input class="s2" type="text" value="아이디 비밀번호 찾기"
             onclick="location='NonageServlet?command=findIdPasswordform'"><br/>  
            <input class="s1"type="button" value="로그인" 
            onclick="location='NonageServlet?command=login_form'"><br/>          
            <p>아직 회원이 아니신 가요?</p>
            <input  class="s2" type="button" value="회원가입" 
                 onclick="location='NonageServlet?command=contract'">
        </div>
        </fieldset>
       </form>  
  </article>



<%@ include file="../footer.jsp" %> 