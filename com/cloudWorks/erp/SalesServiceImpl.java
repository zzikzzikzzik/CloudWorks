package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SalesServiceImpl implements SalesService{
	
	@Autowired
	private SalesDAO salesDAO;
	
	public List<Map<String, String>> salesListForm(SalesSearchDTO salesSearchDTO){
		List<Map<String, String>> getSalesList = this.salesDAO.salesListForm(salesSearchDTO);
		
		return getSalesList;
	}
	
	public int getBoardListAllCnt(SalesSearchDTO salesSearchDTO) {
		int listAllCnt = this.salesDAO.getBoardListAllCnt(salesSearchDTO);
		
		return listAllCnt;
	}
	
	public SalesDTO salesContentForm(SalesDTO salesDTO) {
		SalesDTO getSalesContent = this.salesDAO.salesContentForm(salesDTO);
		
		return getSalesContent;
	}
	
	public int insertSales(SalesDTO salesDTO) {
		
		int getInsertSalesSign_1 = 0;
		int getInsertSalesSign_2 = 0;
		int getInsertSalesSign_3 = 0;
		int result = 0;
		
		int getInsertSales = this.salesDAO.insertSales(salesDTO);
		
		if(getInsertSales == 1) {
			getInsertSalesSign_1 = this.salesDAO.insertSalesSign_1(salesDTO);
			result = 1;
			
		}
		
		int check_MgrCnt = this.salesDAO.getCheckMgrCnt(salesDTO);
		
		if(getInsertSalesSign_1 == 1 && check_MgrCnt == 1 ) {
			getInsertSalesSign_2 = this.salesDAO.insertSalesSign_2(salesDTO);
			result = 1;
		}
		
		
		int check_Mgr_MgrCnt = this.salesDAO.getCheck_Mgr_MgrCnt(salesDTO);
		
		if(getInsertSalesSign_2 == 1 && check_Mgr_MgrCnt == 1) {
			getInsertSalesSign_3 = this.salesDAO.insertSalesSign_3(salesDTO);
			result = 1;
		}
		
		
		return result;
	}
	
	public SalesDTO salesRegForm(SalesDTO salesDTO) {
		SalesDTO getSalesReg = this.salesDAO.salesRegForm(salesDTO);
		
		return getSalesReg;
	}
	
	public int salesConfirmCnt(SalesDTO salesDTO) {
		
		int getSalesConfirmCnt = this.salesDAO.salesConfirmCnt(salesDTO);
		
		return getSalesConfirmCnt;
	}
	
	public int salesReturnCnt(SalesDTO salesDTO) {
		int result = 0;
		int getSalesReturn_resultCnt = 0;
		
		
		int getSalesReturnCnt = this.salesDAO.salesReturnCnt(salesDTO);
		if(getSalesReturnCnt == 1) {
			getSalesReturn_resultCnt = this.salesDAO.salesReturn_resultCnt(salesDTO);
			
			result = getSalesReturn_resultCnt;
		}
		
		int check_MgrCnt = this.salesDAO.getCheckMgrCnt(salesDTO);
		if(getSalesReturn_resultCnt == 1 && check_MgrCnt == 1) {
			
			int getSalesReturn_MGR_Cnt = this.salesDAO.salesReturn_MGR_Cnt(salesDTO);
			
			result = getSalesReturn_MGR_Cnt;
		}
		
		return result;
	}
	
	public SalesDTO salesUnderSign(SalesDTO salesDTO) {
		SalesDTO getSalesUnderSign = this.salesDAO.salesUnderSign(salesDTO);
		
		return getSalesUnderSign;
	}
	
	public int getCheckMgrCnt(SalesDTO salesDTO) {
		int check_MgrCnt = this.salesDAO.getCheckMgrCnt(salesDTO);
		return check_MgrCnt;
	}
	
	public int getCheck_Mgr_MgrCnt(SalesDTO salesDTO) {
		int check_Mgr_MgrCnt = this.salesDAO.getCheck_Mgr_MgrCnt(salesDTO);
		return check_Mgr_MgrCnt;
	}

}
