package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class JoinServiceImpl implements JoinService {
	
	@Autowired 
	private JoinDAO joinDAO;
	
	// 회원가입을 하는 메소드
	public int getjoinCnt(JoinDTO joinDTO) {
	
		// 회원가입을 하기 위해 DAO 호출
		int joinCnt = this.joinDAO.getjoinCnt(joinDTO);	
		return joinCnt;
	}
	

	public int getEmp_no(JoinDTO joinDTO) {
		int emp_no = this.joinDAO.getEmp_no(joinDTO);	
		return emp_no;
	};


}


