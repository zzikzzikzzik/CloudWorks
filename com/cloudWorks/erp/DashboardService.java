package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

public interface DashboardService {
	
	public List<Map<String, String>> get_reportSignCntList(DashboardDTO dashboardDTO);
	
	public List<Map<String, String>> get_reportTypeList(DashboardDTO dashboardDTO);
	
	public List<Map<String, String>> get_reportSignStateList(DashboardDTO dashboardDTO);

	public List<Map<String,String>> get_dashboardLoginList(DashboardDTO dashboardDTO);

	public List<Map<String,String>> get_signRequestList(DashboardDTO dashboardDTO);
	
}
