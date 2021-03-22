package com.cloudWorks.erp;

import java.util.ArrayList;
import java.util.HashMap;
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
public class CalendarController {
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("/calendarForm.do")
	public ModelAndView calendarForm(
			HttpSession session
			//, @RequestParam(value="scrollValue", required = false, defaultValue = "0.0") Double scrollValue 
	) {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendarForm.jsp");
		return mav;
	}
	
	/*
	@RequestMapping(
			value="/calendarProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> showCalendarInfo(
			HttpSession session
			, @RequestParam(value="emp_no",required=false,defaultValue="0") String emp_no
	) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("emp_no",emp_no);		
		return map;
	}		
	
	
	@RequestMapping(
			value="/calendarProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getScheduleList(
			HttpSession session
			, @RequestParam(value="emp_no",required=false,defaultValue="0") String e_no
			//, CalendarDTO calendarDTO
	) {
		int emp_no = Integer.parseInt(e_no);
		//calendarDTO.setEmp_no(emp_no);
		
		List<Map<String,String>> scheduleList = this.calendarService.getScheduleList(emp_no);
		
		return scheduleList;
	}
	*/
	
	@RequestMapping(
			value="/calendarProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getScheduleList(
			HttpSession session
			//, @RequestParam(value="emp_no",required=false,defaultValue="0") String e_no
			, CalendarDTO calendarDTO
	) {		
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
		
		List<Map<String,String>> scheduleList = this.calendarService.getScheduleList(calendarDTO);


		//System.out.println(   scheduleList   );
		//System.out.println(   scheduleList.get(0)   );
		//System.out.println(   scheduleList.get(0).get("calendar_title")   );
		
		
		return scheduleList;
	}
	
	
	@RequestMapping(
			value="/calendarRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int insertCalendar(
			HttpSession session
			,CalendarDTO calendarDTO
			//, @RequestParam Map<String, String> paramsMap
	) {
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
		
/*
		System.out.println(   calendarDTO.getEmp_no()   );
		System.out.println(   calendarDTO.getSchedule_code()   );
		System.out.println(   calendarDTO.getCalendar_title()   );
		System.out.println(   calendarDTO.getCalendar_start_date()   );
		System.out.println(   calendarDTO.getCalendar_end_date()   );
*/		
		
		int calendarRegCnt =  0;
		
		try{
			calendarRegCnt = this.calendarService.insertCalendar(calendarDTO);		
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			calendarRegCnt = -1;
		};
		
		return calendarRegCnt;
	}
	
	

	@RequestMapping(
			value="/calendarListProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getCalendarList(
			HttpSession session
			,CalendarDTO calendarDTO
	) {
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
/*
		System.out.println(   calendarDTO.getEmp_no()   );
		System.out.println(   calendarDTO.getSchedule_code()   );
		System.out.println(   calendarDTO.getCalendar_title()   );
		System.out.println(   calendarDTO.getCalendar_start_date()   );
		System.out.println(   calendarDTO.getCalendar_end_date()   );
*/		
		
		List<Map<String,String>> calendarList =  null;
		
		try{
			calendarList = this.calendarService.getCalendarList(calendarDTO);		
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		};
		
		//System.out.println(calendarList.get(0).get("calendar_title") );		
		
		return calendarList;
	}

	
	
	@RequestMapping(
			value="/updelListProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getUpdelList(
			HttpSession session
			,CalendarDTO calendarDTO
	) {		
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
				
		List<Map<String,String>> updelList =  null;
		
		try{
			updelList = this.calendarService.getUpdelList(calendarDTO);		
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		};

		return updelList;
	}
	

	@RequestMapping(
			value="/calendarUpdateProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int updateCalendar(
			HttpSession session
			,CalendarDTO calendarDTO
			//, @RequestParam Map<String, String> paramsMap
	) {
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
		
		int calendarUpdateCnt =  0;
		
		try{
			calendarUpdateCnt = this.calendarService.updateCalendar(calendarDTO);		
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			calendarUpdateCnt = -1;
		};

		//System.out.println(calendarUpdateCnt);
		
		return calendarUpdateCnt;
	}
	


	@RequestMapping(
			value="/calendarDeleteProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int deleteCalendar(
			HttpSession session
			,CalendarDTO calendarDTO
			//, @RequestParam Map<String, String> paramsMap
	) {
		String emp_no = (String) session.getAttribute("emp_no");
		int e_no = Integer.parseInt(emp_no);
		calendarDTO.setEmp_no(e_no);
		
		int calendarDeleteCnt =  0;
		
		try{
			calendarDeleteCnt = this.calendarService.deleteCalendar(calendarDTO);		
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			calendarDeleteCnt = -1;
		};

		//System.out.println(calendarDeleteCnt);
		
		return calendarDeleteCnt;
	}
	
}
