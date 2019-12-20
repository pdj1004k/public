function findMemberId(){
  if (document.formm.name.value == "") {
    alert("이름을 입력하여 주세요.");
   } else if (document.formm.email.value == "") {
    alert("이메일을 입력해 주세요.");
  } else {
	  document.formm.action = "NonageServlet?command=FindId_form";
	  document.formm.submit();
  }
}

function findPassword() {
  if (document.formm1.id.value == "") {
    alert('아이디를 입력하여 주십시오.');
  } else if (document.formm1.name.value == "") {
	    alert("이름을 입력해 주세요.");
  }else if (document.formm1.email.value == "") {
    alert("이메일을 입력해 주세요.");
  } else {
	 document.formm1.action = "NonageServlet?command=FindPassword_form";
	document.formm1.submit();
  }
}

