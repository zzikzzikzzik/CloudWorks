package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface JoinDAO {
	
		// 회원가입을 하는 메소드
		public int getjoinCnt(JoinDTO joinDTO);

		public int getEmp_no(JoinDTO joinDTO);
		
	}
