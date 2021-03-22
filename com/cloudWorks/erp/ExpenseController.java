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
public class ExpenseController {
	@Autowired
	private ExpenseService expenseService;
	
	@RequestMapping("/expenseListForm.do")
	public ModelAndView expenseListForm(ExpenseSearchDTO expenseSearchDTO, HttpSession session, ExpenseDTO expenseDTO) {
		ModelAndView mav = new ModelAndView();

		expenseSearchDTO.setEmp_no(session.getAttribute("emp_no"));
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		int listAllCnt = this.expenseService.getBoardListAllCnt(expenseSearchDTO);
		if(listAllCnt > 0) {
			int beginRowNo = expenseSearchDTO.getSelectPageNo() * expenseSearchDTO.getRowCntPerPage()
							- expenseSearchDTO.getRowCntPerPage() + 1;		
			if(listAllCnt < beginRowNo) {
				expenseSearchDTO.setSelectPageNo(1);
			}
		}
		
		int check_MgrCnt = this.expenseService.getCheckMgrCnt(expenseDTO);
		
		int check_Mgr_MgrCnt = this.expenseService.getCheck_Mgr_MgrCnt(expenseDTO);
		
		List<Map<String, String>> getExpenseList = this.expenseService.expenseListForm(expenseSearchDTO);
		
		mav.setViewName("expenseListForm.jsp");
		mav.addObject("getExpenseList", getExpenseList);
		mav.addObject("expenseSearchDTO", expenseSearchDTO);
		mav.addObject("listAllCnt", listAllCnt);
		
		mav.addObject("check_MgrCnt", check_MgrCnt);
		mav.addObject("check_Mgr_MgrCnt", check_Mgr_MgrCnt);
		
		return mav;
	}
	
	
	
	@RequestMapping("/expenseRegForm.do")
	public ModelAndView expenseRegForm(ExpenseDTO expenseDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		ExpenseDTO getExpenseReg = this.expenseService.expenseRegForm(expenseDTO);
		mav.addObject("getExpenseReg", getExpenseReg);
		mav.setViewName("expenseRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/expenseRegProc.do",
					method=RequestMethod.POST,
					produces="application/json; charset=UTF-8")
	@ResponseBody
	public int insertExpense(ExpenseDTO expenseDTO, HttpSession session) {
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		expenseDTO.setExpense_date(expenseDTO.getExp_year()+"-"+expenseDTO.getExp_month()+"-"+expenseDTO.getExp_day());
		
		int getInsertExpense = this.expenseService.insertExpense(expenseDTO);
		return getInsertExpense;
	}
	
	
	@RequestMapping("/expenseContentForm.do")
	public ModelAndView expenseContentForm(@RequestParam(value="report_no") String report_no, 
										ExpenseDTO expenseDTO, HttpSession session) {
		expenseDTO.setReport_no(report_no);
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		ModelAndView mav = new ModelAndView();
		ExpenseDTO getExpenseContent = this.expenseService.expenseContentForm(expenseDTO);
		
		ExpenseDTO getExpenseUnderSign = this.expenseService.expenseUnderSign(expenseDTO);
		
		
		mav.setViewName("expenseContentForm.jsp");
		mav.addObject("getExpenseContent", getExpenseContent);
		mav.addObject("getExpenseUnderSign", getExpenseUnderSign);
		return mav;
	}
	
	@RequestMapping(value = "/expenseConFirmProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int expenseConfirmCnt(@RequestParam(value="report_no")String report_no, 
			ExpenseDTO expenseDTO, HttpSession session) {
		expenseDTO.setReport_no(report_no);
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		int getExpenseConFirmCnt = this.expenseService.expenseConfirmCnt(expenseDTO);
		
		return getExpenseConFirmCnt;
	}
	
	@RequestMapping(value = "/expenseReturnProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int expenseReturnCnt(@RequestParam(value="report_no")String report_no, 
							@RequestParam(value="return_result")String return_result,
							ExpenseDTO expenseDTO, HttpSession session) {
		expenseDTO.setReport_no(report_no);
		expenseDTO.setReturn_result(return_result);
		expenseDTO.setEmp_no(session.getAttribute("emp_no"));
		
		int getExpenseReturnCnt = this.expenseService.expenseReturnCnt(expenseDTO);

		return getExpenseReturnCnt;
	}
		
	
	


	

}
