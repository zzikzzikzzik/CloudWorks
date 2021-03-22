package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DailyDAOImpl implements DailyDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> dailyListForm(DailySearchDTO dailySearchDTO){
		System.out.println(dailySearchDTO.getSign());
		System.out.println(dailySearchDTO.getSign_search());
		List<Map<String, String>> getDailyList = this.sqlSession.selectList(
				"com.cloudWorks.mybatis.DailyDAO.dailyListForm",
				dailySearchDTO
	);
		
		return getDailyList;
	}
	
	public int getBoardListAllCnt(DailySearchDTO dailySearchDTO) {
		int listAllCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.getBoardListAllCnt",
				dailySearchDTO
		);
		
		return listAllCnt;
	}
	
	public DailyDTO dailyContentForm(DailyDTO dailyDTO) {
		
		DailyDTO getDailyContent = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.dailyContentForm",
				dailyDTO
		);
		
		return getDailyContent;
	}
	
	public int insertDaily(DailyDTO dailyDTO) {

		int getInsertDaily = 0;
		try {
		       getInsertDaily = this.sqlSession.insert(
				"com.cloudWorks.mybatis.DailyDAO.insertDaily",
				dailyDTO
				);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return getInsertDaily;
	}
	
	public DailyDTO dailyRegForm(DailyDTO dailyDTO) {
		
		DailyDTO getDailyRegForm = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.dailyRegForm",
				dailyDTO
				);
		
		return getDailyRegForm;
	}
	
	public int getCheckMgrCnt(DailyDTO dailyDTO) {
		int check_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.getCheckMgrCnt",
				dailyDTO
				);
		return check_MgrCnt;
	}
	
	public int getCheck_Mgr_MgrCnt(DailyDTO dailyDTO) {
		int check_Mgr_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.getCheck_Mgr_MgrCnt",
				dailyDTO
				);
		return check_Mgr_MgrCnt;
	}
	
	public int insertDailySign_1(DailyDTO dailyDTO) {
		int getInsertDailySign_1 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.DailyDAO.insertDailySign_1",
				dailyDTO
				);
		return getInsertDailySign_1;
	}
	
	public int insertDailySign_2(DailyDTO dailyDTO) {
		int getInsertDailySign_2 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.DailyDAO.insertDailySign_2",
				dailyDTO
				);
		return getInsertDailySign_2;
	}
	
	public int insertDailySign_3(DailyDTO dailyDTO) {
		int getInsertDailySign_3 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.DailyDAO.insertDailySign_3",
				dailyDTO
				);
		return getInsertDailySign_3;
	}
	
	public int dailyConfirmCnt(DailyDTO dailyDTO) {

		int getDailyConFirmCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.DailyDAO.dailyConfirmCnt",
				dailyDTO
				);
		
		return getDailyConFirmCnt;
	}
	
	public int dailyReturnCnt(DailyDTO dailyDTO) {
		int getDailyReturnCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.DailyDAO.dailyReturnCnt",
				dailyDTO
				);
		
		return getDailyReturnCnt;
	}
	
	public int dailyReturn_resultCnt(DailyDTO dailyDTO) {
		int getdailyReturn_resultCnt = this.sqlSession.insert(
				"com.cloudWorks.mybatis.DailyDAO.dailyReturn_resultCnt",
				dailyDTO
				);
		
		return getdailyReturn_resultCnt;
		
	}
	
	public int dailyReturn_MGR_Cnt(DailyDTO dailyDTO) {
		int getDailyReturn_MGR_Cnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.DailyDAO.dailyReturn_MGR_Cnt",
				dailyDTO
				);
		
		return getDailyReturn_MGR_Cnt;
	}
	
	public DailyDTO dailyUnderSign(DailyDTO dailyDTO) {
		DailyDTO getDailyUnderSign = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.DailyDAO.dailyUnderSign",
				dailyDTO
				);
		return getDailyUnderSign;
	}
	
	

}















