package com.cloudWorks.erp;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public interface MypageDAO {
	
	
	public MypageDTO getMypage(MypageDTO mypageDTO);
	
	public int getMypageCnt(MypageDTO mypageDTO);	
	
	public int updateMypage(MypageDTO mypageDTO);	
	
	
	/*
	int getUpdateCnt(MypageDTO mypageDTO);
	
	int getCheckEmpCnt(MypageDTO mypageDTO);
	*/
}
