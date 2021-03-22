package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	private ExpenseDAO expenseDAO;
	
	public List<Map<String, String>> expenseListForm(ExpenseSearchDTO expenseSearchDTO){
		List<Map<String, String>> getExpenseList = this.expenseDAO.expenseListForm(expenseSearchDTO);
		
		return getExpenseList;
	}
	
	public int getBoardListAllCnt(ExpenseSearchDTO expenseSearchDTO) {
		int listAllCnt = this.expenseDAO.getBoardListAllCnt(expenseSearchDTO);
		
		return listAllCnt;
	}
	
	public ExpenseDTO expenseContentForm(ExpenseDTO expenseDTO) {
		
		ExpenseDTO getExpenseContent = this.expenseDAO.expenseContentForm(expenseDTO);
		
		return getExpenseContent;
	}
	
	public int insertExpense(ExpenseDTO expenseDTO) {
		
		int getInsertExpenseSign_1 = 0;
		int getInsertExpenseSign_2 = 0;
		int getInsertExpenseSign_3 = 0;
		int result = 0;
		
		int getInsertExpense = this.expenseDAO.insertExpense(expenseDTO);
		
		if(getInsertExpense == 1) {
			getInsertExpenseSign_1 = this.expenseDAO.insertExpenseSign_1(expenseDTO);
			result = 1;
			
		}
		
		int check_MgrCnt = this.expenseDAO.getCheckMgrCnt(expenseDTO);
		
		if(getInsertExpenseSign_1 == 1 && check_MgrCnt == 1 ) {
			getInsertExpenseSign_2 = this.expenseDAO.insertExpenseSign_2(expenseDTO);
			result = 1;
		}
		
		
		int check_Mgr_MgrCnt = this.expenseDAO.getCheck_Mgr_MgrCnt(expenseDTO);
		
		if(getInsertExpenseSign_2 == 1 && check_Mgr_MgrCnt == 1) {
			getInsertExpenseSign_3 = this.expenseDAO.insertExpenseSign_3(expenseDTO);
			result = 1;
		}
		
		
		return result;
	}
	
	public ExpenseDTO expenseRegForm(ExpenseDTO expenseDTO) {
		ExpenseDTO getExpenseReg = this.expenseDAO.expenseRegForm(expenseDTO);
		
		return getExpenseReg;
	}
	
	public int expenseConfirmCnt(ExpenseDTO expenseDTO) {
		int getExpenseConFirmCnt = this.expenseDAO.expenseConfirmCnt(expenseDTO);
		
		return getExpenseConFirmCnt;
	}
	
	public int expenseReturnCnt(ExpenseDTO expenseDTO) {
		int result = 0;
		int getExpenseReturn_resultCnt = 0;
		
		
		int getExpenseReturnCnt = this.expenseDAO.expenseReturnCnt(expenseDTO);
		if(getExpenseReturnCnt == 1) {
			getExpenseReturn_resultCnt = this.expenseDAO.expenseReturn_resultCnt(expenseDTO);
			
			result = getExpenseReturn_resultCnt;
		}
		
		int check_MgrCnt = this.expenseDAO.getCheckMgrCnt(expenseDTO);
		if(getExpenseReturn_resultCnt == 1 && check_MgrCnt == 1) {
			
			int getExpenseReturn_MGR_Cnt = this.expenseDAO.expenseReturn_MGR_Cnt(expenseDTO);
			
			result = getExpenseReturn_MGR_Cnt;
		}
		
		return result;
	}
	
	public ExpenseDTO expenseUnderSign(ExpenseDTO expenseDTO) {
		ExpenseDTO getExpenseUnderSign = this.expenseDAO.expenseUnderSign(expenseDTO);
		
		return getExpenseUnderSign;
	}
	
	public int getCheckMgrCnt(ExpenseDTO expenseDTO) {
		int check_MgrCnt = this.expenseDAO.getCheckMgrCnt(expenseDTO);
		return check_MgrCnt;
	}
	
	public int getCheck_Mgr_MgrCnt(ExpenseDTO expenseDTO) {
		int check_Mgr_MgrCnt = this.expenseDAO.getCheck_Mgr_MgrCnt(expenseDTO);
		return check_Mgr_MgrCnt;
	}

	
}







