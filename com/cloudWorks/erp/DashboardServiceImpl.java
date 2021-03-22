package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	private DashboardDAO dashboardDAO;
	
	
	public List<Map<String, String>> get_reportSignCntList(DashboardDTO dashboardDTO){
		
		List<Map<String, String>> reportSignCntList = this.dashboardDAO.get_reportSignCntList(dashboardDTO);
		return reportSignCntList;
	};	
	
	//------------------------------------------------------------------------
	
	public List<Map<String, String>> get_reportTypeList(DashboardDTO dashboardDTO){
		
		List<Map<String, String>> reportType = this.dashboardDAO.get_reportTypeList(dashboardDTO);
		return reportType;
		
	};
	
	//------------------------------------------------------------------------
	
	public List<Map<String, String>> get_reportSignStateList(DashboardDTO dashboardDTO){
		
		List<Map<String, String>> reportSignState = this.dashboardDAO.get_reportSignStateList(dashboardDTO);
		return reportSignState;
		
	};
	
	//------------------------------------------------------------------------
    public List<Map<String, String>> get_dashboardLoginList(DashboardDTO dashboardDTO){
		
		List<Map<String, String>> dashboardLogin = this.dashboardDAO.get_dashboardLoginList(dashboardDTO);
		return dashboardLogin;
		
	};
	
	//------------------------------------------------------------------------
	public List<Map<String,String>> get_signRequestList(DashboardDTO dashboardDTO){

		List<Map<String, String>> signRequestList = this.dashboardDAO.get_signRequestList(dashboardDTO);
		return signRequestList;
		
	};
	
}
