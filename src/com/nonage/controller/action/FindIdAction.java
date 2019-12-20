package com.nonage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nonage.dao.MemberDAO;
import com.nonage.dto.MemberVO;

public class FindIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "member/find_id.jsp";
		
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		
		 MemberDAO memberDAO = MemberDAO.getInstance();
		 String id = memberDAO.findId(name,email); 
		 
		 
	     request.setAttribute("name",name);
	     request.setAttribute("email",email);
	     request.setAttribute("id",id);
	     
	     System.out.println("findIdAction실행종료");

		
	    
		 RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		 dispatcher.forward(request, response);
		

	}

	
	
	
//	
//	String url = "member/find_id.jsp";
//
//	String name= request.getParameter("name");
//	String email= request.getParameter("email");
//	
//	 MemberDAO memberDAO = MemberDAO.getInstance();
//	 MemberVO memberVO=memberDAO.findId(name,email); 
//	 
//	 
//     request.setAttribute("memberVO",memberVO);
//     
//     System.out.println("findIdAction실행종료");
//
//	
//    
//	 RequestDispatcher dispatcher=request.getRequestDispatcher(url);
//	 dispatcher.forward(request, response);
//	}
}
