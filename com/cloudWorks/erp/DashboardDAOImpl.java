package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DashboardDAOImpl implements DashboardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> get_reportSignCntList(DashboardDTO dashboardDTO){

		List<Map<String, String>> reportSignCntList = this.sqlSession.selectList(
				"com.cloudWorks.erp.DashboardDAO.get_reportSignCntList"		
				, dashboardDTO								
		);
		return reportSignCntList;
		
	}
 
	//-------------------------------------------------------------------------

	public List<Map<String, String>> get_reportTypeList(DashboardDTO dashboardDTO){

		List<Map<String, String>> reportTypeList = this.sqlSession.selectList(
	          "com.cloudWorks.erp.DashboardDAO.get_reportTypeList" 
			  , dashboardDTO 
		);
		return reportTypeList;
  
	}
	  
	//-------------------------------------------------------------------------


	public List<Map<String, String>> get_reportSignStateList(DashboardDTO dashboardDTO){
	  
		List<Map<String, String>> reportSignStateList = this.sqlSession.selectList(
				"com.cloudWorks.erp.DashboardDAO.get_reportSignStateList" 
				, dashboardDTO 
		);
		return reportSignStateList;	  			
	}

	 //-------------------------------------------------------------------------
	  public List<Map<String,String>> get_dashboardLoginList(DashboardDTO dashboardDTO){
		  
		  List<Map<String, String>> dashboardLoginList = this.sqlSession.selectList(
		            "com.cloudWorks.erp.DashboardDAO.get_dashboardLoginList" 
				    , dashboardDTO 
		  );
		  return dashboardLoginList;
	  
	  }
	  
	 //-------------------------------------------------------------------------
	  public List<Map<String,String>> get_signRequestList(DashboardDTO dashboardDTO){
		  
		  List<Map<String, String>> signRequestList = this.sqlSession.selectList(
		            "com.cloudWorks.erp.DashboardDAO.get_signRequestList" 
				    , dashboardDTO 
		  );
		  return signRequestList;
	  
	  }
}
