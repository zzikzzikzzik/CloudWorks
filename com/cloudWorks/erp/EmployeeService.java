package com.cloudWorks.erp;

import java.util.*;

public interface EmployeeService {
	List<Map<String,String>> getEmployeeList(EmployeeSearchDTO employeeSearchDTO);
	
	
	int getEmployeeListAllCnt(EmployeeSearchDTO employeeSearchDTO);
	
	public EmployeeDTO getEmployee(int emp_no);
	
	List<Map<String,String>> getBeforeAllowList(EmployeeSearchDTO employeeSearchDTO);
	
	int getBeforeAllowCnt(EmployeeSearchDTO employeeSearchDTO);
	
	int updateEmployee(EmployeeDTO employeeDTO);
	
	int deleteEmployee(EmployeeDTO employeeDTO);
	
	public List<Map<String,String>> getMgrList (EmployeeDTO employeeDTO);
	
	public List<Map<String,String>> getSelectMgrList (EmployeeDTO employeeDTO);
}
