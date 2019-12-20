<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin mainpage</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript">
function worker_check()
{
  if(document.frm.workId.value==""){
      alert("아이디를 입력하세요.");
      return false;
  }else if(document.frm.workPw.value==""){
     alert("비밀번호를 입력하세요.");
      return false;
    }
    return true;  
}
</script>
</head>

<body>
 <div id="wrap">
    <header>      
      <div id="logo">
       <a href="NonageServlet?command=index"><h1>ModernStyle</h1></a>
      </div>      
    </header>
         
    <div class="clear"></div>
   
     <article>
     <h2>ModernStyle 로그인</h2>
       <div id="loginform">
      <form name="frm" method="post" 
action="NonageServlet?command=admin_login"><br/><br/>
     
        <p>관리자 로그인</p>
 <input type="text" name="workerId"  value="아 이 디"><br/><br/>
 <input type="password" name="workerPwd"  value="비밀번호"><br/><br/>
 <input type="submit" value="업무 로그인"           
            onclick="return worker_check()"><br/>
 <p>아직 회원이 아니신 가요?</p><br/>
  <input type="button" value="회원가입" 
                 onclick="location='NonageServlet?command=contract'"><br/>
            <h4 style="color:red">${message}</h4>
         
      </form>
      </div>
    </article>
                
  </div>
  <%@ include file="../footer.jsp" %> 
</body>
</html>