package com.cloudWorks.erp;

public class SalesSearchDTO {
	private Object emp_no;
	private String begin_year;
	private String begin_month;
	private String end_year;
	private String end_month;
	private String sales_type_code;
	private String sign;
	private String report_name;
	private int selectPageNo = 1;
	private int rowCntPerPage = 10;
	private String order;
	private String mgr_sign_name;
	private String mgr_mgr_sign_name;
	public Object getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(Object emp_no) {
		this.emp_no = emp_no;
	}
	public String getBegin_year() {
		return begin_year;
	}
	public void setBegin_year(String begin_year) {
		this.begin_year = begin_year;
	}
	public String getBegin_month() {
		return begin_month;
	}
	public void setBegin_month(String begin_month) {
		this.begin_month = begin_month;
	}
	public String getEnd_year() {
		return end_year;
	}
	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}
	public String getEnd_month() {
		return end_month;
	}
	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}
	public String getSales_type_code() {
		return sales_type_code;
	}
	public void setSales_type_code(String sales_type_code) {
		this.sales_type_code = sales_type_code;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
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
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getMgr_sign_name() {
		return mgr_sign_name;
	}
	public void setMgr_sign_name(String mgr_sign_name) {
		this.mgr_sign_name = mgr_sign_name;
	}
	public String getMgr_mgr_sign_name() {
		return mgr_mgr_sign_name;
	}
	public void setMgr_mgr_sign_name(String mgr_mgr_sign_name) {
		this.mgr_mgr_sign_name = mgr_mgr_sign_name;
	}
	
	
	
	
	
}
