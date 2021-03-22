package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface ExpenseService {
	
	public List<Map<String, String>> expenseListForm(ExpenseSearchDTO expenseSearchDTO);
	
	public int getBoardListAllCnt(ExpenseSearchDTO expenseSearchDTO);
	
	public ExpenseDTO expenseContentForm(ExpenseDTO expenseDTO);
	
	public int insertExpense(ExpenseDTO expenseDTO);
	
	public ExpenseDTO expenseRegForm(ExpenseDTO expenseDTO);
	
	public int expenseConfirmCnt(ExpenseDTO expenseDTO);
	
	public int expenseReturnCnt(ExpenseDTO expenseDTO);
	
	public ExpenseDTO expenseUnderSign(ExpenseDTO expenseDTO);
	
	public int getCheckMgrCnt(ExpenseDTO expenseDTO);
	
	public int getCheck_Mgr_MgrCnt(ExpenseDTO expenseDTO);
	
	
	

}
