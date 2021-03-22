package com.cloudWorks.erp;

public class DashboardDTO {
	private String emp_no;

	private int reportSignCnt;

	private int reportType;
	
	private int reportTypeYear;
	
	private int reportSignState;
	
	private int signUpReportYear;
	
	private String SignUpReportMonth;

	public int getReportSignCnt() {
		return reportSignCnt;
	}

	public void setReportSignCnt(int reportSignCnt) {
		this.reportSignCnt = reportSignCnt;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public int getReportTypeYear() {
		return reportTypeYear;
	}

	public void setReportTypeYear(int reportTypeYear) {
		this.reportTypeYear = reportTypeYear;
	}

	public int getReportSignState() {
		return reportSignState;
	}

	public void setReportSignState(int reportSignState) {
		this.reportSignState = reportSignState;
	}

	public int getSignUpReportYear() {
		return signUpReportYear;
	}

	public void setSignUpReportYear(int signUpReportYear) {
		this.signUpReportYear = signUpReportYear;
	}

	public String getSignUpReportMonth() {
		return SignUpReportMonth;
	}

	public void setSignUpReportMonth(String signUpReportMonth) {
		SignUpReportMonth = signUpReportMonth;
	}
	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

}
