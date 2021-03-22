package com.cloudWorks.erp;

import java.util.*;

public interface EmployeeDAO {
	List<Map<String,String>> getEmployeeList(EmployeeSearchDTO employeesearchDTO);
	
	int getEmployeeListAllCnt(EmployeeSearchDTO employeesearchDTO);
	
	EmployeeDTO getEmployee(int emp_no);
	
	List<Map<String,String>> getBeforeAllowList(EmployeeSearchDTO employeesearchDTO);
	
	int getBeforeAllowCnt(EmployeeSearchDTO employeesearchDTO);
	
	int getUpdateCnt(EmployeeDTO employeeDTO);
	
	int getAdminCheckPwd(EmployeeDTO employeeDTO);
	
	int getDeleteCnt(EmployeeDTO employeeDTO);
	
	List<Map<String,String>> getMgrList(EmployeeDTO employeeDTO);
	
	public int getManageStaffCheck(EmployeeDTO employeeDTO);

	public List<Map<String,String>> getSelectMgrList (EmployeeDTO employeeDTO);
}
