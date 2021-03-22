package com.cloudWorks.erp;

import org.springframework.web.multipart.MultipartFile;

public interface MypageService {
	
	public MypageDTO getMypage(MypageDTO mypageDTO);
	
	public int updateMypage(MypageDTO mypageDTO, MultipartFile multi) throws Exception;	
	
	//public int updateMypage (MypageDTO mypageDTO);
}
