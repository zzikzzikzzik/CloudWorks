package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public int getEmpNoCnt(LoginDTO loginDTO) {
		
		int empCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.LoginDAO.getEmpNoCnt"	
				, loginDTO								
		);
		
		int getAdminCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.LoginDAO.getAdminCnt"
				, loginDTO
		);
		
		int getNotAllowCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.LoginDAO.getNotAllowCnt"
				, loginDTO
		);
		
		if(getAdminCnt==1) {
			return 2;			
		}
		if(getNotAllowCnt==1) {
			return 3;			
		}	

		return empCnt;
		
	}
}
