package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface ExpenseDAO {
	
	public List<Map<String, String>> expenseListForm(ExpenseSearchDTO expenseSearchDTO);
	
	public int getBoardListAllCnt(ExpenseSearchDTO expenseSearchDTO);
	
	public ExpenseDTO expenseContentForm(ExpenseDTO expenseDTO);
	
	public int insertExpense(ExpenseDTO expenseDTO);
	
	public ExpenseDTO expenseRegForm(ExpenseDTO expenseDTO);
	
	public int getCheckMgrCnt(ExpenseDTO expenseDTO);
	
	public int getCheck_Mgr_MgrCnt(ExpenseDTO expenseDTO);
	
	public int insertExpenseSign_1(ExpenseDTO expenseDTO);
	
	public int insertExpenseSign_2(ExpenseDTO expenseDTO);
	
	public int insertExpenseSign_3(ExpenseDTO expenseDTO);
	
	public int expenseConfirmCnt(ExpenseDTO expenseDTO);
	
	public int expenseReturnCnt(ExpenseDTO dailyDTO);
	
	public int expenseReturn_resultCnt(ExpenseDTO expenseDTO);
	
	public int expenseReturn_MGR_Cnt(ExpenseDTO expenseDTO);
	
	public ExpenseDTO expenseUnderSign(ExpenseDTO expenseDTO);
	

}
