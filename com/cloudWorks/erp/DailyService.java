package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface DailyService {
	
	List<Map<String, String>> dailyListForm(DailySearchDTO dailySearchDTO);
	
	int getBoardListAllCnt(DailySearchDTO dailySearchDTO);
	
	DailyDTO dailyContentForm(DailyDTO dailyDTO);
	
	public int insertDaily(DailyDTO dailyDTO);
	
	public DailyDTO dailyRegForm(DailyDTO dailyDTO);
	
	public int dailyConfirmCnt(DailyDTO dailyDTO);
	
	public int dailyReturnCnt(DailyDTO dailyDTO);
	
	DailyDTO dailyUnderSign(DailyDTO dailyDTO);
	
	int getCheckMgrCnt(DailyDTO dailyDTO);
	
	int getCheck_Mgr_MgrCnt(DailyDTO dailyDTO);
}
