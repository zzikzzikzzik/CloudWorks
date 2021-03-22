package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface CalendarDAO {
	public List<Map<String,String>> getScheduleList(CalendarDTO calendarDTO);
	
	public int insertCalendar(CalendarDTO calendarDTO);
	
	public List<Map<String,String>> getCalendarList(CalendarDTO calendarDTO);
	
	public List<Map<String,String>> getUpdelList(CalendarDTO calendarDTO);

	public int getCalendarCnt(CalendarDTO calendarDTO);
	
	public int updateCalendar(CalendarDTO calendarDTO);
	
	public int deleteCalendar(CalendarDTO calendarDTO);
}
