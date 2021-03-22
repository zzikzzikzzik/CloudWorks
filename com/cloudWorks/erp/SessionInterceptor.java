package com.cloudWorks.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class SessionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
			HttpServletRequest request
			,HttpServletResponse response
			,Object handler
	) throws Exception {
		HttpSession session = request.getSession();
		
		String emp_no = (String) session.getAttribute("emp_no");
		
		if(emp_no==null) {
			String croot = request.getContextPath();
			
			response.sendRedirect(croot +"/logout.do");
			
			return false;
		}
		else {
			return true;
		}
	}
}
