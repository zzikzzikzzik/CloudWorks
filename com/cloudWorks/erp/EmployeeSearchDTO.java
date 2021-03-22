package com.cloudWorks.erp;

public class EmployeeSearchDTO {
	
	private String keyword1;
	private int selectPageNo= 1;
	private int rowCntPerPage= 10;
	
	private String orderby;
	
	
	
	private String selectDepNo="";
	private String selectJikupCode="";
	
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	public String getSelectDepNo() {
		return selectDepNo;
	}
	public void setSelectDepNo(String selectDepNo) {
		this.selectDepNo = selectDepNo;
	}
	public String getSelectJikupCode() {
		return selectJikupCode;
	}
	public void setSelectJikupCode(String selectJikupCode) {
		this.selectJikupCode = selectJikupCode;
	}
	
	
	
	
	
	
}
