package com.cloudWorks.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@Service
@Transactional
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;
	private String fileUploadDir = "D:\\프로그래밍\\final_prj_210305_1841\\workspace_통합\\workspace_prj1_210307_최종_bootstrap\\1ST_FINAL_PRJ\\src\\main\\resources\\static\\resources\\img\\";
	
	
	public MypageDTO getMypage(MypageDTO mypageDTO) {
		
		MypageDTO mypage = this.mypageDAO.getMypage(mypageDTO);
		
		return mypage;
		
	}
	
	public int updateMypage(
			MypageDTO mypageDTO
			, MultipartFile multi
	) throws Exception{
		FileUpload3 fileUpload = null;
		
		if(multi!=null && multi.isEmpty()==false) {
			fileUpload = new FileUpload3(
					multi				// MultipartFile 객체
					, fileUploadDir		// 파일 업로드 저장 경로
					, mypageDTO.getPic()	//삭제할 기존 파일명
			);
			mypageDTO.setPic(fileUpload.getNewFileName());
		}
		
		int mypageCnt = this.mypageDAO.getMypageCnt(mypageDTO);
		if(mypageCnt==0) {return -1;}
		
		int updateCnt = this.mypageDAO.updateMypage(mypageDTO);


		if(multi!=null && multi.isEmpty()==false) {
			fileUpload.uploadFile();
		}	
		
		return updateCnt;	
	};	
	
	
	
	
	
	
	
	
	//public int updateMypage(MypageDTO mypageDTO) {
		
		/*FileUpload3 fileUpload = null;
		
		if(multi!=null && multi.isEmpty()==false) {
			// FileUpload 객체 생성하기
			fileUpload = new FileUpload3(
					multi
					, fileUploadDir
					, mypageDTO.getPic()
			);
			// BoardDTO 객체의 속성변수 pic에 새로운 파일명 저장하기
			mypageDTO.setPic(fileUpload.getNewFileName());
		}*/
		
		/*
		System.out.println(" 서비스 getCheckEmpCnt 진입");
		
		
		int checkEmpCnt = this.mypageDAO.getCheckEmpCnt(mypageDTO);
		
		System.out.println(" 서비스 getCheckEmpCnt 나감");
		
		if(checkEmpCnt==0) {return -1;}
		
		System.out.println(" 서비스 업데이트 진입");
			int updateCnt = this.mypageDAO.getUpdateCnt(mypageDTO);
		
		
		System.out.println("  서비스 업데이트 나감");
*/
/*		if(updateCnt==1) {
			// MultipartFile 객체가 업로드된 파일을 가지고 있고
			if(multi.isEmpty()==false) {
				fileUpload.upLoadFile();
			
				System.out.println("파일이미지 변경 성공");
			}
		}*/
	/*	System.out.println("MypageServiceImpl.updateMypage 실행성공");
		
		return updateCnt;
	}
	*/
	
}
