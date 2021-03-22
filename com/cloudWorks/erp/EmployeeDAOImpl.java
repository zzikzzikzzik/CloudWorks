package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EmployeeDAOImpl implements EmployeeDAO{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String,String>> getEmployeeList(EmployeeSearchDTO employeeSearchDTO) {
			
			List<Map<String,String>> employeeList = this.sqlSession.selectList(
					"com.cloudWorks.erp.EmployeeDAO.getEmployeeList"	// 실행할 SQL 구문의 위치 지정
					, employeeSearchDTO						
			);
			
			return employeeList;
		}
	
	public int getEmployeeListAllCnt(EmployeeSearchDTO employeeSearchDTO) {
		int employeeListCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.EmployeeDAO.getEmployeeListAllCnt"			// 실행할 SQL 구문의 위치 지정
				, employeeSearchDTO									// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return employeeListCnt;	
		
	}
	
	public EmployeeDTO getEmployee(int emp_no) {
		
		EmployeeDTO empolyee = this.sqlSession.selectOne(
				"com.cloudWorks.erp.EmployeeDAO.getEmployee"
				, emp_no
		);
		return empolyee;
	}
	
	public List<Map<String,String>> getBeforeAllowList(EmployeeSearchDTO employeesearchDTO){
		List<Map<String,String>> beforeAllowList = this.sqlSession.selectList(
				"com.cloudWorks.erp.EmployeeDAO.getBeforeAllowList"	// 실행할 SQL 구문의 위치 지정
				, employeesearchDTO						
		);
		
		return beforeAllowList;
	}
	
	public int getBeforeAllowCnt(EmployeeSearchDTO employeesearchDTO) {
		int beforeAllowCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.EmployeeDAO.getBeforeAllowCnt"			// 실행할 SQL 구문의 위치 지정
				, employeesearchDTO									// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return beforeAllowCnt;	
	}
	
	
	// emp_no, new_emp_no 겹치는지 확인
	public int getAdminCheckPwd(EmployeeDTO employeeDTO) {
		
		int checkCnt = this.sqlSession.selectOne(
				"com.cloudWorks.erp.EmployeeDAO.getEmpPwdCnt"
				, employeeDTO
		);
				
		return checkCnt;
		
	}
	
	public int getUpdateCnt(EmployeeDTO employeeDTO) {
		
		System.out.println("employeeDAO.getUpdateCnt 진입");
		
		int updateCnt = this.sqlSession.update(
				"com.cloudWorks.erp.EmployeeDAO.updateEmployee"
				, employeeDTO	
		);
		
		System.out.println("employeeDAO.getUpdateCnt 나감");

		return updateCnt;
	}
	
	public int getManageStaffCheck(EmployeeDTO employeeDTO) {
		
		int staffCheck = this.sqlSession.selectOne(
				"com.cloudWorks.erp.EmployeeDAO.getStaffCnt"
				, employeeDTO	
		);
				
		return staffCheck;
	}
	
	public int getDeleteCnt(EmployeeDTO employeeDTO) {
		
		int deleteCnt = this.sqlSession.delete(
				"com.cloudWorks.erp.EmployeeDAO.DeleteEmployee"
				, employeeDTO
		);
				
		return deleteCnt;
	}
	
	public List<Map<String,String>> getMgrList(EmployeeDTO employeeDTO){
		List<Map<String,String>> mgrList = this.sqlSession.selectList(
				"com.cloudWorks.erp.EmployeeDAO.getMgrList"	// 실행할 SQL 구문의 위치 지정
				, employeeDTO						
		);
		
		return mgrList;
	}
	

	public List<Map<String,String>> getSelectMgrList (EmployeeDTO employeeDTO){
		List<Map<String,String>> selectMgrList = this.sqlSession.selectList(
				"com.cloudWorks.erp.EmployeeDAO.getSelectMgrList"	// 실행할 SQL 구문의 위치 지정
				, employeeDTO						
		);
		
		return selectMgrList;
	}
	
}
