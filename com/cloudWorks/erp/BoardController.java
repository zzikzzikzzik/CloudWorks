package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Autowired 
	private BoardService boardService;
	
	@RequestMapping( value = "/boardListForm.do")
	public ModelAndView getBoardList(
			BoardSearchDTO boardSearchDTO
			, HttpSession session
			
	) {
		int boardListAllCnt = this.boardService.getBoardListAllCnt(boardSearchDTO);
		if(boardListAllCnt >0 ) {
			int beginRowNo = boardSearchDTO.getSelectPageNo()*boardSearchDTO.getRowCntPerPage()
								- boardSearchDTO.getRowCntPerPage() +1;
			if(boardListAllCnt < beginRowNo) {
				boardSearchDTO.setSelectPageNo(1);
			}
		}
		List<Map<String,String>> boardList = this.boardService.getBoardList(boardSearchDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardListForm.jsp");
		mav.addObject("boardList", boardList);
		mav.addObject("boardListAllCnt", boardListAllCnt);
		return mav;
	}
	
	
	
	@RequestMapping(value ="/boardRegForm.do")
	public ModelAndView goBoardRegForm(
		@RequestParam(value="b_no" ,required=false , defaultValue="0") int b_no
		, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegForm.jsp");
		mav.addObject("b_no" , b_no);
		return mav;
	}
	
	
	@RequestMapping( 
			value = "/boardRegProc.do" 
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int insertBoard(
		BoardDTO boardDTO 
	){
		int boardRegCnt = 0;
		try {

			System.out.println("BoardController.insertBoard 안으로 들어왔어");
			boardRegCnt = this.boardService.insertBoard(boardDTO);
			System.out.println("BoardController.insertBoard 실행성공");
		}
		catch(Exception ex) {
			boardRegCnt = -1;
		}
		return boardRegCnt;
	}
	
	@RequestMapping(value ="/boardContentForm.do")
	public ModelAndView getBoardContentForm(
			@RequestParam( value = "b_no") int b_no 
			, HttpSession session
			
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardContentForm.jsp");
		BoardDTO board = this.boardService.getBoardDTO(b_no);
		mav.addObject("board", board);
		return mav;
	}

	
	
	@RequestMapping(value = "/boardUpDelForm.do", method= RequestMethod.POST)
	public ModelAndView getBoardUpDelForm(
			@RequestParam( value = "b_no") int b_no 
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelForm.jsp");
		BoardDTO boardDTO = this.boardService.getBoardDTO_without_upReadcount(b_no);
		mav.addObject("board", boardDTO);
		return mav;
	}
	
	
	
	
	
	@RequestMapping( 
			value = "boardUpDelProc.do" 
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public  int boardUpDelProc(
			BoardDTO boardDTO 
			, @RequestParam( value = "upDel") String upDel 
	) {
		int boardUpDelCnt=0;
		if(upDel.equals("up")) {
			boardUpDelCnt = this.boardService.updateBoard(boardDTO);
		}
		else {
				boardUpDelCnt = this.boardService.deleteBoard(boardDTO);
		}
		return boardUpDelCnt;
	}
	
}
