package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpenseDAOImpl implements ExpenseDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> expenseListForm(ExpenseSearchDTO expenseSearchDTO){
		
		System.out.println(expenseSearchDTO.getSign());
		List<Map<String, String>> getExpenseList = this.sqlSession.selectList(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseListForm",
				expenseSearchDTO
				);
		
		return getExpenseList;
	}
	
	public int getBoardListAllCnt(ExpenseSearchDTO expenseSearchDTO) {
		int listAllCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.getBoardListAllCnt",
				expenseSearchDTO
				);
		
		return listAllCnt;
	}
	
	public ExpenseDTO expenseContentForm(ExpenseDTO expenseDTO) {
		ExpenseDTO getExpenseContent = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseContentForm",
				expenseDTO
				);
		
		return getExpenseContent;
		
	}
	
	public int insertExpense(ExpenseDTO expenseDTO) {
		int getInsertExpense = this.sqlSession.insert(
				"com.cloudWorks.mybatis.ExpenseDAO.insertExpense",
				expenseDTO
				);
		return getInsertExpense;
	}
	
	public ExpenseDTO expenseRegForm(ExpenseDTO expenseDTO) {
		ExpenseDTO getExpenseReg = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseRegForm",
				expenseDTO
				);
		return getExpenseReg;
	}
	
	public int getCheckMgrCnt(ExpenseDTO expenseDTO) {
		int check_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.getCheckMgrCnt",
				expenseDTO
				);
		return check_MgrCnt;
	}
	
	public int getCheck_Mgr_MgrCnt(ExpenseDTO expenseDTO) {
		int check_Mgr_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.getCheck_Mgr_MgrCnt",
				expenseDTO
				);
		return check_Mgr_MgrCnt;
	}
	
	public int insertExpenseSign_1(ExpenseDTO expenseDTO) {
		int getInsertExpenseSign_1 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.ExpenseDAO.insertExpenseSign_1",
				expenseDTO
				);
		return getInsertExpenseSign_1;
	}
	
	public int insertExpenseSign_2(ExpenseDTO expenseDTO) {
		int getInsertExpenseSign_2 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.ExpenseDAO.insertExpenseSign_2",
				expenseDTO
				);
		return getInsertExpenseSign_2;
	}
	
	public int insertExpenseSign_3(ExpenseDTO expenseDTO) {
		int getInsertExpenseSign_3 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.ExpenseDAO.insertExpenseSign_3",
				expenseDTO
				);
		return getInsertExpenseSign_3;
	}
	
	public int expenseConfirmCnt(ExpenseDTO expenseDTO) {
		int getExpenseConFirmCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseConfirmCnt",
				expenseDTO
				);
		
		return getExpenseConFirmCnt;
	}
	
	public int expenseReturnCnt(ExpenseDTO expenseDTO) {
		int getExpenseReturnCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseReturnCnt",
				expenseDTO
				);
		
		return getExpenseReturnCnt;
	}
	
	public int expenseReturn_resultCnt(ExpenseDTO expenseDTO) {
		int getExpenseReturn_resultCnt = this.sqlSession.insert(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseReturn_resultCnt",
				expenseDTO
				);
		
		return getExpenseReturn_resultCnt;
		
	}
	
	public int expenseReturn_MGR_Cnt(ExpenseDTO expenseDTO) {
		int getExpenseReturn_MGR_Cnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseReturn_MGR_Cnt",
				expenseDTO
				);
		
		return getExpenseReturn_MGR_Cnt;
	}
	
	public ExpenseDTO expenseUnderSign(ExpenseDTO expenseDTO) {
		ExpenseDTO getExpenseUnderSign = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.ExpenseDAO.expenseUnderSign",
				expenseDTO
				);
		return getExpenseUnderSign;
	}


}












