package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface DailyDAO {

	public List<Map<String, String>> dailyListForm(DailySearchDTO dailySearchDTO);
	
	public int getBoardListAllCnt(DailySearchDTO dailySearchDTO);
	
	public DailyDTO dailyContentForm(DailyDTO dailyDTO);
	
	public int insertDaily(DailyDTO dailyDTO);
	
	public DailyDTO dailyRegForm(DailyDTO dailyDTO);
	
	public int getCheckMgrCnt(DailyDTO dailyDTO);
	
	public int getCheck_Mgr_MgrCnt(DailyDTO dailyDTO);
	
	public int insertDailySign_1(DailyDTO dailyDTO);
	
	public int insertDailySign_2(DailyDTO dailyDTO);
	
	public int insertDailySign_3(DailyDTO dailyDTO);
	
	public int dailyConfirmCnt(DailyDTO dailyDTO);
	
	public int dailyReturnCnt(DailyDTO dailyDTO);
	
	public int dailyReturn_resultCnt(DailyDTO dailyDTO);
	
	public int dailyReturn_MGR_Cnt(DailyDTO dailyDTO);
	
	public DailyDTO dailyUnderSign(DailyDTO dailyDTO);

}
