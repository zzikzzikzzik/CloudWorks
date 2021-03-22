package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	
	@RequestMapping("/dashboard.do")
	public ModelAndView dashboard(
			DashboardDTO dashboardDTO
			, HttpSession session
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dashboard.jsp");
		
		String emp_no = (String) session.getAttribute("emp_no");
		dashboardDTO.setEmp_no(emp_no);
		

		List<Map<String,String>> dashboardLoginList = null;
		dashboardLoginList = this.dashboardService.get_dashboardLoginList(dashboardDTO);

		mav.addObject("emp_no",dashboardLoginList.get(0).get("emp_no"));  
		mav.addObject("emp_name",dashboardLoginList.get(0).get("emp_name"));  
		mav.addObject("jikup_name",dashboardLoginList.get(0).get("jikup_name"));  
		
		return mav;
	}	
	//---------------------------------------------------------------------	
	@RequestMapping(
			value="/reportSignCntProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
    )
	@ResponseBody
	public List<Map<String,String>> get_reportSignCntList(
			      DashboardDTO dashboardDTO
			      , HttpSession session
	){
		String emp_no = (String) session.getAttribute("emp_no");
		dashboardDTO.setEmp_no(emp_no);		
		
		List<Map<String,String>> reportSignCntList = null;
		try {
			reportSignCntList = this.dashboardService.get_reportSignCntList(dashboardDTO);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		return reportSignCntList;
	}
	//---------------------------------------------------------------------	
	@RequestMapping(
			value="/reportTypeProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
    )
	@ResponseBody
	public List<Map<String,String>> get_reportTypeList(
			      DashboardDTO dashboardDTO
			      , HttpSession session
	){
		String emp_no = (String) session.getAttribute("emp_no");
		dashboardDTO.setEmp_no(emp_no);
		
		List<Map<String,String>> reportTypeList = null;
		try {
			reportTypeList = this.dashboardService.get_reportTypeList(dashboardDTO);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		return reportTypeList;
	}	
	//---------------------------------------------------------------------	
	@RequestMapping(
			value="/reportSignStateProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
    )
	@ResponseBody
	public List<Map<String,String>> get_reportSignStateList(
			      DashboardDTO dashboardDTO
			      , HttpSession session
	){
		String emp_no = (String) session.getAttribute("emp_no");
		dashboardDTO.setEmp_no(emp_no);
		
		List<Map<String,String>> reportSignStateList = null;
		try {
			reportSignStateList = this.dashboardService.get_reportSignStateList(dashboardDTO);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		return reportSignStateList;
	}
	//---------------------------------------------------------------------	
	@RequestMapping(
			value="/signRequestList.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
    )
	@ResponseBody
	public List<Map<String,String>> get_signRequestList(
			      DashboardDTO dashboardDTO
			      , HttpSession session
	){
		List<Map<String,String>> signRequestList = null;
		try {
			signRequestList = this.dashboardService.get_signRequestList(dashboardDTO);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		return signRequestList;
	}
}
