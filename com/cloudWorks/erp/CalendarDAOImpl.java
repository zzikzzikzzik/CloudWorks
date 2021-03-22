package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAOImpl implements CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	public List<Map<String,String>> getScheduleList(CalendarDTO calendarDTO) {
		List<Map<String,String>> scheduleList = this.sqlSession.selectList(
			"com.cloudWorks.erp.CalendarDAO.getScheduleList"	
			,calendarDTO							 
		);
		
		return scheduleList;
	}
	
	public int insertCalendar(CalendarDTO calendarDTO) {		
		int calendarRegCnt = this.sqlSession.insert(
			"com.cloudWorks.erp.CalendarDAO.insertCalendar"	
			,calendarDTO							 
		);
		
		return calendarRegCnt;
	}
	
	public List<Map<String,String>> getCalendarList(CalendarDTO calendarDTO){
		List<Map<String,String>> calendarList = this.sqlSession.selectList(
			"com.cloudWorks.erp.CalendarDAO.getCalendarList"	
			,calendarDTO							 
		);
		
		return calendarList;
	}

	public List<Map<String,String>> getUpdelList(CalendarDTO calendarDTO){
		List<Map<String,String>> updelList = this.sqlSession.selectList(
			"com.cloudWorks.erp.CalendarDAO.getUpdelList"	
			,calendarDTO							 
		);
		
		return updelList;
	}

	public int getCalendarCnt(CalendarDTO calendarDTO) {
		int calendarCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.CalendarDAO.getCalendarCnt"
				, calendarDTO
		);
		return calendarCnt;
	};
	
	public int updateCalendar(CalendarDTO calendarDTO) {		
		int calendarUpdateCnt = this.sqlSession.update(
			"com.cloudWorks.erp.CalendarDAO.updateCalendar"	
			,calendarDTO							 
		);
		
		return calendarUpdateCnt;
	}
	
	public int deleteCalendar(CalendarDTO calendarDTO) {		
		int calendarDeleteCnt = this.sqlSession.delete(
				"com.cloudWorks.erp.CalendarDAO.deleteCalendar"	
				,calendarDTO							 
			);
			
			return calendarDeleteCnt;
		}
	
}
