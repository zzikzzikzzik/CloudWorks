package com.cloudWorks.erp;

import java.util.ArrayList;
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
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping("/salesListForm.do")
	public ModelAndView salesListForm(SalesSearchDTO salesSearchDTO, HttpSession session,  SalesDTO salesDTO) {
		ModelAndView mav = new ModelAndView();
		
		salesSearchDTO.setEmp_no(session.getAttribute("emp_no"));
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		int listAllCnt = this.salesService.getBoardListAllCnt(salesSearchDTO);
		if(listAllCnt > 0) {
			int beginRowNo = salesSearchDTO.getSelectPageNo() * salesSearchDTO.getRowCntPerPage()
							- salesSearchDTO.getRowCntPerPage() + 1;		
			if(listAllCnt < beginRowNo) {
				salesSearchDTO.setSelectPageNo(1);
			}
		}
		int check_MgrCnt = this.salesService.getCheckMgrCnt(salesDTO);
		
		int check_Mgr_MgrCnt = this.salesService.getCheck_Mgr_MgrCnt(salesDTO);
		
		
		List<Map<String, String>> getSalesList = this.salesService.salesListForm(salesSearchDTO);
		mav.setViewName("salesListForm.jsp");
		mav.addObject("getSalesList", getSalesList);
		mav.addObject("salesSearchDTO", salesSearchDTO);
		mav.addObject("listAllCnt", listAllCnt);
		
		mav.addObject("check_MgrCnt", check_MgrCnt);
		mav.addObject("check_Mgr_MgrCnt", check_Mgr_MgrCnt);
		
		return mav;
	}

	
	@RequestMapping("/salesRegForm.do")
	public ModelAndView salesRegForm(SalesDTO salesDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		SalesDTO getSalesReg = this.salesService.salesRegForm(salesDTO);
		mav.setViewName("salesRegForm.jsp");
		mav.addObject("getSalesReg", getSalesReg);
		return mav;
	}
	
	@RequestMapping(value="/salesRegProc.do",
					method=RequestMethod.POST,
					produces="application/json; charset=UTF-8")
	@ResponseBody
	public int insertSales(SalesDTO salesDTO, HttpSession session) {
		
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		salesDTO.setSales_date_start(salesDTO.getBegin_year()+"-"+salesDTO.getBegin_month()+"-"+salesDTO.getBegin_day()+" "+salesDTO.getBegin_hour()+":"+salesDTO.getBegin_min());
		salesDTO.setSales_date_end(salesDTO.getEnd_year()+"-"+salesDTO.getEnd_month()+"-"+salesDTO.getEnd_day()+" "+salesDTO.getEnd_hour()+":"+salesDTO.getEnd_min());
		
		int getInsertSales = this.salesService.insertSales(salesDTO);
		
		return getInsertSales;
	}
	
	
	@RequestMapping("/salesContentForm.do")
	public ModelAndView salesContentForm(@RequestParam(value="report_no") String report_no, 
							SalesDTO salesDTO, HttpSession session) {
		
		salesDTO.setReport_no(report_no);
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		ModelAndView mav = new ModelAndView();
		
		
		SalesDTO getSalesContent = this.salesService.salesContentForm(salesDTO);
		SalesDTO getSalesUnderSign = this.salesService.salesUnderSign(salesDTO);
		
		
		mav.setViewName("salesContentForm.jsp");
		mav.addObject("getSalesUnderSign", getSalesUnderSign);
		mav.addObject("getSalesContent", getSalesContent);
		return mav;
		
	}
	
	@RequestMapping(value = "/salesConFirmProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int salesConfirmCnt(@RequestParam(value="report_no") String report_no, 
			SalesDTO salesDTO, HttpSession session) {
		salesDTO.setReport_no(report_no);
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		int getSalesConfirmCnt = this.salesService.salesConfirmCnt(salesDTO);
		
		return getSalesConfirmCnt;
	}
	
	@RequestMapping(value = "/salesReturnProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int salesReturnCnt(@RequestParam(value="report_no")String report_no, 
							@RequestParam(value="return_result")String return_result,
							SalesDTO salesDTO, HttpSession session) {
		salesDTO.setReport_no(report_no);
		salesDTO.setReturn_result(return_result);
		salesDTO.setEmp_no(session.getAttribute("emp_no"));
		
		int getSalesReturnCnt = this.salesService.salesReturnCnt(salesDTO);

		return getSalesReturnCnt;
	}

}
