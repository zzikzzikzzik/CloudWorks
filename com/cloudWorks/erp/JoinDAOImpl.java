package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class JoinDAOImpl implements JoinDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
		// 회원가입을 하는 메소드
		public int getjoinCnt(JoinDTO joinDTO) {
			int joinCnt = this.sqlsession.insert(
					"com.cloudWorks.erp.JoinDAO.getjoinCnt",
					joinDTO
			);
			return joinCnt;
		}
		

		public int getEmp_no(JoinDTO joinDTO) {
			int emp_no = this.sqlsession.selectOne(
					"com.cloudWorks.erp.JoinDAO.getEmp_no",
					joinDTO
			);
			return emp_no;
		}
		
	}

