package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface SalesService {
	
	public List<Map<String, String>> salesListForm(SalesSearchDTO salesSearchDTO);
	
	public int getBoardListAllCnt(SalesSearchDTO salesSearchDTO);
	
	public SalesDTO salesContentForm(SalesDTO salesDTO);
	
	public int insertSales(SalesDTO salesDTO);
	
	public SalesDTO salesRegForm(SalesDTO salesDTO);
	
	public int salesConfirmCnt(SalesDTO salesDTO);
	
	public int salesReturnCnt(SalesDTO salesDTO);
	
	public SalesDTO salesUnderSign(SalesDTO salesDTO);
	
	public int getCheckMgrCnt(SalesDTO salesDTO);
	
	public int getCheck_Mgr_MgrCnt(SalesDTO salesDTO);
	
	

}
