package com.cloudWorks.erp;

import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp");
		return mav;
	}
	
	@RequestMapping(
			value="/loginProc.do"
			, method=RequestMethod.POST
			, produces="application/json; charset=UTF-8"
	)
	@ResponseBody
	public int getEmpNoCnt(
		LoginDTO loginDTO
		, HttpSession session
	) {
		int emp_noCnt = 0;
		
		emp_noCnt = this.loginService.getEmpNoCnt(loginDTO);
		
		session.setAttribute("emp_no", loginDTO.getEmp_no());
		return emp_noCnt;
	}

	@RequestMapping(value="/logout.do")
	public ModelAndView logout(
		HttpSession session
	){
		// HttpSession 객체에 저장된 아이디 삭제
		//session.removeAttribute("admin_id");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("logout.jsp");
		return mav;
	}

}
