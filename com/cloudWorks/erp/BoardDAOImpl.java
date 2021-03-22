package com.cloudWorks.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository 
public class BoardDAOImpl implements BoardDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO){
		List<Map<String,String>> boardList = this.sqlSession.selectList(
			"com.cloudWorks.erp.BoardDAO.getBoardList" 
			, boardSearchDTO				 
		);
		 return boardList;
	}
	
	public int getBoardListAllCnt(BoardSearchDTO boardSearchDTO) {
		int boardListAllCnt  = this.sqlSession.selectOne(
			"com.cloudWorks.erp.BoardDAO.getBoardListAllCnt"
			, boardSearchDTO
		);
		return boardListAllCnt;
	}
	
	public int insertBoard(BoardDTO boardDTO) {
		System.out.println("sqlSession.insert 전");
		int boardRegCnt = sqlSession.insert( 				
			"com.cloudWorks.erp.BoardDAO.insertBoard" 
			, boardDTO                           
		);
		System.out.println("sqlSession.insert 실행 성공.......");
		return boardRegCnt; 
	}
	
	
	public BoardDTO  getBoardDTO (int b_no) {
		BoardDTO board = this.sqlSession.selectOne(
			"com.cloudWorks.erp.BoardDAO.getBoardDTO" 
			, b_no							 
		);
		return board;
	}

	
	public int updateReadcount (int b_no) {
		int updateCnt = this.sqlSession.update(
			"com.cloudWorks.erp.BoardDAO.updateReadcount"  
			, b_no									  
		);	
		return updateCnt;
	}

	
	public	int getBoardCnt(BoardDTO  boardDTO) {
		int boardCnt = this.sqlSession.selectOne(
			"com.cloudWorks.erp.BoardDAO.getBoardCnt"
			,boardDTO
		);
		return boardCnt;
	}
	


	public	int getPwdCnt(BoardDTO  boardDTO) {
		int pwdCnt = this.sqlSession.selectOne(
			"com.cloudWorks.erp.BoardDAO.getPwdCnt"
			,boardDTO
		);
		return pwdCnt;
	}
	
	
	public	int updateBoard(BoardDTO  boardDTO) {
		int updateCnt = this.sqlSession.update(
			"com.cloudWorks.erp.BoardDAO.updateBoard"
			,boardDTO
		);
		return updateCnt;
	}
	
	
	public int updatePrint_no(BoardDTO boardDTO) {
		int updatePrintNoCnt  = this.sqlSession.update(
			"com.cloudWorks.erp.BoardDAO.updatePrint_no"
			,boardDTO
		);
		return updatePrintNoCnt;
	}
	
	
	public int deleteBoard(BoardDTO boardDTO) {
		int deleteCnt  = this.sqlSession.delete(
			"com.cloudWorks.erp.BoardDAO.deleteBoard"
			,boardDTO
		);
		return deleteCnt;
	}


}
