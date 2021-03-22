package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;
	
	public int getEmpNoCnt(LoginDTO loginDTO) {
			int empCnt = this.loginDAO.getEmpNoCnt(loginDTO);
			
			
			return empCnt;
			
		}
}
