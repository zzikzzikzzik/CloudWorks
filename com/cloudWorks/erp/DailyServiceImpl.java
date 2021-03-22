package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DailyServiceImpl implements DailyService{
	
	@Autowired
	private DailyDAO dailyDAO;
	
	public List<Map<String, String>> dailyListForm(DailySearchDTO dailySearchDTO){
		List<Map<String, String>> getDailyList = this.dailyDAO.dailyListForm(dailySearchDTO);
		
		return getDailyList;
	}
	
	public int getBoardListAllCnt(DailySearchDTO dailySearchDTO) {
		int listAllCnt = this.dailyDAO.getBoardListAllCnt(dailySearchDTO);
		
		return listAllCnt;
	}
	
	public DailyDTO dailyContentForm(DailyDTO dailyDTO) {
		
		DailyDTO getDailyContent = this.dailyDAO.dailyContentForm(dailyDTO);
		
		return getDailyContent;
	}
	
	public int insertDaily(DailyDTO dailyDTO) {
		
		int getInsertDailySign_1 = 0;
		int getInsertDailySign_2 = 0;
		int getInsertDailySign_3 = 0;
		int result = 0;
		
		int getInsertDaily = this.dailyDAO.insertDaily(dailyDTO);
		
		if(getInsertDaily == 1) {
			getInsertDailySign_1 = this.dailyDAO.insertDailySign_1(dailyDTO);
			result = 1;
			
		}
		
		int check_MgrCnt = this.dailyDAO.getCheckMgrCnt(dailyDTO);
		
		if(getInsertDailySign_1 == 1 && check_MgrCnt == 1 ) {
			getInsertDailySign_2 = this.dailyDAO.insertDailySign_2(dailyDTO);
			result = 1;
		}
		
		
		int check_Mgr_MgrCnt = this.dailyDAO.getCheck_Mgr_MgrCnt(dailyDTO);
		
		if(getInsertDailySign_2 == 1 && check_Mgr_MgrCnt == 1) {
			getInsertDailySign_3 = this.dailyDAO.insertDailySign_3(dailyDTO);
			result = 1;
		}

		return result;
		
	}
	
	public DailyDTO dailyRegForm(DailyDTO dailyDTO) {
		
		DailyDTO getDailyRegForm = this.dailyDAO.dailyRegForm(dailyDTO);
		
		return getDailyRegForm;
		
	}
	
	public int dailyConfirmCnt(DailyDTO dailyDTO) {
		int getDailyConFirmCnt = this.dailyDAO.dailyConfirmCnt(dailyDTO);
		
		return getDailyConFirmCnt;
		
	}
	
	public int dailyReturnCnt(DailyDTO dailyDTO) {
		int result = 0;
		int getDailyReturn_resultCnt = 0;
		
		
		int getDailyReturnCnt = this.dailyDAO.dailyReturnCnt(dailyDTO);
		if(getDailyReturnCnt == 1) {
			getDailyReturn_resultCnt = this.dailyDAO.dailyReturn_resultCnt(dailyDTO);
			
			result = getDailyReturn_resultCnt;
		}
		
		int check_MgrCnt = this.dailyDAO.getCheckMgrCnt(dailyDTO);
		if(getDailyReturn_resultCnt == 1 && check_MgrCnt == 1) {
			
			int getDailyReturn_MGR_Cnt = this.dailyDAO.dailyReturn_MGR_Cnt(dailyDTO);
			
			result = getDailyReturn_MGR_Cnt;
		}
		
		return result;
	}
	
	
	public DailyDTO dailyUnderSign(DailyDTO dailyDTO) {
		DailyDTO getDailyUnderSign = this.dailyDAO.dailyUnderSign(dailyDTO);
		
		return getDailyUnderSign;
	}
	
	
	public int getCheckMgrCnt(DailyDTO dailyDTO) {
		int check_MgrCnt = this.dailyDAO.getCheckMgrCnt(dailyDTO);
		return check_MgrCnt;
	}
	
	public int getCheck_Mgr_MgrCnt(DailyDTO dailyDTO) {
		int check_Mgr_MgrCnt = this.dailyDAO.getCheck_Mgr_MgrCnt(dailyDTO);
		return check_Mgr_MgrCnt;
	}
	
	
	
	
}
