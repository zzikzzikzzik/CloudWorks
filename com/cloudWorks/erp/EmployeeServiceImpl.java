package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDAO employeeDAO;
	
	public List<Map<String,String>> getEmployeeList(EmployeeSearchDTO employeeSearchDTO){
		
		List<Map<String,String>> employeeList = this.employeeDAO.getEmployeeList(employeeSearchDTO);
		return employeeList;
	}
	
	public int getEmployeeListAllCnt(EmployeeSearchDTO employeeSearchDTO) {
				
		int employeeListAllCnt = this.employeeDAO.getEmployeeListAllCnt(employeeSearchDTO);
		
		//----------------------------------------------------
		// [검색한 총 게시판 목록 갯수]를 리턴
		return employeeListAllCnt;
	}
	
	public EmployeeDTO getEmployee(int emp_no) {
		EmployeeDTO employee = this.employeeDAO.getEmployee(emp_no);
				
		return employee;
		
	}
	
	public List<Map<String,String>> getBeforeAllowList(EmployeeSearchDTO employeeSearchDTO){
		List<Map<String,String>> beforeAllow = this.employeeDAO.getBeforeAllowList(employeeSearchDTO);
		return beforeAllow;
	}
	
	public int getBeforeAllowCnt(EmployeeSearchDTO employeeSearchDTO) {
		
		int beforeAllowCnt = this.employeeDAO.getBeforeAllowCnt(employeeSearchDTO);
		return beforeAllowCnt;
	}
	
	public int updateEmployee(EmployeeDTO employeeDTO) {
		
		
		
		System.out.println("employeeService.updateEmployee 진입");
		
		// 관리자 비밀번호가 맞는지 확인
		int adminCheckPwd=0;
		
		adminCheckPwd = this.employeeDAO.getAdminCheckPwd(employeeDTO);
		
		if(adminCheckPwd==0) {
			return -1;
		}
		
		int updateCnt = 0;
		
			
		
		updateCnt = this.employeeDAO.getUpdateCnt(employeeDTO);
	
		
		System.out.println("employeeService.updateEmployee 나감");
		return updateCnt;
		
	}
	
	public int deleteEmployee(EmployeeDTO employeeDTO) {
		// 관리자 비밀번호가 맞는지 확인
		int adminCheckPwd=0;
		
		adminCheckPwd = this.employeeDAO.getAdminCheckPwd(employeeDTO);
		
		if(adminCheckPwd==0) {
			return -1;
		}
		
		int manageStaffCheck=0;
		
		manageStaffCheck = this.employeeDAO.getManageStaffCheck(employeeDTO);
		
		if(manageStaffCheck!=0) {
			return -2;
		}
		
		int deleteCnt = 0;
		
		deleteCnt = this.employeeDAO.getDeleteCnt(employeeDTO);
		
		return deleteCnt;
		
	}
	
	public List<Map<String,String>> getMgrList (EmployeeDTO employeeDTO){
		List<Map<String,String>> mgrList = this.employeeDAO.getMgrList(employeeDTO);
		return mgrList;
		
	}
	

	public List<Map<String,String>> getSelectMgrList (EmployeeDTO employeeDTO){
		List<Map<String,String>> selectMgrList = this.employeeDAO.getSelectMgrList(employeeDTO);
		return selectMgrList;
	};
}
