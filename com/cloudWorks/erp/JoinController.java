package com.cloudWorks.erp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value = "/joinForm.do")
	public ModelAndView joinForm(
			HttpSession session
	) {
		session.setAttribute("emp_no","0");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinForm.jsp");
		return mav;
	}


	@RequestMapping(
			value="/joinProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int getjoinCnt(
			JoinDTO joinDTO
	) {
		int joinCnt = this.joinService.getjoinCnt(joinDTO);
		return joinCnt;
	}

	@RequestMapping(
			value="/emp_noProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int getEmp_no(
			JoinDTO joinDTO
	) {
		int emp_no = this.joinService.getEmp_no(joinDTO);
		return emp_no;
	}
}
