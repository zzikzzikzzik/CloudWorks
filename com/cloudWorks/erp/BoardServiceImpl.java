package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	public List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO){
		 List<Map<String,String>> boardList = this.boardDAO.getBoardList(boardSearchDTO);
		 return boardList;
	}

	
	public  int  getBoardListAllCnt( BoardSearchDTO boardSearchDTO) {
		int boardListAllCnt = this.boardDAO.getBoardListAllCnt(boardSearchDTO);
		return boardListAllCnt;
	}
	
	public int insertBoard(BoardDTO boardDTO) {
		int b_no = boardDTO.getB_no();
		System.out.println("BoardServiceImpl.insertBoard 매퍼전성공");
		int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
		System.out.println("BoardServiceImpl.insertBoard 매퍼후성공");
		return boardRegCnt;
	}
	
	public BoardDTO  getBoardDTO(int b_no){
		int updateCnt = this.boardDAO.updateReadcount(b_no);
		
		BoardDTO board = null;
		if(updateCnt==1) {
			 board = this.boardDAO.getBoardDTO(b_no);
		}
		return board;
	}
	
	public BoardDTO  getBoardDTO_without_upReadcount(int b_no){
		BoardDTO boardDTO = this.boardDAO.getBoardDTO(b_no);
		return boardDTO;
	}
	
	public int  updateBoard(BoardDTO boardDTO ){
		
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt==0) {return -1;}
		
		int pwdCnt  = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt==0) {return -2;}
		
		int updateCnt  = this.boardDAO.updateBoard(boardDTO);
		return updateCnt;
	}
	
	public  int  deleteBoard(BoardDTO boardDTO ) {
		
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt==0) {return -1;}
		
		int pwdCnt  = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt==0) {return -2;}
		

		int updatePrint_no  = this.boardDAO.updatePrint_no(boardDTO);
	
		int deleteCnt = this.boardDAO.deleteBoard(boardDTO);
		return deleteCnt;
	}

		
}

