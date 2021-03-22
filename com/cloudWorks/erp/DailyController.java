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
public class DailyController {
	
	@Autowired
	private DailyService dailyService;
	
	@RequestMapping("/dailyListForm.do")
	public ModelAndView dailyListForm(DailySearchDTO dailySearchDTO, HttpSession session , DailyDTO dailyDTO) {
		ModelAndView mav = new ModelAndView();
		
		dailySearchDTO.setEmp_no(session.getAttribute("emp_no"));
		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
	
		int listAllCnt = this.dailyService.getBoardListAllCnt(dailySearchDTO);
		if(listAllCnt > 0) {
			int beginRowNo = dailySearchDTO.getSelectPageNo() * dailySearchDTO.getRowCntPerPage()
							- dailySearchDTO.getRowCntPerPage() + 1;		
			if(listAllCnt < beginRowNo) {
				dailySearchDTO.setSelectPageNo(1);
			}
		}
		
		int check_MgrCnt = this.dailyService.getCheckMgrCnt(dailyDTO);
		
		int check_Mgr_MgrCnt = this.dailyService.getCheck_Mgr_MgrCnt(dailyDTO);	
		
		List<Map<String, String>> getDailyList = this.dailyService.dailyListForm(dailySearchDTO);
		
		mav.setViewName("dailyListForm.jsp");
		mav.addObject("getDailyList", getDailyList);
		mav.addObject("dailySearchDTO", dailySearchDTO);
		mav.addObject("listAllCnt", listAllCnt);
		
		mav.addObject("check_MgrCnt", check_MgrCnt);
		mav.addObject("check_Mgr_MgrCnt", check_Mgr_MgrCnt);

		return mav;
	}
	
	
	
	@RequestMapping("/dailyRegForm.do")
	public ModelAndView dailyRegForm(DailyDTO dailyDTO, HttpSession session) {

		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
		ModelAndView mav = new ModelAndView();
		DailyDTO getDailyReg = this.dailyService.dailyRegForm(dailyDTO);
		mav.setViewName("dailyRegForm.jsp");
		mav.addObject("getDailyReg", getDailyReg);
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/dailyRegProc.do",
					method=RequestMethod.POST,
					produces="application/json; charset=UTF-8")
	@ResponseBody
	public int insertDaily(DailyDTO dailyDTO, HttpSession session) {
		
		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
		dailyDTO.setBusi_start_date(dailyDTO.getBegin_year()+"-"+dailyDTO.getBegin_month()+"-"+dailyDTO.getBegin_day()+" "+dailyDTO.getBegin_hour()+":"+dailyDTO.getBegin_min());
		dailyDTO.setBusi_end_date(dailyDTO.getEnd_year()+"-"+dailyDTO.getEnd_month()+"-"+dailyDTO.getEnd_day()+" "+dailyDTO.getEnd_hour()+":"+dailyDTO.getEnd_min());
		/*
		dailyDTO.setBusi_start_date(dailyDTO.getBegin_year()+"-"+dailyDTO.getBegin_month()+"-"+dailyDTO.getBegin_day()+" "+dailyDTO.getBegin_hour()+":"+dailyDTO.getBegin_min());
      	dailyDTO.setBusi_end_date(dailyDTO.getEnd_year()+"-"+dailyDTO.getEnd_month()+"-"+dailyDTO.getEnd_day()+" "+dailyDTO.getEnd_hour()+":"+dailyDTO.getEnd_min());
		*/
		System.out.println(dailyDTO.getBusi_start_date());
		System.out.println(dailyDTO.getBusi_end_date());

		int getInsertDaily = this.dailyService.insertDaily(dailyDTO);
		
		return getInsertDaily;
	}
	
	

	
	@RequestMapping("/dailyContentForm.do")
	public ModelAndView dailyContentForm(@RequestParam(value="report_no") String report_no, 
										DailyDTO dailyDTO, HttpSession session) {
		dailyDTO.setReport_no(report_no);
		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
		ModelAndView mav = new ModelAndView();
		DailyDTO getDailyContent = this.dailyService.dailyContentForm(dailyDTO);
		
		DailyDTO getDailyUnderSign = this.dailyService.dailyUnderSign(dailyDTO);
		
		
		mav.setViewName("dailyContentForm.jsp");
		mav.addObject("getDailyUnderSign", getDailyUnderSign);
		
		mav.addObject("getDailyContent", getDailyContent);
		return mav;
		
	}
	
	@RequestMapping(value = "/dailyConFirmProc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int dailyConfirmCnt(@RequestParam(value="report_no")String report_no, DailyDTO dailyDTO, HttpSession session) {
		dailyDTO.setReport_no(report_no);
		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
		int getDailyConFirmCnt = this.dailyService.dailyConfirmCnt(dailyDTO);
		
		return getDailyConFirmCnt;
	}
	
	@RequestMapping(value = "/dailyReturnProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int dailyReturnCnt(@RequestParam(value="report_no")String report_no, 
							@RequestParam(value="return_result")String return_result,
							DailyDTO dailyDTO, HttpSession session) {
		dailyDTO.setReport_no(report_no);
		dailyDTO.setReturn_result(return_result);
		dailyDTO.setEmp_no(session.getAttribute("emp_no"));
		
		int getDailyReturnCnt = this.dailyService.dailyReturnCnt(dailyDTO);

		return getDailyReturnCnt;
	}

}










