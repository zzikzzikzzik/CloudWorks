package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {

	
	@Autowired
	private CalendarDAO calendarDAO;
	
	public List<Map<String,String>> getScheduleList(CalendarDTO calendarDTO) {
		List<Map<String,String>> scheduleList = this.calendarDAO.getScheduleList(calendarDTO);				
		return scheduleList;
	}
	
	public int insertCalendar(CalendarDTO calendarDTO) {
		int calendarRegCnt = this.calendarDAO.insertCalendar(calendarDTO);
		return calendarRegCnt;
	}
	

	public List<Map<String,String>> getCalendarList(CalendarDTO calendarDTO){
		List<Map<String,String>> calendarList = this.calendarDAO.getCalendarList(calendarDTO);				
		return calendarList;
	}
	
	public List<Map<String,String>> getUpdelList(CalendarDTO calendarDTO){
		List<Map<String,String>> updelList = this.calendarDAO.getUpdelList(calendarDTO);				
		return updelList;
	};
	
	public int updateCalendar(CalendarDTO calendarDTO) {
		int calendarCnt = this.calendarDAO.getCalendarCnt(calendarDTO);
		if(calendarCnt==0) {return -2;}
		
		int calendarUpdateCnt = this.calendarDAO.updateCalendar(calendarDTO);
		return calendarUpdateCnt;
	}
	
	public int deleteCalendar(CalendarDTO calendarDTO) {
		int calendarCnt = this.calendarDAO.getCalendarCnt(calendarDTO);
		if(calendarCnt==0) {return -2;}
		
		int calendarDeleteCnt = this.calendarDAO.deleteCalendar(calendarDTO);
		return calendarDeleteCnt;
	}
}