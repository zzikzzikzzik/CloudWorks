package com.cloudWorks.erp;

import java.util.List;
import java.util.Map;


public interface BoardService {
	
	List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO);	
	 
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);
	
	
	 int insertBoard (BoardDTO boardDTO); 


	 BoardDTO  getBoardDTO(int b_no);
	 BoardDTO  getBoardDTO_without_upReadcount(int b_no);
	  

	
	 int  updateBoard(BoardDTO boardDTO );
	 int  deleteBoard(BoardDTO boardDTO );
	  

}


