package com.cloudWorks.erp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	
	@Autowired 
	private MypageService mypageService;
	
	private String fileUploadDir = "D:\\프로그래밍\\final_prj_210305_1841\\workspace_최종_bootstrap\\workspace_prj1_210307_통합테스트\\1ST_FINAL_PRJ\\src\\main\\resources\\static\\resources\\img\\";
	
	@RequestMapping("/myPageForm.do")
	public ModelAndView myPageForm(
			MypageDTO mypageDTO
			, HttpSession session
	) {
		mypageDTO.setEmp_no(session.getAttribute("emp_no"));

		MypageDTO mypage = this.mypageService.getMypage(mypageDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageForm.jsp");		
		mav.addObject("mypage", mypage);
		return mav;
	}
	

	@RequestMapping(
			value="/mypageUpProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int updateMypage(
			MypageDTO mypageDTO
			, @RequestParam(value="pic2") MultipartFile multi
	) {
		int updateMypageCnt =  0;
		
		try {
			updateMypageCnt = this.mypageService.updateMypage(mypageDTO, multi);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return updateMypageCnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@RequestMapping(value="/mypageUpProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,String> mypageUpProc(
			MypageDTO mypageDTO
			, @RequestParam(value="pic2") MultipartFile multi
	){
		int mypageUpCnt = 0;
		
		//String checkMsg = "123";
		//---------------------------------------------------------------------------
//		if(multi!=null) {
//			FileUpload fileUpload = null;
//			// FileUpload 객체 생성하기
//			fileUpload = new FileUpload(
//					multi
//					, fileUploadDir
//			);
//			// MultipartFile 객체가 업로드된 파일을 가지고 있고
//			if(multi.isEmpty()==false) {
//				// pic 속성변수에 기존 이미지 이름이 있으면
//				if(mypageDTO.getPic()!=null && mypageDTO.getPic().length()>0) {
//					// pic 속성변수에 기존 이미지 삭제하기
//					fileUpload.delete(fileUploadDir
//							+mypageDTO.getPic()
//					);
//				}
//				// pic 속성변수에 새로운 업로드 이미지 저장하기
//				mypageDTO.setPic(fileUpload.getNewFileName());
//			}
//		}
		
		//---------------------------------------------------------------------------
		
		try {
			//System.out.println(" 컨트롤러 진입");
			mypageUpCnt = this.mypageService.updateMypage(mypageDTO);
	
		}catch(Exception e) {
			mypageUpCnt = -5;
			System.out.println("MypageController.mypageUpProc 메소드 실행시 예외 발생!");
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("mypageUpCnt", mypageUpCnt+"");
		//map.put("checkMsg", checkMsg+"");
		
		return map;
	}
	
	
	*/

}
