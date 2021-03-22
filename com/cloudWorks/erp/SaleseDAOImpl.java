package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SaleseDAOImpl implements SalesDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> salesListForm(SalesSearchDTO salesSearchDTO){
		List<Map<String, String>> getSalesList = this.sqlSession.selectList(
				"com.cloudWorks.mybatis.SalesDAO.salesListForm",
				salesSearchDTO
		);
		return getSalesList;
	}
	
	public int getBoardListAllCnt(SalesSearchDTO salesSearchDTO) {
		int listAllCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.getBoardListAllCnt",
				salesSearchDTO
		);
		
		return listAllCnt;
	}
	
	public SalesDTO salesContentForm(SalesDTO salesDTO) {
		SalesDTO getSalesContent = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.salesContentForm",
				salesDTO
		);
		return getSalesContent;
	}
	
	public int insertSales(SalesDTO salesDTO) {
		System.out.println(salesDTO.getSales_date_start());
		System.out.println(salesDTO.getSales_date_end());
		int getInsertSales = 0;
		try {
			getInsertSales = this.sqlSession.insert(
				"com.cloudWorks.mybatis.SalesDAO.insertSales",
				salesDTO
				);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return getInsertSales;
	}
	
	public SalesDTO salesRegForm(SalesDTO salesDTO) {
		SalesDTO getSalesReg = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.salesRegForm",
				salesDTO
				);
		
		return getSalesReg;
	}
	
	public int getCheckMgrCnt(SalesDTO salesDTO) {
		int check_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.getCheckMgrCnt",
				salesDTO
				);
		return check_MgrCnt;
		
	}
	
	public int getCheck_Mgr_MgrCnt(SalesDTO salesDTO) {
		int check_Mgr_MgrCnt = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.getCheck_Mgr_MgrCnt",
				salesDTO
				);
		return check_Mgr_MgrCnt;
	}
	public int insertSalesSign_1(SalesDTO salesDTO) {
		int getInsertSalesSign_1 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.SalesDAO.insertSalesSign_1",
				salesDTO
				);
		return getInsertSalesSign_1;
	}
	
	public int insertSalesSign_2(SalesDTO salesDTO) {
		int getInsertSalesSign_2 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.SalesDAO.insertSalesSign_2",
				salesDTO
				);
		return getInsertSalesSign_2;
	}
	
	public int insertSalesSign_3(SalesDTO salesDTO) {
		int getInsertSalesSign_3 = this.sqlSession.insert(
				"com.cloudWorks.mybatis.SalesDAO.insertSalesSign_3",
				salesDTO
				);
		return getInsertSalesSign_3;
	}
	
	public int salesConfirmCnt(SalesDTO salesDTO) {
		
		int getSalesConfirmCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.SalesDAO.salesConfirmCnt",
				salesDTO
				);
		
		return getSalesConfirmCnt;
	}
	
	public int salesReturnCnt(SalesDTO salesDTO) {
		int getSalesReturnCnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.SalesDAO.salesReturnCnt",
				salesDTO
				);
		
		return getSalesReturnCnt;
	}
	
	public int salesReturn_resultCnt(SalesDTO salesDTO) {
		int getSalesReturn_resultCnt = this.sqlSession.insert(
				"com.cloudWorks.mybatis.SalesDAO.salesReturn_resultCnt",
				salesDTO
				);
		
		return getSalesReturn_resultCnt;
		
	}
	
	public int salesReturn_MGR_Cnt(SalesDTO salesDTO) {
		int getSalesReturn_MGR_Cnt = this.sqlSession.update(
				"com.cloudWorks.mybatis.SalesDAO.salesReturn_MGR_Cnt",
				salesDTO
				);
		
		return getSalesReturn_MGR_Cnt;
	}
	
	public SalesDTO salesUnderSign(SalesDTO salesDTO) {
		SalesDTO getSalesUnderSign = this.sqlSession.selectOne(
				"com.cloudWorks.mybatis.SalesDAO.salesUnderSign",
				salesDTO
				);
		return getSalesUnderSign;
	}
	


}















