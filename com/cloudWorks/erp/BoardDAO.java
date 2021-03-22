package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;


public interface BoardDAO {
	
	 
	List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO);
	int  getBoardListAllCnt(BoardSearchDTO boardSearchDTO ); 
	

	//-----------------------------------
	 int  insertBoard(BoardDTO boardDTO);
	 

	//-----------------------------------
	 BoardDTO  getBoardDTO(int b_no);
	 int  updateReadcount(int b_no);
	

	//-----------------------------------
	 int getBoardCnt(BoardDTO boardDTO);
	 
	 int getPwdCnt(BoardDTO boardDTO);
	 int updateBoard(BoardDTO boardDTO);
	 
	
	 int updatePrint_no(BoardDTO boardDTO);
	 int deleteBoard(BoardDTO boardDTO);
	
	 
}


