package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface SalesDAO {

	public List<Map<String, String>> salesListForm(SalesSearchDTO salesSearchDTO);
	
	public int getBoardListAllCnt(SalesSearchDTO salesSearchDTO);
	
	public SalesDTO salesContentForm(SalesDTO salesDTO);
	
	public int insertSales(SalesDTO salesDTO);
	
	public SalesDTO salesRegForm(SalesDTO salesDTO);
	
	public int getCheckMgrCnt(SalesDTO salesDTO);
	
	public int getCheck_Mgr_MgrCnt(SalesDTO salesDTO);
	
	public int insertSalesSign_1(SalesDTO salesDTO);
	
	public int insertSalesSign_2(SalesDTO salesDTO);
	
	public int insertSalesSign_3(SalesDTO salesDTO);
	
	public int salesConfirmCnt(SalesDTO salesDTO);
	
	public int salesReturnCnt(SalesDTO salesDTO);
	
	public int salesReturn_resultCnt(SalesDTO salesDTO);
	
	public int salesReturn_MGR_Cnt(SalesDTO salesDTO);
	
	public SalesDTO salesUnderSign(SalesDTO salesDTO);
	
	
	
	
}
