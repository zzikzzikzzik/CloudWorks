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
public class EmployeeController {
	
	@Autowired 
	private EmployeeService employeeService;
	
	@RequestMapping("/employeeListForm.do")
	public ModelAndView employeeListForm(
		EmployeeSearchDTO employeeSearchDTO
		, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employeeListForm.jsp");
		
		int employeeListAllCnt = this.employeeService.getEmployeeListAllCnt(employeeSearchDTO);
		
		String qwe = employeeSearchDTO.getOrderby();
		
		//System.out.println(qwe);
		
		
		if(employeeListAllCnt > 0) {
			int beginRowNo = employeeSearchDTO.getSelectPageNo() * employeeSearchDTO.getRowCntPerPage()
							- employeeSearchDTO.getRowCntPerPage() + 1;		
			if(employeeListAllCnt < beginRowNo) {
				employeeSearchDTO.setSelectPageNo(1);
			}
		}
		
		
		List<Map<String,String>> employeeList = this.employeeService.getEmployeeList(employeeSearchDTO);
		
		mav.addObject("employeeList", employeeList);
		mav.addObject("employeeSearchDTO", employeeSearchDTO);
		mav.addObject("employeeListAllCnt", employeeListAllCnt);
		
		return mav;
	}
	
	@RequestMapping("/employeeListForm_beforeAllow.do")
	public ModelAndView employeeListForm_beforeAllow(
			EmployeeSearchDTO employeeSearchDTO
			, HttpSession session
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employeeListForm_beforeAllow.jsp");
		
		int beforeAllowCnt = this.employeeService.getBeforeAllowCnt(employeeSearchDTO);
		
		if(beforeAllowCnt > 0) {
			int beginRowNo = employeeSearchDTO.getSelectPageNo() * employeeSearchDTO.getRowCntPerPage()
							- employeeSearchDTO.getRowCntPerPage() + 1;		
			if(beforeAllowCnt < beginRowNo) {
				employeeSearchDTO.setSelectPageNo(1);
			}
		}
		
		List<Map<String,String>> beforeAllow = this.employeeService.getBeforeAllowList(employeeSearchDTO);
		
		mav.addObject("beforeAllow", beforeAllow);
		mav.addObject("employeeSearchDTO", employeeSearchDTO);
		mav.addObject("beforeAllowCnt", beforeAllowCnt);
		
		return mav;
	}
	
	@RequestMapping("/employeeUpDelForm.do")
	public ModelAndView employeeUpDelForm(
			@RequestParam(value="emp_no") int emp_no
			, HttpSession session
			, EmployeeSearchDTO employeeSearchDTO
			, EmployeeDTO employeeDTO
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employeeUpDelForm.jsp");
		
		EmployeeDTO employee  = this.employeeService.getEmployee(emp_no);
		
	
		
		List<Map<String,String>> mgrList = this.employeeService.getMgrList(employeeDTO);
		
		
		
		//System.out.println(mgrList);
		
	
		
		mav.addObject("mgrList", mgrList);
		
		
	
		
		mav.addObject("emp_no", emp_no);
		mav.addObject("employee", employee);
		
		return mav;
	}
	
	@RequestMapping(
			value="/employeeUpDelProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int employeeUpDelCnt(
		EmployeeDTO employeeDTO
	//	, @RequestParam(value="upDel") String upDel
		, HttpSession session
		
			
	) {
		// employeeList, UpDelForm 들어오기전에 먼저 관리자만 걸러야됨
		
		 String admin_no = (String)session.getAttribute("emp_no");
		 employeeDTO.setAdmin_no(admin_no);		// 세션에 저장된 emp_no 꺼냄
		
		System.out.println(employeeDTO.getAdmin_no());
		
		String upDel = employeeDTO.getUpDel();
		
		int upDelCnt=0;
		
	//	int mgr_emp_no = employeeDTO.getMgr_emp_no();
		
		System.out.println(employeeDTO.getMgr_emp_no()+"직속사원번호");
		
		System.out.println(upDel);
		
		 if(upDel.equals("up")) {
			 
			System.out.println("employeeController.updateEmployee 진입");
			
		//	System.out.println(employeeDTO.getJumin_num());
		//	System.out.println(employeeDTO.getEmp_no());
		//	System.out.println(employeeDTO.getNew_emp_no());
			 
			 upDelCnt = this.employeeService.updateEmployee(employeeDTO);
			 
			 System.out.println("employeeController.updateEmployee 나감");
			 
		//	 upDelCnt = 1;
		}else if(upDel.equals("del")) {
			//System.out.println("다운 진입");
			
			upDelCnt = this.employeeService.deleteEmployee(employeeDTO);
			 
			 
			 
		}
			
		
		return upDelCnt;
	}
	
	
	
	@RequestMapping(
			value="/selectMgrProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getSelectMgrList(
			EmployeeDTO employeeDTO
	) {
		List<Map<String,String>> selectMgrList = this.employeeService.getSelectMgrList(employeeDTO);
		return selectMgrList;
	}
}
