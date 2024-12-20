package org.carnex.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.carnex.board.vo.BoardVO;
import org.carnex.board.vo.ReplyVO;

public interface BoardPersistence {
	
	public void register(BoardVO bvo) throws Exception;
	
	public List<BoardVO> getBoardList(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	public List<BoardVO> staffBoardList(String searchType, String keyword) throws Exception;
	
	public void upCount(int bno) throws Exception;
	
	public BoardVO getBoardOne(int bno) throws Exception;
	
	public void update(BoardVO bvo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public int getCount(String searchType, String keyword) throws Exception;
	
	
	public Integer getBoardNum() throws Exception;
	
	
	public void upReplyCnt(ReplyVO rvo) throws Exception;
	
	//public void downReplyCnt(@Param("bno") int bno, @Param("amount") int amount) throws Exception;
	public void downReplyCnt(@Param("bno") int bno) throws Exception;

}







