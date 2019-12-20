package com.nonage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.dao.MemberDAO;
import com.nonage.dto.MemberVO;

public class FindPasswordAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "member/find_pwd.jsp";
		
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		
		 MemberDAO memberDAO = MemberDAO.getInstance();
		 String pwd = memberDAO.findPwd(id,name,email); 
		 
		 request.setAttribute("id",id);
	     request.setAttribute("name",name);
	     request.setAttribute("email",email);
	     request.setAttribute("pwd",pwd);
	     
	     System.out.println("findIdAction실행종료");

		
	    
		 RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		 dispatcher.forward(request, response);

	}

}
