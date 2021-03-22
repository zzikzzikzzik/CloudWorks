package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	public MypageDTO getMypage(MypageDTO mypageDTO) {
		
		MypageDTO mypage = this.sqlSession.selectOne(
				"com.cloudWorks.erp.MypageDAO.getMypage"
				, mypageDTO
		);
		return mypage;
	}
	
	public int getMypageCnt(MypageDTO mypageDTO) {
		
		int mypageCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.MypageDAO.getMypageCnt"
				, mypageDTO
		);
		return mypageCnt;
	};	
	
	public int updateMypage(MypageDTO mypageDTO) {
		
		int updateCnt = this.sqlSession.update(
				"com.cloudWorks.erp.MypageDAO.updateMypage"
				, mypageDTO
		);
		return updateCnt;
	};			
	
	
	/*
	public int getUpdateCnt(MypageDTO mypageDTO) {

		
		int updateCnt = this.sqlSession.update(
				"com.cloudWorks.erp.MypageDAO.updateMypage"
				, mypageDTO
		);
		System.out.println(" 다오 나감");
		return updateCnt;	
	}
	
	public int getCheckEmpCnt(MypageDTO mypageDTO) {
		
		System.out.println(" 다오 selectOne 진입");
		int checkEmpCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.MypageDAO.checkEmpCnt"
				, mypageDTO
		);
		System.out.println(" 다오 selectOne 나감");
		return checkEmpCnt;
	}
	
	*/
	
}
